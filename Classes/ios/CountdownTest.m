//
//  TimerLabelTest.m
//  Game Clock
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


-(void)testCountdownCanBeCreated
{
    XCTAssertNotNil(_countdownObject, @"CountdownObject can not be created");
}

-(void)testCountdownHasNSTimerSetted
{
    XCTAssertNotNil(_countdownObject.timer, @"Timer is not setted in TimerLabelObject");
}


-(void)testCountdownTotalTimeDecreases
{
    int expected = 1199000;
    [_countdownObject timerCycle];
    XCTAssertTrue(expected == _countdownObject.totalTime, @"The expected timer value was %i but the real value is %i", expected, _countdownObject.totalTime);
}

-(void)testCountdownTotalTimeLowerThan60SecondsStepsInTenths
{
    int expected = 59900;
    Countdown *countdownObject = [[Countdown alloc] initWith:60000];
    [countdownObject timerCycle];
    XCTAssertTrue(expected == countdownObject.totalTime, @"The expected value was %i but the real value is %i", expected, countdownObject.totalTime);
}

-(void)testCountdownTotalTimeLowerThan61SecondsStepsInTenths
{
    int expected = 59900;
    Countdown *countdownObject = [[Countdown alloc] initWith:61000];
    [countdownObject timerCycle];
    [countdownObject timerCycle];
    XCTAssertTrue(expected == countdownObject.totalTime, @"The expected value was %i but the real value is %i", expected, countdownObject.totalTime);
}

-(void)testCountdownStops
{
    [_countdownObject start];
    [_countdownObject stop];
    
    XCTAssertTrue(_countdownObject.timer == nil, @"Timer is still running");
}

-(void)testCountdownTimerIsStoppedWhenTotalTimeIs0
{
    _countdownObject.totalTime = 0;
    [_countdownObject decrementTotalTimeByTenths];
    XCTAssertTrue(_countdownObject.timer == nil, @"Timer is still running");
}

#pragma mark - CountdownDelegate

-(void)getTotalTime:(int)number
{
    _numberChanged = number;
}

@end
