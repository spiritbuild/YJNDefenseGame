#import "cocos2d.h"

@interface MainMenuSence : CCLayer {
    CCSprite *bgImg;
    CCSprite *logoImg;
	CCMenuItemImage *btnHelp;
	CCMenuItemImage *btnPlay;
    CCMenuItemImage *btnArch;
	CCMenuItemImage *btnCredits;
}

+(CCScene *) scene;
-(void)shiYingIphone5;
@end
