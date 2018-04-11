//
//  Vehicle.h
//  AnkiVehicleController
//
//  Created by Jeff on 4/24/15.
//  Copyright (c) 2015 Jeff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

#import "anki_sdk/anki_util.h"
#import "anki_sdk/common.h"
#import "anki_sdk/eir.h"
#import "anki_sdk/protocol.h"
#import "anki_sdk/uuid.h"
#import "anki_sdk/vehicle_gatt_profile.h"

@interface Vehicle : NSObject<CBPeripheralDelegate>

@property (retain) CBPeripheral *peripheral;
@property (retain) CBCharacteristic *readChannel;
@property (retain) CBCharacteristic *writeChannel;
@property (retain) id controller;
@property bool active;
@property bool scanning;
@property bool scanningStartFinish;
@property bool driving;
@property int currentPiece;
@property int batteryLevel;
@property uint32_t identifier;
@property uint8_t modelIdentifier;

-(id) initWithController:(id) controller;
-(bool) isActive;
-(bool) isScanning;
-(bool) isScanningStartFinish;
-(bool) isTrack;
-(int) getCurrentPiece;
-(int) getBatteryLevel;
-(NSString*) getModelName;
-(void) theAction;
-(void) setSpeed:(float) speed;
-(void) changeLane:(float) speed withOffset:(float) offset;
-(void) spin180;
@end
