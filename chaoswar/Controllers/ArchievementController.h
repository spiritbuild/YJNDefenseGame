//
//  ArchievementController.h
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TDSprite;

@interface ArchievementController : NSObject {
    
}

+ (void) initArchievementController;

+ (void) addSpriteCreate:(TDSprite*)sprite;

+ (void) addSpriteBeaten:(TDSprite*)attacter beater:(TDSprite*)beater;

+ (void) addGameOpen;

//0 尚未获得
//1 第一次获得
//2 已获得
+ (int) hasArchievement1;

+ (int) hasArchievement2;

+ (int) hasArchievement3;

+ (int) hasArchievement4;

+ (int) hasArchievement5;

+ (int) hasArchievement6;

+ (int) hasArchievement7;

+ (int) hasArchievement8;

+ (int) hasArchievement9;

+ (int) hasArchievement10;

+ (int) hasArchievement11;

+ (int) hasArchievement12;

@end
