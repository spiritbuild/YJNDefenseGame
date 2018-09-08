//
//  UpdateInfoList.m
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "UpdateInfoList.h"
#import "UpdateInfo.h"
#import "DBDataManager.h"

@implementation UpdateInfoList

+ (void) initDataBase {
    NSString *sql = @"CREATE TABLE IF NOT EXISTS T_D_UPDATE_INFO (UPDATE_INFO_ID INTEGER PRIMARY KEY, LEVEL INTEGER, PICTURENAME TEXT, POSITION TEXT, EXPLAIN2 TEXT, EXPLAIN3 TEXT);";
	[DBDataManager executeSQL:sql];
	for (int i = 1; i <= 8; i++) {
		sql = [NSString stringWithFormat:@"INSERT INTO T_D_UPDATE_INFO VALUES (%d, 1, '', '', '', '');", i];
		[DBDataManager executeSQL:sql];
	}
	sql = @"UPDATE T_D_UPDATE_INFO SET PICTURENAME = 'jN001.png',POSITION='{65,235}',EXPLAIN2='NEXT:Let the soldiers stronger. Add more life,  more attacks.',EXPLAIN3='NEXT:Increase a soldier. Every time there are three soldiers joined the battle.'  WHERE UPDATE_INFO_ID = 1;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_UPDATE_INFO SET PICTURENAME = 'jN002.png',POSITION='{165,235}',EXPLAIN2='NEXT:Increase the power of the fireball.',EXPLAIN3='NEXT:Add more of the fireball.'  WHERE UPDATE_INFO_ID = 2;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_UPDATE_INFO SET PICTURENAME = 'jN003.png',POSITION='{265,235}',EXPLAIN2='NEXT:Increase the power of the lightning.',EXPLAIN3='NEXT:Increase the more power of the lightning.'  WHERE UPDATE_INFO_ID = 3;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_UPDATE_INFO SET PICTURENAME = 'jN004.png',POSITION='{365,235}',EXPLAIN2='NEXT:Increase the attack power of rockfall.',EXPLAIN3='NEXT:Increased 2 seconds of fanit time.'  WHERE UPDATE_INFO_ID = 4;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_UPDATE_INFO SET PICTURENAME = 'fY001.png',POSITION='{65,155}',EXPLAIN2='NEXT:Change it‘s attack power increased.',EXPLAIN3='NEXT:Change it to increase the frequency of attacks.'  WHERE UPDATE_INFO_ID = 5;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_UPDATE_INFO SET PICTURENAME = 'fY002.png',POSITION='{165,155}',EXPLAIN2='NEXT:Accelerate the speed to send troops.',EXPLAIN3='NEXT:Increase the health of soldiers.'  WHERE UPDATE_INFO_ID = 6;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_UPDATE_INFO SET PICTURENAME = 'fY003.png',POSITION='{265,155}',EXPLAIN2='NEXT:Increase attack power of artillery.',EXPLAIN3='NEXT:Increase the accuracy of the attack.'  WHERE UPDATE_INFO_ID = 7;";
	[DBDataManager executeSQL:sql];
	sql = @"UPDATE T_D_UPDATE_INFO SET PICTURENAME = 'fY004.png',POSITION='{365,155}',EXPLAIN2='NEXT:Increase the minaret of the attack.',EXPLAIN3='NEXT:Speed ​​up the attack frequency.'  WHERE UPDATE_INFO_ID = 8;";
	[DBDataManager executeSQL:sql];
}

+ (void) resetDataBase {
    NSString *sql = @"DROP TABLE T_D_UPDATE_INFO;";
	[DBDataManager executeSQL:sql];
    [self initDataBase];
}

+ (UpdateInfo*) getUpdateInfo:(int)ID {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM T_D_UPDATE_INFO WHERE UPDATE_INFO_ID = %d;", ID];
	NSMutableArray *array = [DBDataManager querySQL:sql];
    if (array  && [array count] == 1) {
        NSMutableArray *values = [array objectAtIndex:0];
        UpdateInfo *updateInfo = [[[UpdateInfo alloc] init] autorelease];
        updateInfo.Update_Info_ID = [[values objectAtIndex:0] intValue];
        updateInfo.Level = [[values objectAtIndex:1] intValue];
        updateInfo.PictureName = [values objectAtIndex:2];
        updateInfo.Position = [values objectAtIndex:3];
        updateInfo.Explain2 = [values objectAtIndex:4];
        updateInfo.Explain3 = [values objectAtIndex:5];
        return updateInfo;
    }
    return nil;
}

+ (int) getAllLevel {
    int level = 0;
    NSString *sql = [NSString stringWithFormat:@"SELECT SUM(LEVEL) FROM T_D_UPDATE_INFO;"];
	NSMutableArray *array = [DBDataManager querySQL:sql];
    if (array) {
        NSMutableArray *values = [array objectAtIndex:0];

        level = [[values objectAtIndex:0] intValue];
    }
    
    return level;
}

+ (int) getLevelByUpdataInfoId:(int)ID {
    UpdateInfo *info = [self getUpdateInfo:ID];
    if (info) {
        return  info.Level;
    }
    else{
        return 1;
    }
}

+ (NSMutableArray*) getAllUpdateInfo {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM T_D_UPDATE_INFO;"];
	NSMutableArray *array = [DBDataManager querySQL:sql];
    
    
    if (array) {
        return array;
    }
    return nil;
}

+ (void) setLevel:(int)ID Value:(int)Value {
    NSString *sql = [NSString stringWithFormat:@"UPDATE T_D_UPDATE_INFO SET LEVEL = %d WHERE UPDATE_INFO_ID = %d;", Value, ID];
	[DBDataManager executeSQL:sql];
}

@end
