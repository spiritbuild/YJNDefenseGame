#import "cocos2d.h"

@interface UpdataSence : CCLayer {
    CCSprite *bgImg;
    CCSprite *tipImg;
    CCMenuItemImage *btnBack;
    CCMenuItemImage *btnUpdata;
    //CCMenuItemImage *btnReset;
    int itemId;
    //NSMutableDictionary *updataInfo;
    //NSMutableDictionary *publicInfo;
    CCSprite *scoreTip;
    //CCLabelAtlas *scoreAtlas;
    CCSprite *itemIcon;
    
    CCLabelTTF *labelLevel;
    CCLabelTTF *labelExplain;
    CCLabelTTF *labelScore;
    
    CCSpriteBatchNode *spritebatchXz;
	CCSprite *spriteXz;
	CCAnimation *animationXz;
    
    CCSprite *spriteSj;
    CCSpriteBatchNode *sjSheet;
	CCSpriteFrameCache *sjCache;
    
    CGSize size;
    BOOL gLock;
}

+(CCScene *) scene;
-(void) updataJnById:(int) jnId;
-(void)initSenceView:(int) uId;
-(void)shiYingIphone5;
@end
