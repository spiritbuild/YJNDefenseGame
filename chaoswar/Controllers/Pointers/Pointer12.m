#import "Pointer12.h"
#import "GameController.h"
#import "AnimateManager.h"
#import "SimpleAudioEngine.h"

@implementation Pointer12

- (void) initController
{
    GameController *gc = [GameController getGameController];
	gc.maxWave = 18;
	gc.currentWave = 0;
	gc.currentHealth = 10;
	gc.currentGold = 650;
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
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(84, 120) s:ccp(146, 144)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(93, 62) s:ccp(146, 135)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(158, 48) s:ccp(160, 131)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(222, 48) s:ccp(222, 131)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(218, 246) s:ccp(157, 259)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(218, 185) s:ccp(218, 146)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(348, 128) s:ccp(348, 93)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(415, 130) s:ccp(415, 93)];
}

- (BOOL) runWaves:(int)wave
{
    [super runWaves:wave];
    GameController *gc = [GameController getGameController];
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT4 s:2 t:3 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT3 s:2 t:3 wy:[gc.wayManager getWay:8]];
            
            [self prepareNextWave:12];
			break;
        case 2:
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT7 s:2 t:4 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:15];
			break;
        case 3:
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT7 s:2 t:4 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:15];
			break;
        case 4:
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:15];
			break;
        case 5:
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT11 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT4 s:2 t:4 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:18];
			break;
        case 6:
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT14 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:18];
			break;
        case 7:
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT13 s:3 t:3 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT9 s:2 t:4 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT8 s:2 t:6 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:20];
			break;
        case 8:
            [self runWave:1 e:ET_FOOT6 s:2 t:5 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT12 s:2 t:5 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT10 s:2 t:5 wy:[gc.wayManager getWay:6]];
            
            [self runWave:1 e:ET_FOOT8 s:2 t:8 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:20];
			break;
        case 9:
            [self runWave:3 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT15 s:2 t:6 wy:[gc.wayManager getWay:5]];
            
            [self runWave:3 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:20];
			break;
        case 10:
            [self runWave:1 e:ET_FOOT8 s:2 t:8 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:3 t:4 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT6 s:2 t:6 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:20];
			break;
        case 11:
            [self runWave:2 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT7 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT16 s:3 t:2 wy:[gc.wayManager getWay:5]];
            
            [self runWave:2 e:ET_FOOT6 s:2 t:5 wy:[gc.wayManager getWay:8]];
            [self runWave:1 e:ET_FOOT16 s:2 t:2 wy:[gc.wayManager getWay:9]];
            [self prepareNextWave:20];
			break;
        case 12:
            [self runWave:2 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:3]];
            
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:5]];
            [self runWave:1 e:ET_FOOT8 s:2 t:4 wy:[gc.wayManager getWay:5]];
            
            [self runWave:2 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self runWave:1 e:ET_FOOT6 s:2 t:4 wy:[gc.wayManager getWay:9]];
            [self prepareNextWave:18];
			break;
        case 13:
            [self runWave:2 e:ET_FLY3 s:2 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:2 e:ET_FLY3 s:2 t:4 wy:[gc.wayManager getWay:5]];
            
            [self runWave:2 e:ET_FLY3 s:2 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:15];
			break;
        case 14:
            [self runWave:1 e:ET_FOOT16 s:3 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT16 s:3 t:4 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT16 s:3 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:22];
			break;
        case 15:
            [self runWave:1 e:ET_FOOT15 s:3 t:4 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_FOOT15 s:3 t:4 wy:[gc.wayManager getWay:5]];
            
            [self runWave:1 e:ET_FOOT15 s:3 t:4 wy:[gc.wayManager getWay:8]];
            [self prepareNextWave:26];
			break;
        case 16:
            [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"bossBg.mp3"];
            [self runWave:1 e:ET_BOSS2 s:2 t:1 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:45];
			break;
        case 17:
            [self runWave:1 e:ET_BOSS2 s:2 t:1 wy:[gc.wayManager getWay:5]];
            [self prepareNextWave:48];
			break;
        case 18:
            [self runWave:1 e:ET_BOSS2 s:2 t:1 wy:[gc.wayManager getWay:2]];
            
            [self runWave:1 e:ET_BOSS2 s:2 t:1 wy:[gc.wayManager getWay:8]];
            //[self prepareEndPoint:16];
            [self prepareEndGame:3];
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
    [manager addWayPoint:1 wayPoint:ccp(-1, 225)];
    [manager addWayPoint:1 wayPoint:ccp(166, 225)];
    [manager addWayPoint:1 wayPoint:ccp(166, 154)];
    [manager addWayPoint:1 wayPoint:ccp(299, 154)];
    [manager addWayPoint:1 wayPoint:ccp(299, 99)];
    [manager addWayPoint:1 wayPoint:ccp(481, 99)];
    
    [manager addWayPoint:2 wayPoint:ccp(-1, 206)];
    [manager addWayPoint:2 wayPoint:ccp(151, 206)];
    [manager addWayPoint:2 wayPoint:ccp(151, 133)];
    [manager addWayPoint:2 wayPoint:ccp(284, 133)];
    [manager addWayPoint:2 wayPoint:ccp(284, 80)];
    [manager addWayPoint:2 wayPoint:ccp(481, 80)];
    
    [manager addWayPoint:3 wayPoint:ccp(-1, 190)];
    [manager addWayPoint:3 wayPoint:ccp(136, 190)];
    [manager addWayPoint:3 wayPoint:ccp(136, 121)];
    [manager addWayPoint:3 wayPoint:ccp(270, 121)];
    [manager addWayPoint:3 wayPoint:ccp(270, 63)];
    [manager addWayPoint:3 wayPoint:ccp(481, 63)];
    
    [manager addWayPoint:4 wayPoint:ccp(136, 321)];
    [manager addWayPoint:4 wayPoint:ccp(136, 120)];
    [manager addWayPoint:4 wayPoint:ccp(270, 120)];
    [manager addWayPoint:4 wayPoint:ccp(270, 63)];
    [manager addWayPoint:4 wayPoint:ccp(481, 63)];
    
    [manager addWayPoint:5 wayPoint:ccp(151, 321)];
    [manager addWayPoint:5 wayPoint:ccp(151, 133)];
    [manager addWayPoint:5 wayPoint:ccp(284, 133)];
    [manager addWayPoint:5 wayPoint:ccp(284, 80)];
    [manager addWayPoint:5 wayPoint:ccp(481, 80)];
    
    [manager addWayPoint:6 wayPoint:ccp(166, 321)];
    [manager addWayPoint:6 wayPoint:ccp(166, 153)];
    [manager addWayPoint:6 wayPoint:ccp(299, 153)];
    [manager addWayPoint:6 wayPoint:ccp(299, 99)];
    [manager addWayPoint:6 wayPoint:ccp(481, 99)];
    
    [manager addWayPoint:7 wayPoint:ccp(397, 321)];
    [manager addWayPoint:7 wayPoint:ccp(397, 253)];
    [manager addWayPoint:7 wayPoint:ccp(271, 253)];
    [manager addWayPoint:7 wayPoint:ccp(271, 63)];
    [manager addWayPoint:7 wayPoint:ccp(481, 63)];
    
    [manager addWayPoint:8 wayPoint:ccp(412, 321)];
    [manager addWayPoint:8 wayPoint:ccp(412, 236)];
    [manager addWayPoint:8 wayPoint:ccp(284, 236)];
    [manager addWayPoint:8 wayPoint:ccp(284, 80)];
    [manager addWayPoint:8 wayPoint:ccp(481, 80)];
    
    [manager addWayPoint:9 wayPoint:ccp(427, 321)];
    [manager addWayPoint:9 wayPoint:ccp(427, 220)];
    [manager addWayPoint:9 wayPoint:ccp(299, 220)];
    [manager addWayPoint:9 wayPoint:ccp(299, 99)];
    [manager addWayPoint:9 wayPoint:ccp(481, 99)];
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
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 2:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 3:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 4:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 5:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 6:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 7:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 8:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 9:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 10:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 11:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 12:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 13:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 14:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 15:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 16:
            [self autoNextWave:10 mustGold:1 addGold:1];
            //[self addWaveTip:ccp(15, 214)];
            [self addWaveTip:ccp(150, 297)];
            //[self addWaveTip:ccp(412, 297)];
			break;
        case 17:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(15, 214)];
            //[self addWaveTip:ccp(150, 297)];
            [self addWaveTip:ccp(412, 297)];
			break;
        case 18:
			break;
		default:
            //[self prepareNextWave:10];
			break;
	}
}


@end
