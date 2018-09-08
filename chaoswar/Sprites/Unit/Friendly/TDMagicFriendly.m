//
//  TDMagicFriendly.m
//  chaoswar
//
//  Created by Mac on 11-10-27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TDMagicFriendly.h"
#import "GamePubDef.h"
#import "TDSprite.h"
#import "TDEnemy.h"
#import "GameController.h"
#import "SpriteInfoScene.h"

@implementation MFDead

@synthesize friendly = _friendly;
@synthesize deadTime = _deadTime;

- (BOOL) run {
    if (!_friendly) {
        return NO;
    }
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(autoDead:) forTarget:self interval:1 paused:NO];
    return YES;
}

- (BOOL) stop {
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    return YES;
}

//自动死亡
- (void) autoDead:(ccTime)dt {
    _deadTime = _deadTime - 1;
    _friendly.deadTime = _deadTime;
    if (_deadTime <= 0) {
        [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
        [_friendly cleanup];
        _friendly.spriteStatus = TSS_DEADING;
    }
}

- (void)dealloc {
    [self stop];
    [super dealloc];
}

@end;

@implementation TDMagicFriendly

-(id) init
{
	if( (self=[super init])) {
        _mfDead = [[MFDead alloc] init];
	}
	return self;
}

- (void)dealloc {
    [_mfDead stop];
    [_mfDead release];
    [super dealloc];
}

- (BOOL) run
{
    if ([super run] == NO) return NO;
    _mfDead.friendly = self;
    _mfDead.deadTime = _deadTime;
    [_mfDead run];
    return YES;
}

- (void) showImformation {
    NSLog(@"smallPic is %@", self.smallPic);
    [[GameController getGameController].spriteInfo showMagicFriendlyInfo];
    [[GameController getGameController].spriteInfo setSmallPic:self.smallPic];
    [[GameController getGameController].spriteInfo setAttact:self.attact];
    [[GameController getGameController].spriteInfo setAttactSpeed:self.attacttime];
    [[GameController getGameController].spriteInfo setBloodNum:self.currentHP];
    [[GameController getGameController].spriteInfo setMoveSpeed:self.moveSpeed];
    [[GameController getGameController].spriteInfo setLiveTime:self.deadTime];
}
- (ccTime) deadTime {
    return _deadTime;
}

- (void) setDeadTime:(ccTime)dt {
    _deadTime = dt;
    if (self.isSelected) {
        [[GameController getGameController].spriteInfo setLiveTime:self.deadTime];
    }
}

@end

@implementation TDMagicFriendly1

+ (id) getSprite {
    TDMagicFriendly1 *friendly = [TDMagicFriendly1 spriteWithSpriteFrameName:@"mcf01mv0001.png"];
    if (friendly) {
        friendly.firstFrameName = @"mcf01mv0001.png";
        [friendly setScale:TDS_MFL1_SCALE];
        friendly.maxHP = TDS_MFL1_MAXHP;
        friendly.currentHP = TDS_MFL1_CURRENTHP;
        friendly.moveSpeed = TDS_MFL1_MOVESPEED;
        friendly.attacttime = TDS_MFL1_ATTACTTIME;
        friendly.attactRange = TDS_MFL1_ATTACTRANGE;     
        friendly.attact = TDS_MFL1_ATTACT;
        friendly.attactMode = TDS_MFL1_ATTACTMODE;
        friendly.defence = TDS_MFL1_DEFENCE;
        friendly.defenceMode = TDS_MFL1_DEFENCEMODE;
        friendly.searchRange = TDS_MFL1_SEARCHRANGE;
        friendly.deadTime = TDS_MFL1_DEADTIME;
        friendly.mvAniName = [NSString stringWithFormat:@"mcf%02dmv", 1];
        friendly.ddAniName = [NSString stringWithFormat:@"mcf%02ddd", 1];
        friendly.atAniName = [NSString stringWithFormat:@"mcf%02dat", 1];
        friendly.smallPic = @"smmagic01.png";
    }
    return friendly;
}

@end

@implementation TDMagicFriendly2

+ (id) getSprite {
    TDMagicFriendly2 *friendly = [TDMagicFriendly2 spriteWithSpriteFrameName:@"mcf02mv0001.png"];
    if (friendly) {
        friendly.firstFrameName = @"mcf02mv0001.png";
        [friendly setScale:TDS_MFL2_SCALE];
        friendly.maxHP = TDS_MFL2_MAXHP;
        friendly.currentHP = TDS_MFL2_CURRENTHP;
        friendly.moveSpeed = TDS_MFL2_MOVESPEED;
        friendly.attacttime = TDS_MFL2_ATTACTTIME;
        friendly.attactRange = TDS_MFL2_ATTACTRANGE;     
        friendly.attact = TDS_MFL2_ATTACT;
        friendly.attactMode = TDS_MFL2_ATTACTMODE;
        friendly.defence = TDS_MFL2_DEFENCE;
        friendly.defenceMode = TDS_MFL2_DEFENCEMODE;
        friendly.searchRange = TDS_MFL2_SEARCHRANGE;
        friendly.deadTime = TDS_MFL2_DEADTIME;
        friendly.mvAniName = [NSString stringWithFormat:@"mcf%02dmv", 2];
        friendly.ddAniName = [NSString stringWithFormat:@"mcf%02ddd", 2];
        friendly.atAniName = [NSString stringWithFormat:@"mcf%02dat", 2];
        friendly.smallPic = @"smmagic02.png";
    }
    return friendly;
}

@end

