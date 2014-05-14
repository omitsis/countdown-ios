//
//  CountdownDelegate.h
//  Game Clock
//
//  Created by Albert on 08/05/14.
//  Copyright (c) 2014 Omitsis. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CountdownDelegate <NSObject>

@required
-(void)getTotalTime:(int)number;

@end
