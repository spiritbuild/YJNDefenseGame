//
//  UpdateInfoList.h
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UpdateInfo;

@interface UpdateInfoList : NSObject {
    
}

+ (void) initDataBase;

+ (void) resetDataBase;

+ (UpdateInfo*) getUpdateInfo:(int)ID;

+ (NSMutableArray*) getAllUpdateInfo;

+ (void) setLevel:(int)ID Value:(int)Value;

+ (int) getAllLevel;

+ (int) getLevelByUpdataInfoId:(int)ID;

@end
