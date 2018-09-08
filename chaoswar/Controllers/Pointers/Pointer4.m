#import "Pointer4.h"
#import "GameController.h"
#import "AnimateManager.h"

@implementation Pointer4

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 16;
	gc.currentWave = 0;
	gc.currentHealth = 10;
	gc.currentGold = 250;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(212, 186) s:ccp(146, 299)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(212, 243) s:ccp(149, 256)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(83, 156) s:ccp(147, 173)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(344, 142) s:ccp(282, 160)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(150, 56) s:ccp(215, 83)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(279, 56) s:ccp(215, 75)];
}

- (BOOL) runWaves:(int)wave
{
    [super runWaves:wave];
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:18];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT4 s:1.1 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:24];
			break;
        case 3:
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT5 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:25];
			break;
        case 4:
            //new enemy
            [self runWave:1 e:ET_FOOT9 s:3 t:4 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:25];
            break;
        case 5:
            [self runWave:1 e:ET_FOOT9 s:3 t:2 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:25];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT9 s:3 t:2 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:25];
			break;
        case 7:
            [self runWave:2 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_MAGIC1 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT5 s:2 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:2 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT4 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:6]];
            [self prepareNextWave:25];
			break;
        case 8:
            [self runWave:1 e:ET_MAGIC1 s:4 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT5 s:2 t:6 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FLY1 s:2.5 t:6 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:23];
			break;
        case 9:
            [self runWave:1 e:ET_FLY1 s:2.5 t:8 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FLY1 s:2.5 t:6 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:25];
			break;
        case 10:
            //new enemy
            [self runWave:1 e:ET_FOOT10 s:3 t:4 wy:[gc.wayManager getWay:2]];

            [self prepareNextWave:22];
			break;
        case 11:
            [self runWave:2 e:ET_FOOT10 s:3 t:6 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1.5 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:2 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:22];
			break;
        case 12:
            [self runWave:2 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:3]];
            [self runWave:2 e:ET_FOOT10 s:3 t:6 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_MAGIC1 s:3 t:2 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT5 s:2 t:6 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:20];
			break;
        case 13:
            [self runWave:2 e:ET_FOOT9 s:2 t:2 wy:[gc.wayManager getWay:3]];
            [self runWave:2 e:ET_FOOT10 s:2 t:5 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1.5 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT7 s:3 t:4 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:20];
			break;
        case 14:
            [self runWave:1 e:ET_MAGIC1 s:3 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT5 s:2 t:6 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT7 s:3 t:7 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:20];
			break;
        case 15:
            [self runWave:1 e:ET_MAGIC1 s:3 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT5 s:2 t:7 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FLY1 s:3 t:6 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:21];
			break;
        case 16:
            [self runWave:1 e:ET_MAGIC1 s:3 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT4 s:2 t:6 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT10 s:2 t:7 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FLY1 s:3 t:8 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT10 s:2 t:3 wy:[gc.wayManager getWay:6]];
            [self prepareEndPoint:25];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 260)];
    [manager addWayPoint:1 wayPoint:ccp(160, 260)];
    [manager addWayPoint:1 wayPoint:ccp(160, 161)];
    [manager addWayPoint:1 wayPoint:ccp(225, 161)];
    [manager addWayPoint:1 wayPoint:ccp(225, -1)];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 246)];
    [manager addWayPoint:2 wayPoint:ccp(146, 246)];
    [manager addWayPoint:2 wayPoint:ccp(146, 147)];
    [manager addWayPoint:2 wayPoint:ccp(212, 147)];
    [manager addWayPoint:2 wayPoint:ccp(212, -1)];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 233)];
    [manager addWayPoint:3 wayPoint:ccp(131, 233)];
    [manager addWayPoint:3 wayPoint:ccp(131, 132)];
    [manager addWayPoint:3 wayPoint:ccp(198, 132)];
    [manager addWayPoint:3 wayPoint:ccp(198, -1)];
    
    [manager addWayPoint:4 wayPoint:ccp(481, 171)];
    [manager addWayPoint:4 wayPoint:ccp(426, 171)];
    [manager addWayPoint:4 wayPoint:ccp(426, 238)];
    [manager addWayPoint:4 wayPoint:ccp(267, 237)];
    [manager addWayPoint:4 wayPoint:ccp(267, 161)];
    [manager addWayPoint:4 wayPoint:ccp(196, 161)];
    [manager addWayPoint:4 wayPoint:ccp(196, -1)];
    
    [manager addWayPoint:5 wayPoint:ccp(481, 157)];
    [manager addWayPoint:5 wayPoint:ccp(411, 157)];
    [manager addWayPoint:5 wayPoint:ccp(411, 222)];
    [manager addWayPoint:5 wayPoint:ccp(280, 222)];
    [manager addWayPoint:5 wayPoint:ccp(280, 147)];
    [manager addWayPoint:5 wayPoint:ccp(212, 147)];
    [manager addWayPoint:5 wayPoint:ccp(212, -1)];
    
    [manager addWayPoint:6 wayPoint:ccp(481, 141)];
    [manager addWayPoint:6 wayPoint:ccp(396, 141)];
    [manager addWayPoint:6 wayPoint:ccp(396, 207)];
    [manager addWayPoint:6 wayPoint:ccp(295, 207)];
    [manager addWayPoint:6 wayPoint:ccp(295, 130)];
    [manager addWayPoint:6 wayPoint:ccp(226, 130)];
    [manager addWayPoint:6 wayPoint:ccp(226, -1)];
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
            [self addWaveTip:ccp(15, 253)];
            [self addWaveTip:ccp(465, 163)];
			break;
        case 2:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 253)];
            [self addWaveTip:ccp(465, 163)];
			break;
        case 3:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 253)];
			break;
        case 4:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 253)];
            [self addWaveTip:ccp(465, 163)];
			break;
        case 5:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 253)];
            [self addWaveTip:ccp(465, 163)];
			break;
        case 6:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 253)];
            [self addWaveTip:ccp(465, 163)];
			break;
        case 7:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 253)];
            [self addWaveTip:ccp(465, 163)];
			break;
        case 8:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 253)];
            [self addWaveTip:ccp(465, 163)];
			break;
        case 9:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 253)];
			break;
        case 10:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 253)];
            [self addWaveTip:ccp(465, 163)];
			break;
        case 11:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 253)];
            [self addWaveTip:ccp(465, 163)];
			break;
        case 12:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 253)];
            [self addWaveTip:ccp(465, 163)];
			break;
        case 13:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 253)];
            [self addWaveTip:ccp(465, 163)];
			break;
        case 14:
			break;
            
		default:
            //[self prepareNextWave:10];
			break;
	}
}

@end
