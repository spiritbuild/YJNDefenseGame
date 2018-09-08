//
//  GnDataController.m
//  chaoswar
//
//  Created by apple on 12-1-5.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "GnDataController.h"
#import "GamePoint.h"
#import "GamePointList.h"
#import "UpdateInfoList.h"
#import "UpdateInfo.h"
#import "GameProcessList.h"
#import "ArchievementList.h"

@implementation GnDataController

+(void) setSelect:(int)selectIndex s:(int)s
{
    int index = selectIndex + 1;
    int nextIndex = index + 1;
    
    [GamePointList setScore:index Value:s];
    [GamePointList setIsOpen:nextIndex Value:1];
}

+(int) getGameScore
{
    int allScore = [GamePointList getAllOpenPoint];
    int archievementScore = [ArchievementList getArchievementScore];
    allScore = allScore + archievementScore;
    int usedScore = [UpdateInfoList getAllLevel];
    usedScore = usedScore - 8;
    
    return (allScore - usedScore + 0);
}

+(void) setFirst
{
    [GamePointList resetDataBase];
    [UpdateInfoList resetDataBase];
    [GameProcessList resetDataBase];
    [ArchievementList resetDataBase];
}

+(int) getMagicFireLevel
{
    return [UpdateInfoList getLevelByUpdataInfoId:2];
}

+(int) getMagicFriendlyLevel
{
    return [UpdateInfoList getLevelByUpdataInfoId:1];
}

+(int) getMagicThunderLevel
{
    return [UpdateInfoList getLevelByUpdataInfoId:3];
}

+(int) getMagicStoneLevel
{
    return [UpdateInfoList getLevelByUpdataInfoId:4];
}

+(int) getArrowTowerLevel
{
    return [UpdateInfoList getLevelByUpdataInfoId:5];
}

+(int) getDefenceTowerLevel
{
    return [UpdateInfoList getLevelByUpdataInfoId:6];
}

+(int) getMagicTowerLevel
{
    return [UpdateInfoList getLevelByUpdataInfoId:8];
}

+(int) getTurretTowerLevel
{
    return [UpdateInfoList getLevelByUpdataInfoId:7];
}

@end
