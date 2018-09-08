//
//  DBDataManager.m
//  chaoswar
//
//  Created by Swimming on 11-12-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DBDataManager.h"

static sqlite3	*database;

static __strong const char* dataFilePath()
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *result = [documentsDirectory stringByAppendingPathComponent:@"save.nbdata"];
	return [result UTF8String];
}

static NSString * getDBValue(sqlite3_stmt* statement, int column)
{
	return [NSString stringWithCString:(char*)sqlite3_column_text(statement, column) encoding:NSUTF8StringEncoding];
}


@implementation DBDataManager

+ (NSMutableArray*) querySQL:(NSString*)SQL {
    if (sqlite3_open(dataFilePath(), &database) != SQLITE_OK) {
        sqlite3_close(database);
        return NO;
    }
    NSMutableArray *data = [NSMutableArray array];
	sqlite3_stmt *statement;
	if (sqlite3_prepare_v2( database, [SQL UTF8String], -1, &statement, nil) == SQLITE_OK) {
        int rowCount = sqlite3_column_count(statement);
		while (sqlite3_step(statement) == SQLITE_ROW) 
        {
			NSMutableArray *row = [[NSMutableArray alloc] init];
            for (int i = 0; i < rowCount; i++) {
                [row addObject:getDBValue(statement, i)];
            }
            [data addObject:row];
            [row release];
		}
	}
    sqlite3_finalize(statement);
    sqlite3_close(database);
    return data;
}

+ (BOOL) executeSQL:(NSString*)SQL {
    if (sqlite3_open(dataFilePath(), &database) != SQLITE_OK) {
        sqlite3_close(database);
        return NO;
    }

	char * errorMsg;
	if (sqlite3_exec(database, [SQL UTF8String], NULL, NULL, &errorMsg) != SQLITE_OK)
	{
		return NO;	
	}
	sqlite3_free(errorMsg);
    sqlite3_close(database);
    return YES;
}

@end
