//
//  ArchievementController.m
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ArchievementController.h"
#import "DBDataManager.h"
#import "Archievement.h"
#import "ArchievementList.h"
#import "GameProcess.h"
#import "GameProcessList.h"
#import "GameController.h"
#import "TDFriendly.h"
#import "TDEnemy.h"
#import "TDBossEnemy.h"

const NSMutableDictionary *_dicArchievement = nil;

void addArchievementValue(NSString* KeyName, NSString* KeyType)
{
    //系统级添加
    if (![GameProcessList hasProcess:KeyName KeyType:KeyType]) {
        [GameProcessList addProcess:KeyName KeyType:KeyType];
    }
    [GameProcessList addProcessCount:KeyName KeyType:KeyType];
}

@implementation ArchievementController

+ (void) initArchievementController
{
    if (!_dicArchievement) {
        _dicArchievement = [[NSMutableDictionary alloc] init];
    }
    [_dicArchievement removeAllObjects];
}

+ (void) addSpriteCreate:(TDSprite*)sprite
{
    addArchievementValue([NSString stringWithUTF8String:object_getClassName(sprite)], @"CREATE");
    [ArchievementController hasArchievement6];
    //本关判断
    [ArchievementController hasArchievement11];
}

+ (void) addSpriteBeaten:(TDSprite*)attacter beater:(TDSprite*)beater
{
    addArchievementValue([NSString stringWithUTF8String:object_getClassName(attacter)], @"KILL");
    addArchievementValue([NSString stringWithUTF8String:object_getClassName(beater)], @"BEATEN");
    if ([attacter isKindOfClass:[TDFriendly class]]) {
        addArchievementValue(@"TDFriendly", @"KILL");
    }
    if ([beater isKindOfClass:[TDFriendly class]]) {
        addArchievementValue(@"TDFriendly", @"BEATEN");
    }
    if ([attacter isKindOfClass:[TDEnemy class]]) {
        addArchievementValue(@"TDEnemy", @"KILL");
    }
    if ([beater isKindOfClass:[TDEnemy class]]) {
        addArchievementValue(@"TDEnemy", @"BEATEN");
    }
    //本地级
    if (!_dicArchievement) {
        _dicArchievement = [[NSMutableDictionary alloc] init];
    }
    if ([attacter isKindOfClass:[TDFireBullet1 class]] ||
        [attacter isKindOfClass:[TDThunderBullet1 class]] ||
        [attacter isKindOfClass:[TDStoneBullet1 class]]) {
        NSString *keyName = [NSString stringWithFormat:@"MAGICKILL%@", [attacter createTime]];
        if ([beater isKindOfClass:[TDBossEnemy class]]) {
            [ArchievementController hasArchievement7];
        }
        if (![_dicArchievement objectForKey:keyName]) {
            [_dicArchievement setValue:@"0" forKey:keyName];
        }
        NSString *sValue = [_dicArchievement objectForKey:keyName];
        int iValue = [sValue intValue] + 1;
        [_dicArchievement setValue:[NSString stringWithFormat:@"%d", iValue] forKey:keyName];
        if (iValue >= 7) {
            [ArchievementController hasArchievement8];
        }
    }
    
    [ArchievementController hasArchievement3];
    [ArchievementController hasArchievement5];
}

+ (void) addGameOpen {
    addArchievementValue(@"GAME", @"OPEN");
}

//初出茅庐	任意过一关以后获得该成就 OK
+ (int) hasArchievement1 {
    Archievement* archievement = [ArchievementList getArchievement:1];
    if (!archievement) {
        return 0;
    }
    if (archievement.Is_Open == 0) {
        [ArchievementList setIsOpen:1 Value:1];
        NSLog(@"首次激活成就1!");
        return 1;
    }
    return 2;
}

//爱国人士      第10次打开游戏获得成就 OK
+ (int) hasArchievement2 {
    Archievement* archievement = [ArchievementList getArchievement:2];
    if (!archievement) {
        return 0;
    }
    if ([GameProcessList getGameProcessCount:@"GAME" KeyType:@"OPEN"] < 10) {
        return 0;
    }
    if (archievement.Is_Open == 0) {
        [ArchievementList setIsOpen:2 Value:1];
        NSLog(@"首次激活成就2!");
        return 1;
    }
    return 2;
}

//千人斩       杀死1000个敌人以后，获得该成就  OK
+ (int) hasArchievement3 {
    Archievement* archievement = [ArchievementList getArchievement:3];
    if (!archievement) {
        return 0;
    }
    if ([GameProcessList getGameProcessCount:@"TDEnemy" KeyType:@"BEATEN"] < 1000) {
        return 0;
    }
    if (archievement.Is_Open == 0) {
        [ArchievementList setIsOpen:3 Value:1];
        NSLog(@"首次激活成就3!");
        return 1;
    }
    return 2;
}

//完美无暇      满血过关以后，获得该成就 OK
+ (int) hasArchievement4 {
    Archievement* archievement = [ArchievementList getArchievement:4];
    if (!archievement) {
        return 0;
    }
    if (archievement.Is_Open == 0) {
        [ArchievementList setIsOpen:4 Value:1];
        NSLog(@"首次激活成就4!");
        return 1;
    }
    return 2;
}

