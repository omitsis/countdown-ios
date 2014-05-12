//
//  TimerLabelTest.m
//
//
//  Created by Albert on 07/05/14.
//  Copyright (c) 2014 pruebaOS. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Countdown.h"

@interface CountdownTest : XCTestCase <CountdownDelegate>
{
    int _numberChanged;
    Countdown *_countdownObject;
}
@end

@implementation CountdownTest

static const int DEFAULT_MILLISECONDS = 1200000;

- (void)setUp
{
    [super setUp];
    _countdownObject = [[Countdown alloc] initWith:DEFAULT_MILLISECONDS];
    _countdownObject.delegate = self;

}

- (void)tearDown
{
    [super tearDown];
}


-(void)testThatCountdownCanBeCreated
{
    [_countdownObject start];
    XCTAssertNotNil(_countdownObject, @"CountdownObject can not be created");
}

-(void)testThatCountdownHasNSTimerSetted
{
    [_countdownObject start];
    XCTAssertNotNil(_countdownObject.timer, @"Timer is not setted in TimerLabelObject");
}


-(void)testThatCountdownTotalTimeDecreases
{
    int expected = 1199000;
    [_countdownObject timerCycle];
    XCTAssertTrue(expected == _numberChanged, @"The expected timer value was %i but the real value is %i", expected, _numberChanged);
}

-(void)testThatCountdownTotalTimeLowerThan60SecondsStepsInTenths
{
    int expected = 59900;
    Countdown *countdownObject = [[Countdown alloc] initWith:60000];
    [countdownObject start];
    XCTAssertTrue(expected == countdownObject.totalTime, @"The expected value was %i but the real value is %i", expected, countdownObject.totalTime);
}

-(void)testThatCountdownTotalTimeLowerThan61SecondsStepsInTenths
{
    int expected = 59900;
    Countdown *countdownObject = [[Countdown alloc] initWith:61000];
    [countdownObject timerCycle];
    [countdownObject timerCycle];
    XCTAssertTrue(expected == countdownObject.totalTime, @"The expected value was %i but the real value is %i", expected, countdownObject.totalTime);
}

-(void)testThatCountdownStops
{
    [_countdownObject start];
    [_countdownObject stop];
    
    XCTAssertTrue(_countdownObject.timer == nil, @"Timer is still running");
}

-(void)testThatCountdownTimerIsStoppedWhenTotalTimeIs0
{
    [_countdownObject start];
    _countdownObject.totalTime = 0;
    [_countdownObject decrementTotalTimeByTenths];
    XCTAssertTrue(_countdownObject.timer == nil, @"Timer is still running");
}

-(void)getTotalTime:(int)number
{
    _numberChanged = number;
}

@end
