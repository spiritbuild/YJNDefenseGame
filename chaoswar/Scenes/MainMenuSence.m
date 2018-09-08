#import "MainMenuSence.h"
#import "SelectSence.h"
#import "GameBackgroundScene.h"
#import "SceneManager.h"
#import "HelpSence.h"
#import "CreditsSence.h"
#import "ArchievementSence.h"
#import "SimpleAudioEngine.h"

@implementation MainMenuSence

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MainMenuSence *layer = [MainMenuSence node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"mainBg.mp3"];
        [self shiYingIphone5];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        //加载背景图片
		bgImg = [CCSprite spriteWithFile:@"mainMenuBg.png"];
		bgImg.position = CGPointMake(240 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
        
        //加载logo图片
		logoImg = [CCSprite spriteWithFile:@"logo.png"];
		logoImg.position = CGPointMake(240 , 280);
		logoImg.scale = 1;
		[self addChild:logoImg z:2];

        //加载开始按钮
		btnPlay = [CCMenuItemImage itemFromNormalImage:@"btnPlay.png" selectedImage:@"btnPlaydown.png" disabledImage:@"btnPlay.png" target:self selector:@selector(goToSelectSence:)];		
		CCMenu *btnPlayMenu = [CCMenu menuWithItems:btnPlay, nil];
		btnPlayMenu.position = CGPointMake(240 , 115);
        //btnPlay.scale = 0.75;
		[self addChild:btnPlayMenu z:2];
        //[btnPlay release];
		
		//加载开发团队介绍
		btnCredits = [CCMenuItemImage itemFromNormalImage:@"btnCredit.png" selectedImage:@"btnCreditdown.png" disabledImage:@"btnCredit.png" target:self selector:@selector(goToCreditsSence:)];		
		CCMenu *btnCreditsMenu = [CCMenu menuWithItems:btnCredits, nil];
		btnCreditsMenu.position = CGPointMake(240 , 50);
        //btnCredits.scale = 0.75;
		[self addChild:btnCreditsMenu z:2];
        //[btnCredits release];
        
        //加载成就
		btnArch = [CCMenuItemImage itemFromNormalImage:@"btnArchievement.png" selectedImage:@"btnArchievementdown.png" disabledImage:@"btnArchievement.png" target:self selector:@selector(goToArchSence:)];		
		CCMenu *btnArchMenu = [CCMenu menuWithItems:btnArch, nil];
		btnArchMenu.position = CGPointMake(375 , 50);
        //btnArch.scale = 0.75;
		[self addChild:btnArchMenu z:2];
        //[btnArch release];
        
        //加载帮助介绍
		btnHelp = [CCMenuItemImage itemFromNormalImage:@"btnHelp.png" selectedImage:@"btnHelpdown.png" disabledImage:@"btnHelp.png" target:self selector:@selector(goToHelpSence:)];		
        CCMenu *btnHelpMenu = [CCMenu menuWithItems:btnHelp, nil];
		btnHelpMenu.position = CGPointMake(120 , 50);
        //btnHelp.scale = 0.75;
		[self addChild:btnHelpMenu z:2];
        //[btnHelp release];
	}
	return self;
}

-(void) goToSelectSence:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeUp:0.56f layer:[SelectSence node]]];
    //[[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[GameBackgroundScene scene:0 JN1:1 JN2:2]]];
}

-(void) goToHelpSence:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeUp:0.56f layer:[HelpSence node]]];
}

-(void) goToCreditsSence:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeUp:0.56f layer:[CreditsSence node]]];
}

-(void) goToArchSence:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeUp:0.56f layer:[ArchievementSence node]]];
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