//擒贼擒王      杀死老怪累计达到8次 OK
+ (int) hasArchievement5 {
    Archievement* archievement = [ArchievementList getArchievement:5];
    if (!archievement) {
        return 0;
    }
    int bossEnemy1 = [GameProcessList getGameProcessCount:@"TDBossEnemy1" KeyType:@"BEATEN"];
    int bossEnemy2 = [GameProcessList getGameProcessCount:@"TDBossEnemy2" KeyType:@"BEATEN"];
    if ((bossEnemy2 + bossEnemy1) < 8) {
        return 0;
    }
    if (archievement.Is_Open == 0) {
        [ArchievementList setIsOpen:5 Value:1];
        NSLog(@"首次激活成就5!");
        return 1;
    }
    return 2;
}

//强兵云集      总共我方出兵(包括魔法和兵营)达到150个 OK
+ (int) hasArchievement6 {
    Archievement* archievement = [ArchievementList getArchievement:6];
    if (!archievement) {
        return 0;
    }
    int towerFriendly1 = [GameProcessList getGameProcessCount:@"TDTowerFriendly1" KeyType:@"CREATE"];
    int towerFriendly2 = [GameProcessList getGameProcessCount:@"TDTowerFriendly2" KeyType:@"CREATE"];
    int towerFriendly3 = [GameProcessList getGameProcessCount:@"TDTowerFriendly3" KeyType:@"CREATE"];
    int magicFriendly1 = [GameProcessList getGameProcessCount:@"TDMagicFriendly1" KeyType:@"CREATE"];
    int magicFriendly2 = [GameProcessList getGameProcessCount:@"TDMagicFriendly2" KeyType:@"CREATE"];
    int foreverFriendly1 = [GameProcessList getGameProcessCount:@"TDForeverFriendly1" KeyType:@"CREATE"];
    int sumCount = towerFriendly1+towerFriendly2+towerFriendly3+magicFriendly1+magicFriendly2+foreverFriendly1;    
    if (sumCount < 150) {
        return 0;
    }
    if (archievement.Is_Open == 0) {
        [ArchievementList setIsOpen:6 Value:1];
        NSLog(@"首次激活成就6!");
        return 1;
    }
    return 2;
}

//一击必杀      用魔法一下杀死BOSS OK
+ (int) hasArchievement7 {
    Archievement* archievement = [ArchievementList getArchievement:7];
    if (!archievement) {
        return 0;
    }
    if (archievement.Is_Open == 0) {
        [ArchievementList setIsOpen:7 Value:1];
        NSLog(@"首次激活成就7!");
        return 1;
    }
    return 2;
}

//群攻乱舞      用魔法一下杀死七个敌人 OK
+ (int) hasArchievement8 {
    Archievement* archievement = [ArchievementList getArchievement:8];
    if (!archievement) {
        return 0;
    }
    if (archievement.Is_Open == 0) {
        [ArchievementList setIsOpen:8 Value:1];
        NSLog(@"首次激活成就8!");
        return 1;
    }
    return 2;
}

//快乐共享      对游戏进行评价 
+ (int) hasArchievement9 {
    Archievement* archievement = [ArchievementList getArchievement:9];
    if (!archievement) {
        return 0;
    }
    if (archievement.Is_Open == 0) {
        [ArchievementList setIsOpen:9 Value:1];
        NSLog(@"首次激活成就9!");
        return 1;
    }
    return 2;
}

//终极装备      所有塔和技能的升级，都升满  OK
+ (int) hasArchievement10 {
    Archievement* archievement = [ArchievementList getArchievement:10];
    if (!archievement) {
        return 0;
    }
    NSString *sql = @"SELECT COUNT(*) FROM T_D_UPDATE_INFO WHERE LEVEL >= 3;";
	NSMutableArray *array = [DBDataManager querySQL:sql];
    if (array  && [array count] == 1) {
        NSMutableArray *values = [array objectAtIndex:0];
        if ([[values objectAtIndex:0] intValue] < 8) {
            return 0;
        }
    }
    if (archievement.Is_Open == 0) {
        [ArchievementList setIsOpen:10 Value:1];
        NSLog(@"首次激活成就10!");
        return 1;
    }
    return 2;
}

//草木皆兵      一关内，我军士兵同时出现的数量为10个 OK
+ (int) hasArchievement11 {
    Archievement* archievement = [ArchievementList getArchievement:11];
    if (!archievement) {
        return 0;
    }
    if (![GameController getGameController]) {
        return 0;
    }
    if (![[GameController getGameController] frientlyArray]) {
        return 0;
    }
    if ([[[GameController getGameController] frientlyArray] count] < 10) {
        return 0;
    }
    if (archievement.Is_Open == 0) {
        [ArchievementList setIsOpen:11 Value:1];
        NSLog(@"首次激活成就11!");
        return 1;
    }
    return 2;
}

//势不可挡      所有关卡中，有8个关卡是三颗星通过的  OK
+ (int) hasArchievement12 {
    Archievement* archievement = [ArchievementList getArchievement:12];
    if (!archievement) {
        return 0;
    }
    NSString *sql = @"SELECT COUNT(*) FROM T_D_GAME_POINT WHERE SCORE >= 3;";
	NSMutableArray *array = [DBDataManager querySQL:sql];
    if (array  && [array count] == 1) {
        NSMutableArray *values = [array objectAtIndex:0];
        if ([[values objectAtIndex:0] intValue] < 8) {
            return 0;
        }
    }
    if (archievement.Is_Open == 0) {
        [ArchievementList setIsOpen:12 Value:1];
        NSLog(@"首次激活成就12!");
        return 1;
    }
    return 2;
}

@end
