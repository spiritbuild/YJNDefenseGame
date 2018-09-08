//
//  ArchievementList.m
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ArchievementList.h"
#import "Archievement.h"
#import "DBDataManager.h"

const NSMutableDictionary *__dicArchievement = nil;

@implementation ArchievementList

+ (void) initDataBase {
    NSString *sql = @"CREATE TABLE IF NOT EXISTS T_D_ACHIEVEMENT (ACHIEVEMENT_ID INTEGER PRIMARY KEY, PICTURENAME TEXT, POSITION TEXT, EXPLAIN TEXT, IS_OPEN INTEGER, HAS_SCORES INTEGER);";
	[DBDataManager executeSQL:sql];
	for (int i = 1; i <= 12; i++) {
		sql = [NSString stringWithFormat:@"INSERT INTO T_D_ACHIEVEMENT VALUES (%d, '', '', '', 0, 0);", i];
		[DBDataManager executeSQL:sql];
	}
	
	sql = @"UPDATE T_D_ACHIEVEMENT SET PICTURENAME = 'archievement01',POSITION='{65,230}',EXPLAIN='Through a scene',HAS_SCORES=0 WHERE ACHIEVEMENT_ID = 1;";
	[DBDataManager executeSQL:sql];
    sql = @"UPDATE T_D_ACHIEVEMENT SET PICTURENAME = 'archievement02',POSITION='{134,230}',EXPLAIN='Open the game 10 times',HAS_SCORES=0 WHERE ACHIEVEMENT_ID = 2;";
	[DBDataManager executeSQL:sql];
    sql = @"UPDATE T_D_ACHIEVEMENT SET PICTURENAME = 'archievement03',POSITION='{203,230}',EXPLAIN='Kill 1000 enemys(a skill point)',HAS_SCORES=1 WHERE ACHIEVEMENT_ID = 3;";
	[DBDataManager executeSQL:sql];
    sql = @"UPDATE T_D_ACHIEVEMENT SET PICTURENAME = 'archievement04',POSITION='{272,230}',EXPLAIN='Through a scene with the full health',HAS_SCORES=0 WHERE ACHIEVEMENT_ID = 4;";
	[DBDataManager executeSQL:sql];
    sql = @"UPDATE T_D_ACHIEVEMENT SET PICTURENAME = 'archievement05',POSITION='{341,230}',EXPLAIN='Kill 8 bosses',HAS_SCORES=0 WHERE ACHIEVEMENT_ID = 5;";
	[DBDataManager executeSQL:sql];
    sql = @"UPDATE T_D_ACHIEVEMENT SET PICTURENAME = 'archievement06',POSITION='{410,230}',EXPLAIN='Make 150 reinforcements(magic or camp)',HAS_SCORES=0 WHERE ACHIEVEMENT_ID = 6;";
	[DBDataManager executeSQL:sql];
    sql = @"UPDATE T_D_ACHIEVEMENT SET PICTURENAME = 'archievement07',POSITION='{65,160}', EXPLAIN='Kill a boss with a magic',HAS_SCORES=0 WHERE ACHIEVEMENT_ID = 7;";
	[DBDataManager executeSQL:sql];
    sql = @"UPDATE T_D_ACHIEVEMENT SET PICTURENAME = 'archievement08',POSITION='{134,160}',EXPLAIN='Kill 7 enemys with a magic',HAS_SCORES=0 WHERE ACHIEVEMENT_ID = 8;";
	[DBDataManager executeSQL:sql];
    sql = @"UPDATE T_D_ACHIEVEMENT SET PICTURENAME = 'archievement09',POSITION='{203,160}',EXPLAIN='Evaluation of the game(a skill point)',HAS_SCORES=1 WHERE ACHIEVEMENT_ID = 9;";
	[DBDataManager executeSQL:sql];
    sql = @"UPDATE T_D_ACHIEVEMENT SET PICTURENAME = 'archievement10',POSITION='{272,160}',EXPLAIN='Make full level(towers and skills)',HAS_SCORES=0 WHERE ACHIEVEMENT_ID = 10;";
	[DBDataManager executeSQL:sql];
    sql = @"UPDATE T_D_ACHIEVEMENT SET PICTURENAME = 'archievement11',POSITION='{341,160}',EXPLAIN='Make 10 reinforcements in a scenes(a skill point)',HAS_SCORES=1 WHERE ACHIEVEMENT_ID = 11;";
	[DBDataManager executeSQL:sql];
    sql = @"UPDATE T_D_ACHIEVEMENT SET PICTURENAME = 'archievement12',POSITION='{410,160}',EXPLAIN='Through 8 scene with the full health(a skill point)',HAS_SCORES=1 WHERE ACHIEVEMENT_ID = 12;";
	[DBDataManager executeSQL:sql];
}

