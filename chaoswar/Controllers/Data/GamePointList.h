//
//  GamePointList.h
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GamePoint;

@interface GamePointList : NSObject {
    
}

+ (void) initDataBase;

+ (void) resetDataBase;

+ (GamePoint*) getGamePoint:(int)ID;

+ (NSMutableArray*) getAllGamePoint;

+ (void) setIsOpen:(int)ID Value:(int)Value;

+ (void) setScore:(int)ID Value:(int)Value;

+ (int) getAllOpenPoint;

@end
