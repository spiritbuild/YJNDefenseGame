//
//  GameProcess.m
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "GameProcess.h"


@implementation GameProcess

@synthesize Key_Name = _Key_Name;
@synthesize Key_Type = _Key_Type;
@synthesize Key_Count = _Key_Count;

- (void)dealloc {
    [_Key_Name release];
    [_Key_Type release];
    [super dealloc];
}

@end
