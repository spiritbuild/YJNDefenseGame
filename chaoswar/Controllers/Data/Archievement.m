//
//  Archievement.m
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Archievement.h"


@implementation Archievement

@synthesize Archievement_ID = _Archievement_ID;
@synthesize PictureName = _PictureName;
@synthesize Position = _Position;
@synthesize Explain = _Explain;
@synthesize Is_Open = _Is_Open;
@synthesize Has_Scores = _Has_Scores;

- (void)dealloc {
    [_PictureName release];
    [_Position release];
    [_Explain release];
    [super dealloc];
}

@end
