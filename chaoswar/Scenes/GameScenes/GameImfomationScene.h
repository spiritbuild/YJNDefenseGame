#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@class GameController;

//显示永远不会变化位置的信息

@interface GameImfomationScene : CCLayer {

}

@property (nonatomic, readonly) CCMenuItemImage *btnPause;
@property (nonatomic, readonly) CCLabelAtlas *lblEnemyNum;
@property (nonatomic, readonly) CCLabelAtlas *lblWave;
@property (nonatomic, readonly) CCLabelAtlas *lblGold;

- (void) setPauseMenuStatus;
- (void) setEnemyNumValue;
- (void) setWaveValue;
- (void) setGoldValue;

-(void)shiYingIphone5;

@end