+ (void) resetDataBase {
    NSString *sql = @"DROP TABLE T_D_ACHIEVEMENT;";
	[DBDataManager executeSQL:sql];
    [self initDataBase];
    [ArchievementList initAllData];
}

+ (void) initAllData {
    if (!__dicArchievement) {
        __dicArchievement = [[NSMutableDictionary alloc] init];
    }
    [__dicArchievement removeAllObjects];
    NSString *sql = @"SELECT * FROM T_D_ACHIEVEMENT ORDER BY ACHIEVEMENT_ID;";
	NSMutableArray *array = [DBDataManager querySQL:sql];
    if (array) {
        for (int i = 0; i < [array count]; i++) {
            NSMutableArray *values = [array objectAtIndex:i];
            Archievement *archievement = [[[Archievement alloc] init] autorelease];
            archievement.Archievement_ID = [[values objectAtIndex:0] intValue];
            archievement.PictureName = [values objectAtIndex:1];
            archievement.Position = [values objectAtIndex:2];
            archievement.Explain = [values objectAtIndex:3];
            archievement.Is_Open = [[values objectAtIndex:4] intValue];
            archievement.Has_Scores = [[values objectAtIndex:5] intValue];
            [__dicArchievement setValue:archievement forKey:[NSString stringWithFormat:@"%d", archievement.Archievement_ID]];
        }
    }    
}

+ (void) saveAllData {
    if (!__dicArchievement) {
        return;
    }
    NSString *sql = @"DELETE FROM T_D_ACHIEVEMENT;";
    [DBDataManager executeSQL:sql];
    for (int i = 0; i < [[__dicArchievement allValues] count]; i++) {
        Archievement *archievement = [[__dicArchievement allValues] objectAtIndex:i];
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO T_D_ACHIEVEMENT VALUES (%d, '%@', '%@', '%@', %d, %d);", 
                         archievement.Archievement_ID, archievement.PictureName, archievement.Position,
                         archievement.Explain, archievement.Is_Open, archievement.Has_Scores];
        [DBDataManager executeSQL:sql];
    }
    [ArchievementList initAllData];
}

+ (Archievement*) getArchievement:(int)ID {
    if (__dicArchievement) {
        Archievement *archievement = [__dicArchievement objectForKey:[NSString stringWithFormat:@"%d", ID]];
        return archievement;
    }
    return nil;
}

+ (void) setIsOpen:(int)ID Value:(int)Value {
    Archievement *archievement = [ArchievementList getArchievement:ID];
    if (archievement) {
        archievement.Is_Open = Value;
    }
}

+ (int) ArchievementIsOpen:(int)ID {
    Archievement *archievement = [ArchievementList getArchievement:ID];
    if (archievement) {
        return archievement.Is_Open;
    }
    return -1;
}

+ (int) getArchievementScore
{
    NSString *sql = @"SELECT IS_OPEN FROM T_D_ACHIEVEMENT WHERE IS_OPEN = 1 AND HAS_SCORES = 1;";
	NSMutableArray *array = [DBDataManager querySQL:sql];
    if (array  && [array count] == 1) {
        NSMutableArray *values = [array objectAtIndex:0];
        return [[values objectAtIndex:0] intValue];
    }
    return 0;
}

@end
