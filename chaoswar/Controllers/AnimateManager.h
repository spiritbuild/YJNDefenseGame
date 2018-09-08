#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@class GameController;
@class GameBackgroundScene;

@interface AnimateManager : NSObject {
    NSMutableDictionary *dicAnimates;
    CCLayer *parentScene;
}

@property (nonatomic, assign) CCLayer *parentScene;

- (void) initAnimate:(NSString*)fileName;

- (void) addAnimation:(NSString*)frameName animationName:(NSString*)animationName;

- (CCAnimation*) getAnimation:(NSString*)animationName;

//初始化敌人动画

- (void) initBoss01;

- (void) initBoss02;

- (void) initFly01;

- (void) initFly02;

- (void) initFly03;

- (void) initShooter01;

- (void) initMagic01;

- (void) initMagic02;

- (void) initFoot01;

- (void) initFoot02;

- (void) initFoot03;

- (void) initFoot04;

- (void) initFoot05;

- (void) initFoot06;

- (void) initFoot07;

- (void) initFoot08;

- (void) initFoot09;

- (void) initFoot10;

- (void) initFoot11;

- (void) initFoot12;

- (void) initFoot13;

- (void) initFoot14;

- (void) initFoot15;

- (void) initFoot16;

//初始化塔动画

- (void) initDefenceTower01;

- (void) initDefenceTower02;

- (void) initDefenceTower03;

- (void) initTurretTower01;

- (void) initTurretTower02;

- (void) initTurretTower03;

- (void) initTurretBullet;

- (void) initMagicTower01;

- (void) initMagicTower02;

- (void) initMagicTower03;

//初始化友军动画

- (void) initMagicFriendly01;

- (void) initForeverFriendly01;

//初始化魔法动画

- (void) initMagicFire;

- (void) initMagicThunder;

- (void) initMagicStone;

//初始化效果动画

- (void) initAllEffect;

@end
