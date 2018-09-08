//
//  GnDataController.h
//  chaoswar
//
//  Created by apple on 12-1-5.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GnDataController : NSObject {
    
}

+(void) setSelect:(int)selectIndex s:(int)s;

+(int) getGameScore;

+(void) setFirst;

+(int) getMagicFireLevel;
+(int) getMagicFriendlyLevel;
+(int) getMagicThunderLevel;
+(int) getMagicStoneLevel;

+(int) getArrowTowerLevel;
+(int) getDefenceTowerLevel;
+(int) getMagicTowerLevel;
+(int) getTurretTowerLevel;

@end
