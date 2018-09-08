#import "CreditsSence.h"
#import "SceneManager.h"
#import "MainMenuSence.h"
#import "SimpleAudioEngine.h"

@implementation CreditsSence

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	CreditsSence *layer = [CreditsSence node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        [self shiYingIphone5];
        CGSize size = [[CCDirector sharedDirector] winSize];
        //加载背景图片
		bgImg = [CCSprite spriteWithFile:@"creditsBg.png"];
		bgImg.position = CGPointMake(240 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
        
        //加载返回按钮
		btnBack = [[CCMenuItemImage alloc] initFromNormalImage:@"btnBack.png" selectedImage:@"btnBackDown.png" disabledImage:@"btnBack.png" target:self selector:@selector(goToMainMenuSence:)];		
        CCMenu *btnBackMenu = [CCMenu menuWithItems:btnBack, nil];
		btnBackMenu.position = CGPointMake(415 , 40);
		[self addChild:btnBackMenu z:2];
		[btnBack release];
	}
	return self;
}

-(void) goToMainMenuSence:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeDown:0.56f layer:[MainMenuSence node]]];
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
