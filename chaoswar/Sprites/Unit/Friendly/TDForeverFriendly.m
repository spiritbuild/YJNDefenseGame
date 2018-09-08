//
//  TDForeverFriendly.m
//  chaoswar
//
//  Created by Mac on 11-10-27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TDForeverFriendly.h"
#import "GamePubDef.h"
#import "TDSprite.h"
#import "TDEnemy.h"

@implementation TDForeverFriendly

@end

@implementation TDForeverFriendly1

+ (id) getSprite {
    TDForeverFriendly1 *friendly = [TDForeverFriendly1 spriteWithSpriteFrameName:@"ft01mv0001.png"];
    if (friendly) {
        friendly.firstFrameName = @"ft01mv0001.png";
        [friendly setScale:TDS_FFL1_SCALE];
        friendly.maxHP = TDS_FFL1_MAXHP;
        friendly.currentHP = TDS_FFL1_CURRENTHP;
        friendly.moveSpeed = TDS_FFL1_MOVESPEED;
        friendly.attacttime = TDS_FFL1_ATTACTTIME;
        friendly.attactRange = TDS_FFL1_ATTACTRANGE;     
        friendly.attact = TDS_FFL1_ATTACT;
        friendly.attactMode = TDS_FFL1_ATTACTMODE;
        friendly.defence = TDS_FFL1_DEFENCE;
        friendly.defenceMode = TDS_FFL1_DEFENCEMODE;
        friendly.searchRange = TDS_FFL1_SEARCHRANGE;
//        friendly.mvAniName = [NSString stringWithFormat:@"fcf%02dmv", 1];
//        friendly.ddAniName = [NSString stringWithFormat:@"fcf%02ddd", 1];
//        friendly.atAniName = [NSString stringWithFormat:@"fcf%02dat", 1];
//        friendly.smallPic = [NSString stringWithFormat:@"smmagic02.png", 1];
    }
    return friendly;
}

@end

