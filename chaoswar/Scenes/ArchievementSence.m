//
//  ArchievementSence.m
//  chaoswar
//
//  Created by apple on 12-1-19.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ArchievementSence.h"
#import "MainMenuSence.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"
#import "Archievement.h"
#import "ArchievementList.h"
#import "ArchievementController.h"

//#define GAME_URL @"itms-apps://phobos.apple.com/us/app/seasonofdefend/id488569220?mt=8&uo=4"
//#define GAME_URL @"itms-apps://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=488569220&mt=8"
#define GAME_URL @"http://www.twitter.com"


@implementation ArchievementSence

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	ArchievementSence *layer = [ArchievementSence node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        [self shiYingIphone5];
        CGSize size = [[CCDirector sharedDirector] winSize];
        //加载背景图片
		CCSprite *bgImg = [CCSprite spriteWithFile:@"archievementBg.png"];
		bgImg.position = CGPointMake(240 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
        
//        CCSprite *tipImg = [CCSprite spriteWithFile:@"updataTip.png"];
//		tipImg.position = CGPointMake(170 , 70);
//		tipImg.scale = 1;
//		[self addChild:tipImg z:2];
        
        arcImg = [CCSprite spriteWithFile:@"archievement01.png"];
		arcImg.position = CGPointMake(80 , 70);
		//arcImg.scale = 0.7;
        arcImg.visible = NO;
		[self addChild:arcImg z:3];

        //加载返回按钮
		CCMenuItemImage *btnBack = [[CCMenuItemImage alloc] initFromNormalImage:@"btnBack.png" selectedImage:@"btnBackDown.png" disabledImage:@"btnBack.png" target:self selector:@selector(goToMainMenuSence:)];		
        CCMenu *btnBackMenu = [CCMenu menuWithItems:btnBack, nil];
		btnBackMenu.position = CGPointMake(415 , 50);
		[self addChild:btnBackMenu z:2];
        
        for (int i = 1; i<= 12; i++) {
            Archievement *archievement = [ArchievementList getArchievement:i];
            NSString *picName = @"";
            if (archievement.Is_Open == 1) {
                picName = [NSString stringWithFormat:@"%@.png",archievement.PictureName];
            }
            else{
                picName = [NSString stringWithFormat:@"%@D.png",archievement.PictureName];
            }
            
            CCMenuItemImage *btnItem = [[CCMenuItemImage alloc] initFromNormalImage:picName selectedImage:picName disabledImage:picName target:self selector:@selector(showInfo:)];
            btnItem.tag = i;
            CCMenu *btnItemMenu = [CCMenu menuWithItems:btnItem, nil];
            btnItemMenu.position = CGPointFromString(archievement.Position);
            [self addChild:btnItemMenu z:2];
            [btnItem release];
        }
	}
	return self;
}

-(void) goToMainMenuSence:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeDown:0.56f layer:[MainMenuSence node]]];
}

-(void) showInfo:(id) sender 
{
    CCNode *node = (CCNode*) sender;
    int archievementID = node.tag;
    Archievement *archievement = [ArchievementList getArchievement:archievementID];
    if (!archievement) {
        return;
    }
    
    [self removeChild:arcImg cleanup:YES];
    arcImg = [CCSprite spriteWithFile:[NSString stringWithFormat:@"archievement%02d.png",archievementID]];
    arcImg.position = CGPointMake(70 , 70);
    //arcImg.scale = 0.7;
    [self addChild:arcImg z:3];

    //特殊处理
    if (archievementID == 9) {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:GAME_URL]]) {
            [ArchievementController hasArchievement9];
            archievement = [ArchievementList getArchievement:archievementID];
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:GAME_URL]];
		}
        
    }
    CCNode *child = [self getChildByTag:99];
    if (child) {
        [self removeChild:child cleanup:YES];
    }

    //加载介绍
    CCLabelTTF *labelExplain = [CCLabelTTF labelWithString:archievement.Explain dimensions:CGSizeMake(200,100) alignment:UITextAlignmentLeft fontName:@"Georgia" fontSize:16];
    labelExplain.position = CGPointMake(100 ,50);
    labelExplain.anchorPoint = CGPointMake(0 ,0.5);
    labelExplain.tag = 99;
    labelExplain.color = ccc3(255, 204, 0);
    [self addChild: labelExplain z:2];
}

-(void)shiYingIphone5
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    if (size.width == 568) {
        CCSprite *i5Img = [CCSprite spriteWithFile:@"i5Bg.png"];
        i5Img.position = CGPointMake(240 , size.height/2);
        i5Img.scale = 1;
        [self addChild:i5Img z:1];
        self.position = ccp(self.position.x + 44, self.position.y);
    }
}

-(void) update:(id) sender 
{
    
}

@end
