//
//  GameProcessList.m
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "GameProcessList.h"
#import "GameProcess.h"
#import "DBDataManager.h"

const NSMutableDictionary *__dicProcess = nil;

@implementation GameProcessList

+ (void) initDataBase {
    NSString *sql = @"CREATE TABLE IF NOT EXISTS T_D_GAME_PROCESS (KEY_NAME TEXT, KEY_TYPE TEXT, KEY_COUNT INTEGER);";
	[DBDataManager executeSQL:sql];
}

+ (void) resetDataBase {
    NSString *sql = @"DROP TABLE T_D_GAME_PROCESS;";
	[DBDataManager executeSQL:sql];
    [self initDataBase];
    [GameProcessList initAllData];
}

+ (void) initAllData {
    if (!__dicProcess) {
        __dicProcess = [[NSMutableDictionary alloc] init];
    }
    [__dicProcess removeAllObjects];
    NSString *sql = @"SELECT * FROM T_D_GAME_PROCESS ORDER BY KEY_NAME, KEY_TYPE;";
	NSMutableArray *array = [DBDataManager querySQL:sql];
    if (array) {
        for (int i = 0; i < [array count]; i++) {
            NSMutableArray *values = [array objectAtIndex:i];
            GameProcess *gameProcess = [[[GameProcess alloc] init] autorelease];
            gameProcess.Key_Name = [values objectAtIndex:0];
            gameProcess.Key_Type = [values objectAtIndex:1];
            gameProcess.Key_Count = [[values objectAtIndex:2] intValue];
            [__dicProcess setValue:gameProcess forKey:[NSString stringWithFormat:@"%@^^^^%@", gameProcess.Key_Name, gameProcess.Key_Type]];
        }
    }    
}

+ (void) saveAllData {
    if (!__dicProcess) {
        return;
    }
    NSString *sql = @"DELETE FROM T_D_GAME_PROCESS;";
    [DBDataManager executeSQL:sql];
    for (int i = 0; i < [[__dicProcess allValues] count]; i++) {
        GameProcess *gameProcess = [[__dicProcess allValues] objectAtIndex:i];
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO T_D_GAME_PROCESS VALUES ('%@', '%@', %d);", 
                         gameProcess.Key_Name, gameProcess.Key_Type, gameProcess.Key_Count];
        [DBDataManager executeSQL:sql];
    }
    [GameProcessList initAllData];
}

+ (GameProcess*) getGameProcess:(NSString*)KeyName KeyType:(NSString*)KeyType {
    if (__dicProcess) {
        GameProcess *gameProcess = [__dicProcess objectForKey:[NSString stringWithFormat:@"%@^^^^%@", KeyName, KeyType]];
        return gameProcess;
    }
    return nil;
}

+ (int) getGameProcessCount:(NSString*)KeyName KeyType:(NSString*)KeyType {
    if (__dicProcess) {
        GameProcess *gameProcess = [__dicProcess objectForKey:[NSString stringWithFormat:@"%@^^^^%@", KeyName, KeyType]];
        if (gameProcess) {
            return gameProcess.Key_Count;
        }
    }
    return 0;
}

+ (int) getKeyTypeCount:(NSString*)KeyType {
    NSString *sql = [NSString stringWithFormat:@"SELECT KEY_COUNT FROM T_D_GAME_PROCESS WHERE KEY_TYPE='%@';", KeyType];
	NSMutableArray *array = [DBDataManager querySQL:sql];
    if (array && [array count] == 1) {
        NSMutableArray *values = [array objectAtIndex:0];
        return [[values objectAtIndex:0] intValue];
    }
    return 0;
}

+ (BOOL) hasProcess:(NSString*)KeyName KeyType:(NSString*)KeyType {
    if (__dicProcess) {
        GameProcess *gameProcess = [__dicProcess objectForKey:[NSString stringWithFormat:@"%@^^^^%@", KeyName, KeyType]];
        if (gameProcess) {
            return YES;
        }
    }
    return NO;
}

+ (void) addProcess:(NSString*)KeyName KeyType:(NSString*)KeyType {
    GameProcess *gameProcess = [[[GameProcess alloc] init] autorelease];
    gameProcess.Key_Name = KeyName;
    gameProcess.Key_Type = KeyType;
    gameProcess.Key_Count = 0;
    [__dicProcess setValue:gameProcess forKey:[NSString stringWithFormat:@"%@^^^^%@", gameProcess.Key_Name, gameProcess.Key_Type]];
}

+ (int) addProcessCount:(NSString*)KeyName KeyType:(NSString*)KeyType {
    GameProcess* gameProcess = [GameProcessList getGameProcess:KeyName KeyType:KeyType];
    if (!gameProcess) {
        [GameProcessList addProcess:KeyName KeyType:KeyType];
        gameProcess = [GameProcessList getGameProcess:KeyName KeyType:KeyType];
    }
    gameProcess.Key_Count = gameProcess.Key_Count + 1;
    return gameProcess.Key_Count;
}

@end
