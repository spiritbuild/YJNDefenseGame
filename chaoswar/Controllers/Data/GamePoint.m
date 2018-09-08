//
//  GamePoint.m
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "GamePoint.h"


@implementation GamePoint

@synthesize Game_Point_ID = _Game_Point_ID;
@synthesize Is_Open = _Is_Open;
@synthesize Position = _Position;
@synthesize Score = _Score;

- (void)dealloc {
    [_Position release];
    [super dealloc];
}

@end
