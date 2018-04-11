//
//  Vehicle.m
//  AnkiVehicleController
//
//  Created by Jeff on 4/24/15.
//  Copyright (c) 2015 Jeff. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

-(id) initWithController:(id) controller
{
    self = [super init];
    _controller = controller;
    _active = false;
    _driving = false;
    _currentPiece = 0;
    _batteryLevel = 0;
    _scanning = false;
    _scanningStartFinish = false;
    return self;
}

/*
 ---- Instance methods
 */

-(bool) isActive {
    return _active;
}

-(bool) isDriving {
    return _driving;
}

-(void) setSpeed:(float) speed {
    anki_vehicle_msg_t msg;
    memset(&msg, 0, sizeof(msg));
    uint8_t size = anki_vehicle_msg_set_speed(&msg, speed, 25000);
    [self sendMessage:&msg withLength:size];
}

-(void) spin180 {
    anki_vehicle_msg_t msg;
    memset(&msg, 0, sizeof(msg));
    uint8_t size = anki_vehicle_msg_turn_180(&msg);
    [self sendMessage:&msg withLength:size];
}

-(int) getBatteryLevel {
    anki_vehicle_msg_t msg;
    memset(&msg, 0, sizeof(msg));
    uint8_t size = anki_vehicle_msg_get_battery_level(&msg);
    [self sendMessage:&msg withLength:size];
    return _batteryLevel;
}

-(void) changeLane:(float) speed withOffset:(float) offset {
    anki_vehicle_msg_t msg;
    memset(&msg, 0, sizeof(msg));
    uint8_t size = anki_vehicle_msg_change_lane(&msg, speed, 1000, offset);
    [self sendMessage:&msg withLength:size];
}

-(void) sendMessage:(void*) buffer withLength:(uint8_t)len {
    NSData * valData = [NSData dataWithBytes:buffer length:len];
    [_peripheral writeValue:valData forCharacteristic:_writeChannel type:CBCharacteristicWriteWithoutResponse];
}


/*
 ---- Peripheral callback methods
 */

/*
 Invoked upon completion of a -[discoverServices:] request.
 */
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    if (error)
    {
        NSLog(@"Discovered services for %@ with error: %@", peripheral.name, [error localizedDescription]);
        return;
    }
    assert(peripheral.services.count == 1);
    CBService *service = (CBService*)[peripheral.services objectAtIndex:0];
    NSLog(@"Discovered service, Id=%@", [service.UUID UUIDString]);
    [peripheral discoverCharacteristics:nil forService:service];
}

/*
 Invoked upon completion of a -[discoverCharacteristics:forService:] request.
 */
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error
{
    if (error)
    {
        NSLog(@"Discovered characteristics for %@ with error: %@", service.UUID, [error localizedDescription]);
        return;
    }
    
    for (CBCharacteristic * characteristic in service.characteristics)
    {
        if([characteristic.UUID isEqual:[CBUUID UUIDWithString:@ANKI_STR_CHR_WRITE_UUID]])
        {
            _writeChannel = characteristic;
            NSLog(@"Discovered write channel");
        }
        if([characteristic.UUID isEqual:[CBUUID UUIDWithString:@ANKI_STR_CHR_READ_UUID]])
        {
            _readChannel = characteristic;
            NSLog(@"Discovered read channel");
        }
    }
    
    [_peripheral setNotifyValue:YES forCharacteristic:_readChannel];
    
    anki_vehicle_msg_t msg;
    uint8_t size = 0;
    memset(&msg, 0, sizeof(msg));
    size = anki_vehicle_msg_set_sdk_mode(&msg, 1, ANKI_VEHICLE_SDK_OPTION_OVERRIDE_LOCALIZATION);
    [self sendMessage:&msg withLength:size];
    
    memset(&msg, 0, sizeof(msg));
    anki_vehicle_msg_get_version(&msg);
    [self sendMessage:&msg withLength:size];
    
    _active = true;
    
    [self doScanTrack];
}

