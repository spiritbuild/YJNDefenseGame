//
//  DBDataManager.h
//  chaoswar
//
//  Created by Swimming on 11-12-29.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "/XCODE4/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.3.sdk/usr/include/sqlite3.h"
#import "sqlite3.h"

@interface DBDataManager : NSObject {
}

+ (NSMutableArray*) querySQL:(NSString*)SQL;

+ (BOOL) executeSQL:(NSString*)SQL;

@end
