//
//  UpdateInfo.m
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "UpdateInfo.h"


@implementation UpdateInfo

@synthesize Update_Info_ID = _Update_Info_ID;
@synthesize Level = _Level;
@synthesize PictureName = _PictureName;
@synthesize Position = _Position;
@synthesize Explain2 = _Explain2;
@synthesize Explain3 = _Explain3;

- (void)dealloc {
    [_PictureName release];
    [_Position release];
    [_Explain2 release];
    [_Explain3 release];
    [super dealloc];
}

@end
