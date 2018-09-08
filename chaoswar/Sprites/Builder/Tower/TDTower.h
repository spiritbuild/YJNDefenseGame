#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "TDBuilder.h"
#import "TDSprite.h"
#import "TDEnemy.h"
#import "TDBullet.h"
#import "GameController.h"

@interface TDTower : TDBuilder {
    CCSprite *towerBG;
}

@property (nonatomic, assign, readwrite) TDEnemy *enemy;
@property CGPoint enemyPoint;
@property (nonatomic, retain) NSMutableArray *bulletArray;
@property int towerLevel;
@property (nonatomic, assign) CCSprite *towerBG;
@property (nonatomic, assign) CCSprite *rangeSprite;
@property CGPoint bulletCenter;
@property CGPoint rangeCenter;
@property CGPoint searchPoint;
@property BOOL canBuild1;
@property BOOL canBuild2;
@property BOOL canBuild3;
@property BOOL canBuild4;
@property BOOL canUpdate;

- (TDEnemy*) searchClearEnemy;
- (BOOL) canAttactEnemy;
- (void) updateTower:(TDTower*)tower ;
- (void) sellTower;

@end

@interface TDEmptyTower : TDTower {
    
}

@property (nonatomic, assign) CCSprite *progressLine;
@property (nonatomic, assign) CCSprite *progressBack;

- (void) buildTower:(NSString*)buildBG selector:(SEL)selector;
- (void) afterBulidArrayTower:(ccTime)dt;
- (void) afterBulidDefenceTower:(ccTime)dt;
- (void) afterBulidTurretTower:(ccTime)dt;
- (void) afterBulidMagicTower:(ccTime)dt;

@end

