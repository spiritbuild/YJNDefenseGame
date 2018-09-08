//
//  GameEndSence.m
//  chaoswar
//
//  Created by apple on 11-11-30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameEndSence.h"
#import "CreditsSence.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"

@implementation GameEndSence

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	GameEndSence *layer = [GameEndSence node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        [self setIsTouchEnabled:YES];
        [self shiYingIphone5];
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"endWinBg.mp3"];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        //加载背景图片
		bgImg = [CCSprite spriteWithFile:@"endWinBg.png"];
		bgImg.position = CGPointMake(240 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
	}
	return self;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	touch = [touches anyObject];
	[[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeUp:0.56f layer:[CreditsSence node]]];
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

- (void) dealloc
{
	[super dealloc];
}

@end
