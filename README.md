# Countdown
![alt text](https://avatars2.githubusercontent.com/u/1447233?s=140 "Omitsis Consulting S.L.")

## About countdown
Countdown was created to provide a simple and fast way to create our own countdown in apps that need this feature. This countdown counts in seconds, but when the remaining time is less than one minute it counts in tenths.

As you will see, right now is a very simple class, with just some methods to use, but we will upload more methods as soon as somebody need it.

Please, if you want to help us to improve Countdown, send us your opinion to info@omitsis.com or just comment here ;-)

## How to build
To use Countdown you just need to import Countdown.h in your ViewController, just like this `#import "Countdown.h"`.
After include the header, you can create the object using the code:
```
    Countdown *countdown = [[Countdown alloc] initWith:5000];
    countdown.delegate = self;
```
**initWith** method need a parameter, that is the number of milliseconds that will be setted in the countdown to start.

## Current methods
1. -(id)initWith:(int) milliSeconds
2. -(void)start
3. -(void)stop
4. -(void)decrementTotalTimeByMilliseconds
5. -(void)decrementTotalTimeByTenths
6. -(void)timerCycle

## Usage
You can initialize it when you want just with the start method:
`[countdown start];`
And stop it using the stop method:
`[countdown stop];`
Also you will need to create a method in your ViewController to set the value of the countdown where you want, for example in a label:
```
-(void)getTotalTime:(int)number{
    self.countdownLabel.text = [NSString stringWithFormat:@"%d",number];
}
```

This content is released under the (http://opensource.org/licenses/MIT) MIT License.