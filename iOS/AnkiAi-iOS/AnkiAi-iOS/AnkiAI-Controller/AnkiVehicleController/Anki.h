//
//  Anki.h
//  AnkiAI-Controller
//
//  Created by Kleijn, Ronald on 30/03/2018.
//  Copyright © 2018 SAP. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "VehiclesController.h"

@interface Anki : NSObject;

@property(strong, retain) VehiclesController *vehiclesController;
-(void) initialize;
@end

