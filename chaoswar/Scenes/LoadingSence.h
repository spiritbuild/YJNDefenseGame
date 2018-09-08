#import "cocos2d.h"

@interface LoadingSence : CCLayer {
    CCSprite *bgImg;
    CCSpriteBatchNode *spritebatchLoading;
	CCSprite *spriteLoading;
	CCAnimation *animationLoading;
	int intJN001;
	int intJN002;
	int guanKa;
}

@property int intJN001;
@property int intJN002;
@property int guanKa;

+(CCScene *) scene:(int)gk JN1:(int)JN1 JN2:(int)JN2;
-(void) goToGameSence;

-(void)shiYingIphone5;
@end
