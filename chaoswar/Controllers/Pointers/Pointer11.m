#import "Pointer11.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer11

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 15;
	gc.currentWave = 0;
	gc.currentHealth = 10;
	gc.currentGold = 580;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(28, 112) s:ccp(93, 130)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(28, 177) s:ccp(92, 198)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(447, 112) s:ccp(385, 127)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(447, 177) s:ccp(385, 196)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(161, 147) s:ccp(161, 115)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(240, 147) s:ccp(240, 115)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(317, 147) s:ccp(317, 115)];
}

- (BOOL) runWaves:(int)wave
{
    [super runWaves:wave];
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:15];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT3 s:2 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT4 s:2 t:2 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT4 s:2 t:2 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:15];
			break;
        case 3:
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT4 s:2 t:2 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT4 s:2 t:2 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:15];
			break;
        case 4:
            [self runWave:1 e:ET_FOOT14 s:2.5 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT7 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:20];
			break;
        case 5:
            [self runWave:1 e:ET_FOOT11 s:3 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT7 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:20];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT12 s:3 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:3 e:ET_FOOT10 s:2 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT14 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:20];
			break;
        case 7:
            [self runWave:1 e:ET_FOOT16 s:3 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:20];
			break;
        case 8:
            [self runWave:1 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:5]];
            [self runWave:2 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:22];
			break;
        case 9:
            [self runWave:1 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:5]];
            [self runWave:2 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:22];
			break;
        case 10:
            [self runWave:1 e:ET_FOOT12 s:2 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT10 s:2 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT11 s:2 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:22];
			break;
        case 11:
            [self runWave:1 e:ET_FLY2 s:3 t:5 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FLY3 s:3 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:18];
			break;
        case 12:
            [self runWave:1 e:ET_FOOT11 s:2 t:2 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT16 s:6 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT15 s:6 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT6 s:2 t:3 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:22];
			break;
        case 13:
            [self runWave:1 e:ET_FOOT8 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT14 s:6 t:1 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT6 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT6 s:2 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT8 s:2 t:5 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:22];
			break;
        case 14:
            [self runWave:2 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT16 s:2 t:2 wy:[gc.wayManager getWay:1]];
            [self runWave:2 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:2 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT13 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:2 e:ET_FOOT9 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:22];
			break;
        case 15:
            [self runWave:1 e:ET_FOOT16 s:3 t:4 wy:[gc.wayManager getWay:1]];
            
            [self runWave:1 e:ET_FOOT14 s:2.5 t:4 wy:[gc.wayManager getWay:5]];
            [self runWave:3 e:ET_FOOT3 s:2 t:5 wy:[gc.wayManager getWay:6]];
            [self prepareEndPoint:13];
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
    [manager addWayPoint:1 wayPoint:ccp(125, 321)];
    [manager addWayPoint:1 wayPoint:ccp(125, 251)];
    [manager addWayPoint:1 wayPoint:ccp(81, 251)];
    [manager addWayPoint:1 wayPoint:ccp(81, 89)];
    [manager addWayPoint:1 wayPoint:ccp(230, 89)];
    [manager addWayPoint:1 wayPoint:ccp(230, -1)];
    
    [manager addWayPoint:2 wayPoint:ccp(140, 321)];
    [manager addWayPoint:2 wayPoint:ccp(140, 236)];
    [manager addWayPoint:2 wayPoint:ccp(94, 236)];
    [manager addWayPoint:2 wayPoint:ccp(94, 106)];
    [manager addWayPoint:2 wayPoint:ccp(245, 106)];
    [manager addWayPoint:2 wayPoint:ccp(245, -1)];
    
    [manager addWayPoint:3 wayPoint:ccp(155, 321)];
    [manager addWayPoint:3 wayPoint:ccp(155, 246)];
    [manager addWayPoint:3 wayPoint:ccp(369, 246)];
    [manager addWayPoint:3 wayPoint:ccp(369, 121)];
    [manager addWayPoint:3 wayPoint:ccp(230, 121)];
    [manager addWayPoint:3 wayPoint:ccp(230, -1)];
    
    [manager addWayPoint:4 wayPoint:ccp(336, 321)];
    [manager addWayPoint:4 wayPoint:ccp(336, 221)];
    [manager addWayPoint:4 wayPoint:ccp(109, 221)];
    [manager addWayPoint:4 wayPoint:ccp(109, 121)];
    [manager addWayPoint:4 wayPoint:ccp(260, 121)];
    [manager addWayPoint:4 wayPoint:ccp(260, -1)];
    
    [manager addWayPoint:5 wayPoint:ccp(351, 321)];
    [manager addWayPoint:5 wayPoint:ccp(351, 236)];
    [manager addWayPoint:5 wayPoint:ccp(383, 236)];
    [manager addWayPoint:5 wayPoint:ccp(383, 106)];
    [manager addWayPoint:5 wayPoint:ccp(245, 106)];
    [manager addWayPoint:5 wayPoint:ccp(245, -1)];
    
    [manager addWayPoint:6 wayPoint:ccp(366, 321)];
    [manager addWayPoint:6 wayPoint:ccp(366, 251)];
    [manager addWayPoint:6 wayPoint:ccp(396, 251)];
    [manager addWayPoint:6 wayPoint:ccp(396, 89)];
    [manager addWayPoint:6 wayPoint:ccp(260, 89)];
    [manager addWayPoint:6 wayPoint:ccp(260, -1)];
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
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 2:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 3:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 4:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 5:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 6:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 7:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 8:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 9:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 10:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 11:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 12:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 13:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 14:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(141, 297)];
            [self addWaveTip:ccp(350, 297)];
			break;
        case 15:
			break;
		default:
            //[self prepareNextWave:10];
			break;
	}
}


@end
