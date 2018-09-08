#import "LoadingSence.h"
#import "GameBackgroundScene.h"
#import "SceneManager.h"

@implementation LoadingSence

@synthesize intJN001;
@synthesize intJN002;
@synthesize guanKa;


+(CCScene *) scene:(int)gk JN1:(int)JN1 JN2:(int)JN2
{
	CCScene *scene = [CCScene node];
	LoadingSence *layer = [LoadingSence node];
    layer.guanKa = gk;
    layer.intJN001 = JN1;
    layer.intJN002 = JN2;
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        [self shiYingIphone5];
        CGSize size = [[CCDirector sharedDirector] winSize];
        //加载背景图片
		bgImg = [CCSprite spriteWithFile:@"loadingBg.png"];
		bgImg.position = CGPointMake(240 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
        
        //加载Loading动画
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"loadingSheet.plist"];
		spritebatchLoading = [CCSpriteBatchNode batchNodeWithFile:@"loadingSheet.png"];
		[self addChild:spritebatchLoading z:3];
		
		NSMutableArray *animFramesLoading = [NSMutableArray array];
		for(int i = 1; i < 4; i++) {
			CCSpriteFrame *frameLoading = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"1%04d.png",i]];
			if (i==1) {
				spriteLoading = [[CCSprite alloc] initWithSpriteFrame:frameLoading];
			}
			[animFramesLoading addObject:frameLoading];
		}
		animationLoading = [CCAnimation animationWithName:@"Loading" frames:animFramesLoading];
		[spritebatchLoading addChild:spriteLoading];
		[spriteLoading release];
		spriteLoading.position = ccp(360,60);
		[spriteLoading runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:1 animation:animationLoading restoreOriginalFrame:NO] ]];
        
        [self runAction:[CCSequence actions:
                         [CCDelayTime actionWithDuration:2],
                         [CCCallFunc actionWithTarget:self selector:@selector(goToGameSence)],
                         nil]];
	}
	return self;
}

-(void) goToGameSence
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[GameBackgroundScene scene:guanKa JN1:intJN001 JN2:intJN002]]];
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
