#import "Pointer9.h"
#import "GameController.h"
#import "AnimateManager.h"
#import "SimpleAudioEngine.h"

@implementation Pointer9

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 18;
	gc.currentWave = 0;
	gc.currentHealth = 10;
	gc.currentGold = 420;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(55, 139) s:ccp(55, 111)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(55, 190) s:ccp(111, 203)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(179, 139) s:ccp(179, 111)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(236, 139) s:ccp(236, 111)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(292, 139) s:ccp(292, 111)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(417, 190) s:ccp(357, 194)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(417, 139) s:ccp(417, 111)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(165, 252) s:ccp(166, 223)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(289, 252) s:ccp(290, 223)];
}

- (BOOL) runWaves:(int)wave
{
    [super runWaves:wave];
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:15];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:6]];

            [self prepareNextWave:18];
			break;
        case 3:
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:2]];

            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:20];
			break;
        case 4:
            [self runWave:2 e:ET_FOOT10 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT12 s:3 t:2 wy:[gc.wayManager getWay:2]];

            [self prepareNextWave:21];
			break;
        case 5:
            [self runWave:1 e:ET_FLY2 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FLY2 s:2 t:4 wy:[gc.wayManager getWay:5]];
            
            [self prepareNextWave:20];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT4 s:1 t:7 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT4 s:1 t:7 wy:[gc.wayManager getWay:5]];
            
            [self prepareNextWave:20];
			break;
        case 7:
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT14 s:3 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT10 s:2 t:2 wy:[gc.wayManager getWay:4]];
            [self runWave:1 e:ET_FOOT12 s:3 t:3 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT4 s:2 t:2 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT11 s:3 t:3 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:25];
			break;
        case 8:
            //new enemy
            [self runWave:1 e:ET_FOOT15 s:1 t:1 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT15 s:1 t:1 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT15 s:3 t:2 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT15 s:3 t:2 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:18];
			break;
        case 9:
            [self runWave:1 e:ET_FOOT15 s:4 t:2 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT10 s:2 t:2 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT15 s:4 t:2 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT10 s:2 t:2 wy:[gc.wayManager getWay:6]];

            [self prepareNextWave:20];
			break;
        case 10:
            [self runWave:1 e:ET_FOOT15 s:3 t:1 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT11 s:3 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT15 s:3 t:1 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT12 s:3 t:2 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT15 s:3 t:1 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT10 s:2 t:3 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:20];
			break;
        case 11:
            [self runWave:1 e:ET_FOOT4 s:3 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT11 s:3 t:3 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT10 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT12 s:3 t:3 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT14 s:3 t:2 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT3 s:3 t:3 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:20];
			break;
        case 12:
            [self runWave:1 e:ET_FOOT7 s:2 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_MAGIC1 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT5 s:2 t:5 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_MAGIC2 s:2 t:4 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT9 s:2 t:5 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:20];
			break;
        case 13:
            [self runWave:1 e:ET_FOOT4 s:2 t:5 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT11 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT10 s:2 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT12 s:2 t:4 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT14 s:2 t:4 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT3 s:2 t:5 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:23];
			break;
        case 14:
            [self runWave:1 e:ET_FOOT15 s:2.5 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT15 s:2.5 t:3 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT15 s:2.5 t:3 wy:[gc.wayManager getWay:7]];
            [self prepareNextWave:23];
			break;
        case 15:
            [self runWave:1 e:ET_FOOT15 s:2.5 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT4 s:2 t:2 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT15 s:2.5 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT4 s:2 t:2 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT15 s:2.5 t:3 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT10 s:2 t:1 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:23];
			break;
        case 16:
            [self runWave:1 e:ET_FOOT15 s:2.5 t:3 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT15 s:2.5 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT15 s:2.5 t:3 wy:[gc.wayManager getWay:7]];
            [self runWave:1 e:ET_FOOT10 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:23];
			break;
        case 17:
            [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"bossBg.mp3"];
            [self runWave:1 e:ET_BOSS1 s:2 t:1 wy:[gc.wayManager getWay:7]];
            [self prepareNextWave:40];
			break;
        case 18:
            [self runWave:1 e:ET_BOSS1 s:2 t:1 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_BOSS1 s:2 t:1 wy:[gc.wayManager getWay:5]];
            [self prepareEndPoint:3];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 116)];
    [manager addWayPoint:1 wayPoint:ccp(101, 116)];
    [manager addWayPoint:1 wayPoint:ccp(101, 229)];
    [manager addWayPoint:1 wayPoint:ccp(214, 229)];
    [manager addWayPoint:1 wayPoint:ccp(214, 321)];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 99)];
    [manager addWayPoint:2 wayPoint:ccp(116, 99)];
    [manager addWayPoint:2 wayPoint:ccp(116, 214)];
    [manager addWayPoint:2 wayPoint:ccp(229, 214)];
    [manager addWayPoint:2 wayPoint:ccp(229, 321)];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 82)];
    [manager addWayPoint:3 wayPoint:ccp(130, 82)];
    [manager addWayPoint:3 wayPoint:ccp(130, 198)];
    [manager addWayPoint:3 wayPoint:ccp(246, 198)];
    [manager addWayPoint:3 wayPoint:ccp(246, 321)];
    
    [manager addWayPoint:4 wayPoint:ccp(481, 115)];
    [manager addWayPoint:4 wayPoint:ccp(373, 115)];
    [manager addWayPoint:4 wayPoint:ccp(373, 229)];
    [manager addWayPoint:4 wayPoint:ccp(246, 229)];
    [manager addWayPoint:4 wayPoint:ccp(246, 321)];
    
    [manager addWayPoint:5 wayPoint:ccp(481, 99)];
    [manager addWayPoint:5 wayPoint:ccp(357, 99)];
    [manager addWayPoint:5 wayPoint:ccp(357, 214)];
    [manager addWayPoint:5 wayPoint:ccp(229, 214)];
    [manager addWayPoint:5 wayPoint:ccp(229, 321)];
    
    [manager addWayPoint:6 wayPoint:ccp(481, 82)];
    [manager addWayPoint:6 wayPoint:ccp(343, 82)];
    [manager addWayPoint:6 wayPoint:ccp(343, 198)];
    [manager addWayPoint:6 wayPoint:ccp(214, 198)];
    [manager addWayPoint:6 wayPoint:ccp(214, 321)];
    
    [manager addWayPoint:7 wayPoint:ccp(216, -1)];
    [manager addWayPoint:7 wayPoint:ccp(216, 99)];
    [manager addWayPoint:7 wayPoint:ccp(116, 99)];
    [manager addWayPoint:7 wayPoint:ccp(116, 214)];
    [manager addWayPoint:7 wayPoint:ccp(229, 214)];
    [manager addWayPoint:7 wayPoint:ccp(229, 321)];

    [manager addWayPoint:8 wayPoint:ccp(238, -1)];
    [manager addWayPoint:8 wayPoint:ccp(238, 99)];
    [manager addWayPoint:8 wayPoint:ccp(357, 99)];
    [manager addWayPoint:8 wayPoint:ccp(357, 214)];
    [manager addWayPoint:8 wayPoint:ccp(229, 214)];
    [manager addWayPoint:8 wayPoint:ccp(229, 321)];
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
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            //[self addWaveTip:ccp(228, 48)];
			break;
        case 2:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            [self addWaveTip:ccp(228, 48)];
			break;
        case 3:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            //[self addWaveTip:ccp(465, 107)];
            //[self addWaveTip:ccp(228, 48)];
			break;
        case 4:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            //[self addWaveTip:ccp(228, 48)];
			break;
        case 5:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            //[self addWaveTip:ccp(228, 48)];
			break;
        case 6:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            [self addWaveTip:ccp(228, 48)];
			break;
        case 7:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            [self addWaveTip:ccp(228, 48)];
			break;
        case 8:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            //[self addWaveTip:ccp(228, 48)];
			break;
        case 9:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            [self addWaveTip:ccp(228, 48)];
			break;
        case 10:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            [self addWaveTip:ccp(228, 48)];
			break;
        case 11:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            [self addWaveTip:ccp(228, 48)];
			break;
        case 12:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            [self addWaveTip:ccp(228, 48)];
			break;
        case 13:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            [self addWaveTip:ccp(228, 48)];
			break;
        case 14:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            [self addWaveTip:ccp(228, 48)];
			break;
        case 15:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            [self addWaveTip:ccp(228, 48)];
			break;
        case 16:
            [self autoNextWave:10 mustGold:1 addGold:1];
            //[self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            //[self addWaveTip:ccp(228, 48)];
			break;
        case 17:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 107)];
            [self addWaveTip:ccp(465, 107)];
            //[self addWaveTip:ccp(228, 48)];
			break;
        case 18:
			break;
		default:
            //[self prepareNextWave:10];
			break;
	}
}

@end
