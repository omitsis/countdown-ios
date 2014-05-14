//
//  Countdown.h
//
//  Created by Albert on 07/05/14.
//  Copyright (c) 2014 Omitsis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CountdownProtocol.h"

@interface Countdown : NSObject{
    NSTimer *timer;
    int totalTime;
}

@property (nonatomic,strong) id <CountdownProtocol> delegate;
@property (strong) NSTimer *timer;
@property (assign) int totalTime;

-(id) init __attribute__((unavailable("To initialize the countdown you have to use 'initWith method.")));
-(id)initWith:(int)milliSeconds;
-(void)start;
-(void)stop;
-(void)decrementTotalTimeByMilliseconds;
-(void)decrementTotalTimeByTenths;
-(void)timerCycle;
@end
