#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "WayPoint.h"
#import "TDUnit.h"
#import "TDMagicBullet.h"

@class TDFriendly;

@interface TDEnemy : TDUnit {
    NSMutableArray *_friendlyArray;
    BOOL _isAttacting;
}

@property int nextWayPoint;

//路线集合
@property (nonatomic, assign) NSMutableArray *way;
//攻击的友军
@property (nonatomic, readonly) TDFriendly *friendly;
//攻击的友军
@property (nonatomic, readonly) TDFriendly *canAttactFriendly;
//自身发射的子弹集合
@property (nonatomic, assign) NSMutableArray *shootBulletArray;
//塔攻击的子弹集合
@property (nonatomic, assign) NSMutableArray *towerBulletArray;
//友军发射的子弹集合
@property (nonatomic, assign) NSMutableArray *friendlyBulletArray;
//魔法发射的子弹集合
@property (nonatomic, assign) NSMutableArray *magicBulletArray;
//塔攻击的集合
@property (nonatomic, assign) NSMutableArray *towerArray;

- (CGPoint) getPositionAfterTime:(ccTime)dt isHead:(float)isHead;

//友军控制部分
+ (void) regFriendly:(TDFriendly*)f;

+ (void) tellFriendlys;

+ (void) unregFriendly:(TDFriendly*)f;

- (void) addFriendly:(TDFriendly*)f;

- (void) delFriendly:(TDFriendly*)f;

- (int) friendlyCount;

- (void) tellFriendly;

//魔法控制部分

- (void) doMagicThunder;

- (void) doMagicStop;

//逻辑控制部分

- (void) initUnitStatus;

- (void) doRunning;

- (void) doWaiting;

- (void) doAttact;

- (void) startAttact;

- (void) doAttactAction:(ccTime)dt;

@end
