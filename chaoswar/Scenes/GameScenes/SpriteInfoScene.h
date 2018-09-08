#import <Foundation/Foundation.h>
#import "GamePubDef.h"

//显示界面提示信息，该界面激活，其它节目均无法使用

@interface SpriteInfoScene : CCLayer {
    CCSprite *_towerInfo;
    CCSprite *_defenceTowerInfo;
    CCSprite *_enemyInfo;
    CCSprite *_friendlyInfo;
    CCSprite *_flyEnemyInfo;
    CCSprite *_magicFriendlyInfo;
}

- (void) initTowerInfo;
- (void) initDefenceTowerInfo;
- (void) initEnemyInfo;
- (void) initFriendlyInfo;
- (void) initFlyEnemyInfo;
- (void) initMagicFriendlyInfo;

- (void) showTowerInfo;
- (void) showDefenceTowerInfo;
- (void) showEnemyInfo;
- (void) showFriendlyInfo;
- (void) showFlyEnemyInfo;
- (void) showMagicFriendlyInfo;

- (void) setSmallPic:(NSString*)name;
- (void) setAttact:(int)attact;
- (void) setAttactSpeed:(float)attactSpeed;
- (void) setBloodNum:(int)bloodNum;
- (void) setMoveSpeed:(int)moveSpeed;
- (void) setFriendlyNum:(int)friendlyNum;
- (void) setLiveTime:(int)liveTime;

-(void)shiYingIphone5;
@end
