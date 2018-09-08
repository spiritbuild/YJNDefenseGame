#import "Pointer3.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer3

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 14;
	gc.currentWave = 0;
	gc.currentHealth = 10;
	gc.currentGold = 200;
	gc.screenClickType = SCT_ALL;
	gc.operateType = OT_NORMAL;
	gc.mapType = MT_GREEN;
	gc.canNext = YES;
    self.waveGold = 0;
}

- (void) initEnemy:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initTower:(NSMutableArray*)array
{
    [array removeAllObjects];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(188, 260) s:ccp(188, 225)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(250, 260) s:ccp(250, 225)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(409, 192) s:ccp(409, 157)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(30, 145) s:ccp(91, 157)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(154, 139) s:ccp(152, 226)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(215, 139) s:ccp(215, 226)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(280, 139) s:ccp(280, 226)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(307, 60) s:ccp(245, 72)];
}

- (BOOL) runWaves:(int)wave
{
    [super runWaves:wave];
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
			[self runWave:2 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT3 s:2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 2:
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 3:
            [self runWave:2 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 4:
			[self runWave:2 e:ET_FOOT3 s:2 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT3 s:2 t:6 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 5:
            //new enemy
            [self runWave:1 e:ET_FOOT7 s:3 t:4 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:15];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT2 s:2 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT7 s:2 t:8 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:16];
			break;
        case 7:
			[self runWave:1.5 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT7 s:2 t:8 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:18];
			break;
        case 8:
			[self runWave:1.5 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 9:
            //new enemy
			[self runWave:1 e:ET_FLY1 s:2 t:5 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:16];
			break;
        case 10:
            [self runWave:1 e:ET_FLY1 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1.5 e:ET_FLY1 s:2 t:3 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:18];
			break;
        case 11:
            [self runWave:2 e:ET_FOOT4 s:2 t:7 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:3 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT5 s:2 t:7 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:18];
			break;
        case 12:
            [self runWave:1.5 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT7 s:2 t:7 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT2 s:2 t:6 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:18];
			break;
        case 13:
			[self runWave:1.5 e:ET_FLY1 s:2 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:3.5 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT5 s:2 t:6 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:18];
			break;
        case 14:
            [self runWave:12 e:ET_FLY1 s:2 t:6 wy:[gc.wayManager getWay:1]];
            [self runWave:12 e:ET_FOOT7 s:3 t:6 wy:[gc.wayManager getWay:2]];
            [self runWave:12 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:3]];
            [self runWave:2 e:ET_FLY1 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:3 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT5 s:2 t:4 wy:[gc.wayManager getWay:3]];
            [self prepareEndPoint:24];
			break;
		default:
            //[self prepareNextWave:10];
			break;
	}
	gc.canNext = NO;
    [gc setGameStatus];
    return YES;
}

- (void) initBullety:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initWayPoint:(WayManager*)manager
{
    [manager removeAllWay];
    [manager addWayPoint:1 wayPoint:ccp(481, 169)];
    [manager addWayPoint:1 wayPoint:ccp(359, 169)];
    [manager addWayPoint:1 wayPoint:ccp(359, 236)];
    [manager addWayPoint:1 wayPoint:ccp(77, 236)];
    [manager addWayPoint:1 wayPoint:ccp(77, 82)];
    [manager addWayPoint:1 wayPoint:ccp(231, 82)];
    [manager addWayPoint:1 wayPoint:ccp(231, -1)];
    
    [manager addWayPoint:2 wayPoint:ccp(481, 154)];
    [manager addWayPoint:2 wayPoint:ccp(344, 154)];
    [manager addWayPoint:2 wayPoint:ccp(344, 222)];
    [manager addWayPoint:2 wayPoint:ccp(92, 222)];
    [manager addWayPoint:2 wayPoint:ccp(92, 97)];
    [manager addWayPoint:2 wayPoint:ccp(246, 97)];
    [manager addWayPoint:2 wayPoint:ccp(246, -1)];
    
    [manager addWayPoint:3 wayPoint:ccp(481, 136)];
    [manager addWayPoint:3 wayPoint:ccp(332, 136)];
    [manager addWayPoint:3 wayPoint:ccp(332, 204)];
    [manager addWayPoint:3 wayPoint:ccp(113, 204)];
    [manager addWayPoint:3 wayPoint:ccp(113, 112)];
    [manager addWayPoint:3 wayPoint:ccp(261, 112)];
    [manager addWayPoint:3 wayPoint:ccp(261, -1)];
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) doAutoNextWave
{
    [super doAutoNextWave];
    switch ([GameController getGameController].currentWave) {
		case 1:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 158)];
			break;
        case 2:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 158)];
			break;
        case 3:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 158)];
			break;
        case 4:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 158)];
			break;
        case 5:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 158)];
			break;
        case 6:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 158)];
			break;
        case 7:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 158)];
			break;
        case 8:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 158)];
			break;
        case 9:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 158)];
			break;
        case 10:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 158)];
			break;
        case 11:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 158)];
			break;
        case 12:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 158)];
			break;
        case 13:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 158)];
			break;
        case 14:
			break;
            
		default:
            //[self prepareNextWave:10];
			break;
	}
}

@end
