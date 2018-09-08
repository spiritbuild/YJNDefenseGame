#import "cocos2d.h"

@interface SelectSence : CCLayer {
    CCSprite *bgImg;
	CCSprite *selectMagicBg;
    CCSprite *resetBg;
    CCMenuItemImage *btnBack;
	CCMenuItemImage *btnUpdata;
    CCMenuItemImage *btnYes;
    CCMenuItemImage *btnNo;
    CCMenuItemImage *btnReset;
    CCSprite *btnWaveStationLight;
	
	CCMenuItemImage *btnPlay;
	CCMenuItemImage *btnJN001;
	CCMenuItemImage *btnJN002;
	CCMenuItemImage *btnJN003;
	CCMenuItemImage *btnJN004;
	CCMenuItemImage *btnselectJn1;
	CCMenuItemImage *btnselectJn2;
	CCSprite *select1;
	CCSprite *select2;
    CCMenuItemImage *btnClose;
    CCMenuItemImage *btnTouMing;
	int intJN001;
	int intJN002;
	int guanKa;
	
    NSMutableDictionary *wavesInfo;
}

+(CCScene *) scene;
-(void) setMagicShow;
-(void) setMagicHidden;
-(void)shiYingIphone5;

@end
