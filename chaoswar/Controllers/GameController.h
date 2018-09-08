#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@class GameBackgroundScene;
@class GameImfomationScene;
@class GameMagicScene;
@class GameControllerScene;
@class SpriteInfoScene;
@class GameHintScene;
@class Pointer;
@class WayManager;
@class Wave;

@interface GameController : NSObject {
    GameBackgroundScene *_gameBackground;
    GameImfomationScene *_gameImfomation;
    GameMagicScene *_gameMagic;
    GameControllerScene *_gameController;
	SpriteInfoScene *_spriteInfo;
    GameHintScene *_gameHint;
    NSMutableArray *_enemyArray;
    NSMutableArray *_towerArray;
    NSMutableArray *_bulletArray;
    NSMutableArray *_frientlyArray;
    WayManager *_wayManager;
    Pointer *_pt;
    int _ptNum;
    int _maxWave;
    int _currentWave;
    int _currentHealth;
    int _currentGold;
    TScreenClickType _screenClickType;
    TOperateType _operateType;
    TMapType _mapType;
    BOOL _canNext;
}

@property (nonatomic, assign) GameBackgroundScene *gameBackground;
@property (nonatomic, assign) GameImfomationScene *gameImfomation;
@property (nonatomic, assign) GameMagicScene *gameMagic;
@property (nonatomic, assign) GameControllerScene *gameController;
@property (nonatomic, assign) SpriteInfoScene *spriteInfo;
@property (nonatomic, assign) GameHintScene *gameHint;
@property (nonatomic, assign) NSMutableArray *enemyArray;
@property (nonatomic, assign) NSMutableArray *towerArray;
@property (nonatomic, assign) NSMutableArray *bulletArray;
@property (nonatomic, assign) NSMutableArray *frientlyArray;
@property (nonatomic, assign) WayManager *wayManager;
@property (nonatomic, assign) Pointer *pt;
@property (nonatomic, assign) int ptNum;
@property int maxWave;
@property int currentWave;
@property int currentHealth;
@property int currentGold;
@property TScreenClickType screenClickType;
@property TOperateType operateType;
@property TMapType mapType;
@property BOOL canNext;

+ (GameController*) getGameController;

+ (void) initGameController;

+ (void) releaseGameController;

- (CCAnimation*) getAnimation:(NSString*)animationName;

- (void) initScene;

- (void) releaseScene;

- (void) initController:(int)p;

- (void) start;

- (void) restart;

- (void) doMagicFire:(CGPoint)point;

- (void) doMagicFriendly:(CGPoint)point;

- (void) doSetSearchPoint:(CGPoint)point;

- (void) stopGame;

- (void) setGameStatus;

- (void) startNextWave;

- (void) ArchieveHint:(NSString*)hint;

- (void) TouchHint:(NSString*)hint;

@end
