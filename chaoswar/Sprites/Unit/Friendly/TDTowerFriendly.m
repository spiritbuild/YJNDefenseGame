//
//  TDTowerFriendly.m
//  chaoswar
//
//  Created by Mac on 11-10-27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TDTowerFriendly.h"
#import "TDDefenceTower.h"
#import "GamePubDef.h"
#import "TDSprite.h"
#import "TDEnemy.h"

@implementation TDTowerFriendly

@synthesize tower = _tower;

- (void) setTower:(TDDefenceTower *)t
{
    if (_tower) {
        [_tower delFriendly:self];
    }
    _tower = t;
    if (_tower) {
        if (![_tower addFriendly:self]) {
            _tower = nil;
        }
    }
}

- (void) clearSpriteData
{
    //发射的防御塔清空
    self.tower = nil;
    self.enemy = nil;
    [super clearSpriteData];
}

@end

@implementation TDTowerFriendly1

+ (id) getSprite {
    TDTowerFriendly1 *friendly = [TDTowerFriendly1 spriteWithSpriteFrameName:@"dtf01mv0001.png"];
    if (friendly) {
        friendly.firstFrameName = @"dtf01mv0001.png";
        [friendly setScale:TDS_TFL1_SCALE];
        friendly.maxHP = TDS_TFL1_MAXHP;
        friendly.currentHP = TDS_TFL1_CURRENTHP;
        friendly.moveSpeed = TDS_TFL1_MOVESPEED;
        friendly.attacttime = TDS_TFL1_ATTACTTIME;
        friendly.attactRange = TDS_TFL1_ATTACTRANGE;     
        friendly.attact = TDS_TFL1_ATTACT;
        friendly.attactMode = TDS_TFL1_ATTACTMODE;
        friendly.defence = TDS_TFL1_DEFENCE;
        friendly.defenceMode = TDS_TFL1_DEFENCEMODE;
        friendly.searchRange = TDS_TFL1_SEARCHRANGE;
        friendly.mvAniName = [NSString stringWithFormat:@"dtf%02dmv", 1];
        friendly.ddAniName = [NSString stringWithFormat:@"dtf%02ddd", 1];
        friendly.atAniName = [NSString stringWithFormat:@"dtf%02dat", 1];
        friendly.smallPic = [NSString stringWithFormat:@"smdtf%02d.png", 1];
    }
    return friendly;
}

@end

@implementation TDTowerFriendly2

+ (id) getSprite {
    TDTowerFriendly2 *friendly = [TDTowerFriendly2 spriteWithSpriteFrameName:@"dtf02mv0001.png"];
    if (friendly) {
        friendly.firstFrameName = @"dtf02mv0001.png";
        [friendly setScale:TDS_TFL2_SCALE];
        friendly.maxHP = TDS_TFL2_MAXHP;
        friendly.currentHP = TDS_TFL2_CURRENTHP;
        friendly.moveSpeed = TDS_TFL2_MOVESPEED;
        friendly.attacttime = TDS_TFL2_ATTACTTIME;
        friendly.attactRange = TDS_TFL2_ATTACTRANGE;     
        friendly.attact = TDS_TFL2_ATTACT;
        friendly.attactMode = TDS_TFL2_ATTACTMODE;
        friendly.defence = TDS_TFL2_DEFENCE;
        friendly.defenceMode = TDS_TFL2_DEFENCEMODE;
        friendly.searchRange = TDS_TFL2_SEARCHRANGE;
        friendly.mvAniName = [NSString stringWithFormat:@"dtf%02dmv", 2];
        friendly.ddAniName = [NSString stringWithFormat:@"dtf%02ddd", 2];
        friendly.atAniName = [NSString stringWithFormat:@"dtf%02dat", 2];
        friendly.smallPic = [NSString stringWithFormat:@"smdtf%02d.png", 2];
    }
    return friendly;
}

@end

@implementation TDTowerFriendly3

+ (id) getSprite {
    TDTowerFriendly3 *friendly = [TDTowerFriendly3 spriteWithSpriteFrameName:@"dtf03mv0001.png"];
    if (friendly) {
        friendly.firstFrameName = @"dtf03mv0001.png";
        [friendly setScale:TDS_TFL3_SCALE];
        friendly.maxHP = TDS_TFL3_MAXHP;
        friendly.currentHP = TDS_TFL3_CURRENTHP;
        friendly.moveSpeed = TDS_TFL3_MOVESPEED;
        friendly.attacttime = TDS_TFL3_ATTACTTIME;
        friendly.attactRange = TDS_TFL3_ATTACTRANGE;     
        friendly.attact = TDS_TFL3_ATTACT;
        friendly.attactMode = TDS_TFL3_ATTACTMODE;
        friendly.defence = TDS_TFL3_DEFENCE;
        friendly.defenceMode = TDS_TFL3_DEFENCEMODE;
        friendly.searchRange = TDS_TFL3_SEARCHRANGE;
        friendly.mvAniName = [NSString stringWithFormat:@"dtf%02dmv", 3];
        friendly.ddAniName = [NSString stringWithFormat:@"dtf%02ddd", 3];
        friendly.atAniName = [NSString stringWithFormat:@"dtf%02dat", 3];
        friendly.smallPic = [NSString stringWithFormat:@"smdtf%02d.png", 3];
    }
    return friendly;
}

@end



