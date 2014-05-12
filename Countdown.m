//
//  Countdown.m
//
//  Created by Albert on 07/05/14.
//  Copyright (c) 2014 Omitsis. All rights reserved.
//

#import "Countdown.h"

@implementation Countdown

@synthesize totalTime, delegate, timer;


-(id)initWith:(int) milliSeconds
{
    self = [super init];
    if (self) {
        float intervalTime = 1;
        if (milliSeconds <= 60000) {
            intervalTime = 0.1;
        }
        self.timer  = [NSTimer scheduledTimerWithTimeInterval:intervalTime
                                                       target:self
                                                     selector:@selector(timerCycle)
                                                     userInfo:nil
                                                      repeats:YES];
        self.totalTime = milliSeconds;
    }
    return self;
}

#pragma mark - timer methods

-(void)start
{
    [self.timer fire];
}

-(void)stop
{
    if ([self.timer isValid]) {
        [self.timer invalidate];
    }
    self.timer = nil;
}

- (void)decrementTotalTimeByMilliseconds
{
    if (self.totalTime > 0) {
        self.totalTime = self.totalTime - 1000;
    }
}

- (void)decrementTotalTimeByTenths
{
    if (self.totalTime > 0) {
        self.totalTime = self.totalTime - 100;
    } else {
        [self stop];
    }
}

-(void)timerCycle
{
    if (self.totalTime <= 60000){
        if ([self.timer timeInterval] >= 1) {
            NSDate *currentDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0.1];
            [self.timer setFireDate:currentDate];
        }
        [self decrementTotalTimeByTenths];
    } else {
        [self decrementTotalTimeByMilliseconds];
    }
    
    [self.delegate getTotalTime:self.totalTime];
}

@end
