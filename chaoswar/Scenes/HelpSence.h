#import "cocos2d.h"

@interface HelpSence : CCLayer {
    CCSprite *bgImg;
    CCMenuItemImage *btnBack;
    CCSpriteBatchNode *spritebatchXz;
	CCSprite *spriteXz;
	CCAnimation *animationXz;
    CCLabelTTF *labelExplain;
}

+(CCScene *) scene;
-(void)shiYingIphone5;
@end
