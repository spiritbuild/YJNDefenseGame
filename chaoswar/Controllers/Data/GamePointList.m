//
//  GamePointList.m
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "GamePointList.h"
#import "GamePoint.h"
#import "DBDataManager.h"

@implementation GamePointList

+ (void) initDataBase {
    NSString *sql = @"CREATE TABLE IF NOT EXISTS T_D_GAME_POINT (GAME_POINT_ID INTEGER PRIMARY KEY, IS_OPEN INTEGER, POSITION TEXT, SCORE INTEGER);";
	[DBDataManager executeSQL:sql];
	for (int i = 1; i <= 12; i++) {
		sql = [NSString stringWithFormat:@"INSERT INTO T_D_GAME_POINT VALUES (%d, 0, '', 0);", i];
		[DBDataManager executeSQL:sql];
	}
	sql = @"UPDATE T_D_GAME_POINT SET IS_OPEN=1, POSITION = '{45,80}' WHERE GAME_POINT_ID = 1;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_GAME_POINT SET POSITION = '{30,150}' WHERE GAME_POINT_ID = 2;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_GAME_POINT SET POSITION = '{65,190}' WHERE GAME_POINT_ID = 3;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_GAME_POINT SET POSITION = '{110,230}' WHERE GAME_POINT_ID = 4;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_GAME_POINT SET POSITION = '{150,260}' WHERE GAME_POINT_ID = 5;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_GAME_POINT SET POSITION = '{152,170}' WHERE GAME_POINT_ID = 6;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_GAME_POINT SET POSITION = '{145,105}' WHERE GAME_POINT_ID = 7;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_GAME_POINT SET POSITION = '{195,90}' WHERE GAME_POINT_ID = 8;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_GAME_POINT SET POSITION = '{260,100}' WHERE GAME_POINT_ID = 9;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_GAME_POINT SET POSITION = '{320,160}' WHERE GAME_POINT_ID = 10;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_GAME_POINT SET POSITION = '{400,180}' WHERE GAME_POINT_ID = 11;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_GAME_POINT SET POSITION = '{440,260}' WHERE GAME_POINT_ID = 12;";
	[DBDataManager executeSQL:sql];
}

+ (void) resetDataBase {
    NSString *sql = @"DROP TABLE T_D_GAME_POINT;";
	[DBDataManager executeSQL:sql];
    [self initDataBase];
}

+ (GamePoint*) getGamePoint:(int)ID {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM T_D_GAME_POINT WHERE GAME_POINT_ID = %d;", ID];
	NSMutableArray *array = [DBDataManager querySQL:sql];
    if (array  && [array count] == 1) {
        NSMutableArray *values = [array objectAtIndex:0];
        GamePoint *gamePoint = [[[GamePoint alloc] init] autorelease];
        gamePoint.Game_Point_ID = [[values objectAtIndex:0] intValue];
        gamePoint.Is_Open = [[values objectAtIndex:1] intValue];
        gamePoint.Position = [values objectAtIndex:2];
        gamePoint.Score = [[values objectAtIndex:3] intValue];
        
        return gamePoint;
    }
    return nil;
}

+ (int) getAllOpenPoint {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM T_D_GAME_POINT WHERE IS_OPEN = 1;"];
	NSMutableArray *array = [DBDataManager querySQL:sql];
    return ([array count]);
}

+ (NSMutableArray*) getAllGamePoint {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM T_D_GAME_POINT;"];
	NSMutableArray *array = [DBDataManager querySQL:sql];
    
    
    if (array) {
        return array;
    }
    return nil;
}

+ (void) setIsOpen:(int)ID Value:(int)Value {
    NSString *sql = [NSString stringWithFormat:@"UPDATE T_D_GAME_POINT SET IS_OPEN = %d WHERE GAME_POINT_ID = %d;", Value, ID];
	[DBDataManager executeSQL:sql];
}

+ (void) setScore:(int)ID Value:(int)Value {
    NSString *sql = [NSString stringWithFormat:@"UPDATE T_D_GAME_POINT SET SCORE = %d WHERE GAME_POINT_ID = %d;", Value, ID];
	[DBDataManager executeSQL:sql];
}

@end
