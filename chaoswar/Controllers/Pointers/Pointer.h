#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "Wave.h"

@class WayManager;
@class TDBullet;
@class TDTower;
@class TDEnemy;
@class TDFriendly;
@class WayPoint;
@class AnimateManager;

@interface Pointer : NSObject {
    AnimateManager *animateManager;
    UIImage *imgBackground;
}

@property int pointerNum;
@property (nonatomic, retain) NSMutableArray *waveArray;
@property (nonatomic, retain) NSMutableArray *tipsArray;
@property int waveGold;
@property int waveMinusGold;

- (CCAnimation*) getAnimation:(NSString*)animationName;

- (void) addTower:(NSMutableArray*)a t:(TDTower*)t p:(CGPoint)p s:(CGPoint)s;

- (void) runWave:(float)b e:(TEnemyType)e s:(float)s t:(int)t wy:(NSMutableArray*)wy;

- (void) prepareNextWave:(ccTime)dt;

- (void) prepareEndPoint:(ccTime)dt;

- (void) prepareEndGame:(ccTime)dt;

- (void) doAutoNextWave;

- (void) addWaveTip:(CGPoint)pos;

- (void) autoNextWave:(ccTime)dt mustGold:(int)mustGold addGold:(int)addGold;

- (void) endThisPoint:(ccTime)dt;

- (void) initController;

- (void) initAnimate;

- (void) initEnemy:(NSMutableArray*)array;

- (void) initTower:(NSMutableArray*)array;

- (BOOL) runWaves:(int)wave;

- (void) initBullety:(NSMutableArray*)array;

- (void) initWayPoint:(WayManager*)manager;

- (void) initFriendly:(NSMutableArray*)array;

- (BOOL) isWhite:(CGPoint)point;

- (void) stopController;

- (void) setImageName:(NSString*)name;

@end
