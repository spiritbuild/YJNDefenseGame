//
//  ArchievementList.h
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Archievement;

@interface ArchievementList : NSObject {
    
}

+ (void) initDataBase;

+ (void) resetDataBase;

+ (void) initAllData;

+ (void) saveAllData;

+ (Archievement*) getArchievement:(int)ID;

+ (void) setIsOpen:(int)ID Value:(int)Value;

+ (int) ArchievementIsOpen:(int)ID;

+ (int) getArchievementScore;

@end