/*
 Invoked upon completion of a -[readValueForCharacteristic:] request or on the reception of a notification/indication.
 */
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    if (error)
    {
        NSLog(@"Error updating value for characteristic %@ error: %@", characteristic.UUID, [error localizedDescription]);
        return;
    }
    
    anki_vehicle_msg_t msg;

    [characteristic.value getBytes:&msg length:sizeof(anki_vehicle_msg_t)];
    
    switch (msg.msg_id) {
        case ANKI_VEHICLE_MSG_V2C_PING_RESPONSE:
            NSLog(@"Ping recieved from vehicle");
            break;
        case ANKI_VEHICLE_MSG_V2C_VERSION_RESPONSE:
        {
            anki_vehicle_msg_version_response_t versionMsg;
            [characteristic.value getBytes:&versionMsg length:sizeof(anki_vehicle_msg_version_response_t)];
            NSLog(@"Version response 0x%04x\n", versionMsg.version);
            break;
        }
        case ANKI_VEHICLE_MSG_V2C_LOCALIZATION_POSITION_UPDATE:
        {
            anki_vehicle_msg_localization_position_update_t updateMsg;
            [characteristic.value getBytes:&updateMsg length:sizeof(anki_vehicle_msg_localization_position_update_t)];
            int piece = updateMsg._reserved[1];
            if(_currentPiece != piece){
                NSLog(@"Loc Pos Response TrackPos: %d PieceId: %d IsClockwise: %d", updateMsg._reserved[0], updateMsg._reserved[1], updateMsg.is_clockwise);
                _currentPiece = piece;
                NSMutableDictionary *data = [NSMutableDictionary dictionaryWithCapacity:1];
                NSNumber *currentPieceNr = [NSNumber numberWithInt:piece];
                NSNumber *currentBatteryLevel = [NSNumber numberWithInt:_batteryLevel];
                
                if(updateMsg.is_clockwise == 71){
                    [data setValue:@"true" forKey:@"clockWise"];
                }else if(updateMsg.is_clockwise == 7){
                    [data setValue:@"false" forKey:@"clockWise"];
                }
                
                if (_scanning){
                    [data setValue:@"true" forKey:@"isTrackScanning"];
                }else{
                    [data setValue:@"false" forKey:@"isTrackScanning"];
                }
                
                [data setValue:currentPieceNr forKey:@"currentPiece"];
                [data setValue:currentBatteryLevel forKey:@"batteryLevel"];
                [data setValue:[self getModelName] forKey:@"carName"];
                
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data
                                                                   options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                                     error:&error];
                
                bool doNotIgnore = true;
                
                if(piece == 33){
                    [self getBatteryLevel];
                    if(_scanning){
                        if(_scanningStartFinish){
                            _scanning = false;
                            _scanningStartFinish = false;
                            [self sendDataOverHttp:jsonData scanTrack:true];
                            doNotIgnore = false;
                            [self setSpeed:600];
                        }else{
                            _scanningStartFinish = true;
                        }
                    }
                }
                if(_scanning){
                    if(_scanningStartFinish){
                        [self sendDataOverHttp:jsonData scanTrack:true];
                    }
                }else{
                    if(doNotIgnore){
                      [self sendDataOverHttp:jsonData scanTrack:false];
                    }
                }
            }
            
            break;
        }
        case ANKI_VEHICLE_MSG_V2C_LOCALIZATION_TRANSITION_UPDATE:
        {
            anki_vehicle_msg_localization_transition_update_t transitionMsg;
            [characteristic.value getBytes:&transitionMsg length:sizeof(anki_vehicle_msg_localization_transition_update_t)];
            break;
        }
        case ANKI_VEHICLE_MSG_V2C_VEHICLE_DELOCALIZED:
        {
            NSLog(@"Warning: vehicle delocalized id=0x%04x", _identifier);
            break;
        }
        case ANKI_VEHICLE_MSG_V2C_BATTERY_LEVEL_RESPONSE:
        {
            anki_vehicle_msg_battery_level_response_t batteryMsg;
            [characteristic.value getBytes:&batteryMsg length:sizeof(anki_vehicle_msg_battery_level_response_t)];
            [self setBattLevel:batteryMsg.battery_level];
            NSLog(@"Battery Level %d", _batteryLevel);
            break;
        }
    }
}

/*
 Invoked upon completion of a -[writeValue:forCharacteristic:] request.
 */
- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    if (error)
    {
        NSLog(@"Error writing value for characteristic %@ error: %@", characteristic.UUID, [error localizedDescription]);
        return;
    }
}

/*
 Invoked upon completion of a -[setNotifyValue:forCharacteristic:] request.
 */
- (void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    if (error)
    {
        NSLog(@"Error updating notification state for characteristic %@ error: %@", characteristic.UUID, [error localizedDescription]);
        return;
    }
}

/*
 ---- Helper methods
 */

/*
 Initiate track scanning in first lap to generate track etc on dash
*/
- (void) doScanTrack{
    _scanning = true;
    [self resetMLData];
    [self setSpeed:300];
    //Make sure we get some carInfo
    [self getBatteryLevel];
}

/*
 Called to translate to battery level
 High Battery level is 4150 and Low Battery Level is 3350
 From that range following levels are being used:
    Level 5: > 3990
    Level 4: 3990 < batteryLevel > 3830
    Level 3: 3830 < batteryLevel > 3670
    Level 2: 3670 < batteryLevel > 3510
    Level 1: batt < 3510
  */
- (void) setBattLevel:(int)batteryLevel{
    int currBatteryLevel = 0;
    if (batteryLevel > 3990){
        currBatteryLevel = 5;
    }else if(batteryLevel < 3990 && batteryLevel > 3830){
        currBatteryLevel = 4;
    }else if(batteryLevel < 3830 && batteryLevel > 3670){
        currBatteryLevel = 3;
    }else if(batteryLevel < 3670 && batteryLevel > 3510){
        currBatteryLevel = 2;
    }else if(batteryLevel < 3510){
        currBatteryLevel = 1;
    }else{
        currBatteryLevel = 0;
    }
    
    //Removing any spikes of batterylevel which gives odd batterylevel values for the user.
    if( currBatteryLevel < _batteryLevel ){
        _batteryLevel = currBatteryLevel;
    }
    
    //Assuring we resetting the batterylevel in case a new car is set on the track.
    if( currBatteryLevel > _batteryLevel + 1){
        _batteryLevel = currBatteryLevel;
    }
}

/*
 Called to translate to string model name
 */
- (NSString*) getModelName {
    //9 Skull
    //10 Thermo
    //8 GroundShock
    //9 FreeWheel
    
    switch(_modelIdentifier){
        case(9):
            return @"Skull";
        case(10):
            return @"Thermo";
        case(8):
            return @"GroundShock";
        case(15):
            return @"FreeWheel";
        default:
            return @"";
    }
    
}

/*
 Called to steer the vehicle. Currently 2 action only possible
 */
-(void) doAction:(int) action {
    switch (action)
    {
        case 0:
            [self changeLane:600 withOffset:-50];
            break;
        case 1:
            [self changeLane:600 withOffset:50];
            break;
        default:
            NSLog(@"No known action to do");
            break;
    }
}

/*
 Called to reset the ML model when a new session is started
 */
- (void) resetMLData{
    //TODO: Configure url string
    NSURL *url = [NSURL URLWithString:@"https://<host>/ankiai/api/v1.0/ml/reset"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];

    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSLog(@"ML Model Reset");
         }else{
             NSLog(@"REST Call Error is %@", connectionError.description);
             
         }
     }];
}

/*
 Called to call VM with ML model
 */
- (void) sendDataOverHttp:(NSData*) jsonData scanTrack:(BOOL) scanningTrack {
    NSURL *url = NULL;
    
    //TODO: Configure url string
    if(scanningTrack){
        url = [NSURL URLWithString:@"https://<host>/ankiai/api/v1.0/ml/trackscan"];
    }else{
        url = [NSURL URLWithString:@"https://<host>/ankiai/api/v1.0/ml"];
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"Bearer <oath token>" forHTTPHeaderField:@"Authorization"];
    [request setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody: jsonData];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSError *error1;
             NSMutableDictionary * innerJson = [NSJSONSerialization
                                                JSONObjectWithData:data options:kNilOptions error:&error1
            ];
             NSNumber *action = innerJson[@"a"];
             [self doAction: action.intValue];
         }else{
             NSLog(@"REST Call Error is %@", connectionError.description);
             
         }
     }];
}

@end
