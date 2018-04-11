//
//  Anki.m
//  AnkiAI-Controller
//
//  Created by Kleijn, Ronald on 30/03/2018.
//  Copyright © 2018 SAP. All rights reserved.
//

#import "Anki.h"
#import "VehiclesController.h"


@implementation Anki

-(void) initialize {
    NSLog(@"Anki vehicle controller startup in progress.....");
    NSLog(@"Please hold off the commands until startup has finished.");
    _vehiclesController = [VehiclesController new];
}

@end
