#import "Pointer5.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer5

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 14;
	gc.currentWave = 0;
	gc.currentHealth = 10;
	gc.currentGold = 200;
	gc.screenClickType = SCT_ALL;
	gc.operateType = OT_NORMAL;
	gc.mapType = MT_SNOW;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(130, 245) s:ccp(130, 209)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(200, 245) s:ccp(200, 209)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(271, 144) s:ccp(271, 108)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(271, 201) s:ccp(205, 204)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(137, 113) s:ccp(76, 142)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(404, 140) s:ccp(345, 157)];
}

- (BOOL) runWaves:(int)wave
{
    [super runWaves:wave];
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT4 s:1.6 t:5 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:18];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT5 s:2 t:3 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 3:
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 4:
            [self runWave:1 e:ET_FLY1 s:1.4 t:8 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:4 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT5 s:2 t:7 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 5:
            //new enemy
            [self runWave:1 e:ET_FLY1 s:1.4 t:8 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:20];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT9 s:2 t:7 wy:[gc.wayManager getWay:2]];
            [self runWave:2.5 e:ET_FOOT6 s:2 t:8 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 7:
            [self runWave:1 e:ET_FOOT6 s:1.4 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:1.4 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 8:
            [self runWave:1 e:ET_FOOT10 s:2 t:8 wy:[gc.wayManager getWay:2]];
            [self runWave:2.5 e:ET_FOOT6 s:1.4 t:8 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 9:
            //new enemy
            [self runWave:1 e:ET_FLY2 s:1 t:8 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:1.5 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:18];
			break;
        case 10:
            [self runWave:1 e:ET_FOOT10 s:3 t:6 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT9 s:2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:22];
			break;
        case 11:
            [self runWave:2 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT10 s:2 t:8 wy:[gc.wayManager getWay:2]];
            [self runWave:4 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT9 s:2 t:6 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:22];
			break;
        case 12:
            [self runWave:4 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:1]];
            [self runWave:3 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT9 s:2 t:6 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:22];
			break;
        case 13:
            [self runWave:4 e:ET_MAGIC1 s:4 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:3 e:ET_FOOT6 s:2 t:8 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT10 s:3 t:8 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:22];
			break;
        case 14:
            [self runWave:3 e:ET_FOOT10 s:1.5 t:8 wy:[gc.wayManager getWay:1]];
            [self runWave:4 e:ET_MAGIC1 s:3 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:1.2 e:ET_FOOT9 s:2 t:7 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT10 s:3 t:8 wy:[gc.wayManager getWay:3]];
            [self prepareEndPoint:19];
			break;
		default:
            [self prepareNextWave:10];
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
    [manager addWayPoint:1 wayPoint:ccp(481, 244)];
    [manager addWayPoint:1 wayPoint:ccp(324, 244)];
    [manager addWayPoint:1 wayPoint:ccp(324, 112)];
    [manager addWayPoint:1 wayPoint:ccp(220, 112)];
    [manager addWayPoint:1 wayPoint:ccp(220, 219)];
    [manager addWayPoint:1 wayPoint:ccp(57, 219)];
    [manager addWayPoint:1 wayPoint:ccp(57, 137)];
    [manager addWayPoint:1 wayPoint:ccp(-1, 137)];
    
    [manager addWayPoint:2 wayPoint:ccp(481, 229)];
    [manager addWayPoint:2 wayPoint:ccp(339, 229)];
    [manager addWayPoint:2 wayPoint:ccp(339, 97)];
    [manager addWayPoint:2 wayPoint:ccp(205, 97)];
    [manager addWayPoint:2 wayPoint:ccp(205, 206)];
    [manager addWayPoint:2 wayPoint:ccp(70, 206)];
    [manager addWayPoint:2 wayPoint:ccp(70, 124)];
    [manager addWayPoint:2 wayPoint:ccp(-1, 124)];
    
    [manager addWayPoint:3 wayPoint:ccp(481, 210)];
    [manager addWayPoint:3 wayPoint:ccp(353, 210)];
    [manager addWayPoint:3 wayPoint:ccp(353, 80)];
    [manager addWayPoint:3 wayPoint:ccp(192, 80)];
    [manager addWayPoint:3 wayPoint:ccp(192, 188)];
    [manager addWayPoint:3 wayPoint:ccp(93, 188)];
    [manager addWayPoint:3 wayPoint:ccp(93, 107)];
    [manager addWayPoint:3 wayPoint:ccp(-1, 107)];
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
            [self addWaveTip:ccp(465, 236)];
			break;
        case 2:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 236)];
			break;
        case 3:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 236)];
			break;
        case 4:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 236)];
			break;
        case 5:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 236)];
			break;
        case 6:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 236)];
			break;
        case 7:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 236)];
			break;
        case 8:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 236)];
			break;
        case 9:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 236)];
			break;
        case 10:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 236)];
			break;
        case 11:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 236)];
			break;
        case 12:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 236)];
			break;
        case 13:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(465, 236)];
			break;
        case 14:
			break;
            
		default:
            //[self prepareNextWave:10];
			break;
	}
}

@end
