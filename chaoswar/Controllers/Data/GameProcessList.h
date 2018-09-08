//
//  GameProcessList.h
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GameProcess;

@interface GameProcessList : NSObject {
    
}

+ (void) initDataBase;

+ (void) resetDataBase;

+ (void) initAllData;

+ (void) saveAllData;

+ (GameProcess*) getGameProcess:(NSString*)KeyName KeyType:(NSString*)KeyType;

+ (int) getGameProcessCount:(NSString*)KeyName KeyType:(NSString*)KeyType;

+ (int) getKeyTypeCount:(NSString*)KeyType;


+ (BOOL) hasProcess:(NSString*)KeyName KeyType:(NSString*)KeyType;

+ (void) addProcess:(NSString*)KeyName KeyType:(NSString*)KeyType;

+ (int) addProcessCount:(NSString*)KeyName KeyType:(NSString*)KeyType;

@end
