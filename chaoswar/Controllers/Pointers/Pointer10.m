#import "Pointer10.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer10

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 14;
	gc.currentWave = 0;
	gc.currentHealth = 10;
	gc.currentGold = 460;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(115, 135) s:ccp(115, 107)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(115, 189) s:ccp(176, 210)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(245, 143) s:ccp(245, 111)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(307, 143) s:ccp(307, 111)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(370, 143) s:ccp(328, 109)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(204, 275) s:ccp(204, 245)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(395, 66) s:ccp(335, 80)];
}

- (BOOL) runWaves:(int)wave
{
    [super runWaves:wave];
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:2]];

            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:18];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT3 s:2 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT4 s:2 t:2 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT4 s:2 t:2 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:20];
			break;
        case 3:
            [self runWave:1 e:ET_FOOT11 s:3 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT7 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:20];
			break;
        case 4:
            [self runWave:1 e:ET_FOOT12 s:3 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT10 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT7 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:20];
			break;
        case 5:
            [self runWave:1 e:ET_FOOT13 s:3 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT9 s:2 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT14 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:25];
			break;
        case 6:
            //new enemy
            [self runWave:1 e:ET_FOOT16 s:3 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:3 t:1 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:20];
			break;
        case 7:
            [self runWave:1 e:ET_FOOT16 s:4 t:1 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:4 t:1 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:26];
			break;
        case 8:
            [self runWave:1 e:ET_FOOT16 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:4 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:28];
			break;
        case 9:
            [self runWave:1 e:ET_FOOT16 s:8 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:5 e:ET_FOOT15 s:8 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT6 s:2 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT16 s:8 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:5 e:ET_FOOT15 s:8 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT6 s:2 t:3 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:28];
			break;
        case 10:
            [self runWave:1 e:ET_FLY3 s:3 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FLY3 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:19];
			break;
        case 11:
            [self runWave:1 e:ET_FOOT12 s:2 t:2 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT16 s:6 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT11 s:2 t:2 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT15 s:6 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT8 s:2 t:3 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:25];
			break;
        case 12:
            [self runWave:1 e:ET_FOOT8 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT6 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT6 s:2 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT8 s:2 t:5 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:25];
			break;
        case 13:
            [self runWave:2 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:1]];
            [self runWave:2 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:2 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:5]];
            [self runWave:2 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:25];
			break;
        case 14:
            [self runWave:1 e:ET_FOOT16 s:3 t:5 wy:[gc.wayManager getWay:1]];
            
            [self runWave:1 e:ET_FOOT16 s:3 t:5 wy:[gc.wayManager getWay:5]];
            [self prepareEndPoint:16];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 107)];
    [manager addWayPoint:1 wayPoint:ccp(148, 107)];
    [manager addWayPoint:1 wayPoint:ccp(344, 118)];
    [manager addWayPoint:1 wayPoint:ccp(344, -1)];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 93)];
    [manager addWayPoint:2 wayPoint:ccp(148, 93)];
    [manager addWayPoint:2 wayPoint:ccp(331, 104)];
    [manager addWayPoint:2 wayPoint:ccp(331, -1)];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 71)];
    [manager addWayPoint:3 wayPoint:ccp(148, 71)];
    [manager addWayPoint:3 wayPoint:ccp(318, 88)];
    [manager addWayPoint:3 wayPoint:ccp(318, -1)];
    
    [manager addWayPoint:4 wayPoint:ccp(481, 251)];
    [manager addWayPoint:4 wayPoint:ccp(167, 251)];
    [manager addWayPoint:4 wayPoint:ccp(167, 84)];
    [manager addWayPoint:4 wayPoint:ccp(318, 84)];
    [manager addWayPoint:4 wayPoint:ccp(318, -1)];
    
    [manager addWayPoint:5 wayPoint:ccp(481, 233)];
    [manager addWayPoint:5 wayPoint:ccp(180, 233)];
    [manager addWayPoint:5 wayPoint:ccp(180, 100)];
    [manager addWayPoint:5 wayPoint:ccp(331, 100)];
    [manager addWayPoint:5 wayPoint:ccp(331, -1)];
    
    [manager addWayPoint:6 wayPoint:ccp(481, 218)];
    [manager addWayPoint:6 wayPoint:ccp(195, 218)];
    [manager addWayPoint:6 wayPoint:ccp(195, 113)];
    [manager addWayPoint:6 wayPoint:ccp(348, 113)];
    [manager addWayPoint:6 wayPoint:ccp(348, -1)];
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
            [self addWaveTip:ccp(15, 95)];
            [self addWaveTip:ccp(465, 242)];
			break;
        case 2:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 95)];
            [self addWaveTip:ccp(465, 242)];
			break;
        case 3:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 95)];
            [self addWaveTip:ccp(465, 242)];
			break;
        case 4:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 95)];
            [self addWaveTip:ccp(465, 242)];
			break;
        case 5:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 95)];
            [self addWaveTip:ccp(465, 242)];
			break;
        case 6:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 95)];
            [self addWaveTip:ccp(465, 242)];
			break;
        case 7:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 95)];
            [self addWaveTip:ccp(465, 242)];
			break;
        case 8:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 95)];
            [self addWaveTip:ccp(465, 242)];
			break;
        case 9:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 95)];
            [self addWaveTip:ccp(465, 242)];
			break;
        case 10:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 95)];
            [self addWaveTip:ccp(465, 242)];
			break;
        case 11:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 95)];
            [self addWaveTip:ccp(465, 242)];
			break;
        case 12:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 95)];
            [self addWaveTip:ccp(465, 242)];
			break;
        case 13:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 95)];
            [self addWaveTip:ccp(465, 242)];
			break;
        case 14:
			break;
		default:
            //[self prepareNextWave:10];
			break;
	}
}


@end
