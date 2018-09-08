#import "Pointer1.h"
#import "GameController.h"
#import "AnimateManager.h"
#import "SimpleAudioEngine.h"

@implementation Pointer1

- (void) initController
{
    //初始化控制器
    GameController *gc = [GameController getGameController];
    //波数
	gc.maxWave = 8;
	gc.currentWave = 0;
    //可以逃掉多少兵
	gc.currentHealth = 10;
    //初始金币
	gc.currentGold = 100;
    //这些不管
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
    //初始化建塔地点，参数p是建塔地点的正下方的位置，而不是图片的中间位置
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(300, 131) s:ccp(365, 131)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(233, 131) s:ccp(233, 214)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(180, 53) s:ccp(245, 53)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(432, 143) s:ccp(365, 143)];
    [self addTower:array t:[TDEmptyTower getSprite] p:ccp(218, 251) s:ccp(155, 263)];
}

- (BOOL) runWaves:(int)wave
{
    [super runWaves:wave];
    //出兵的控制
    GameController *gc = [GameController getGameController];
    //每一波的出兵数和顺序
    //runWave函数参数
    // runWave:等待几秒开始出兵
    // e:兵的种类
    // s:出兵后没间隔几秒出一次兵
    // t:出兵的数量
    // wy:路线，路线维护在下面
	switch (wave) {
		case 1:
            [self runWave:1 e:ET_FOOT1 s:2 t:3 wy:[gc.wayManager getWay:2]];
            
//            [self runWave:3 e:ET_FOOT1 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:6 e:ET_FOOT2 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:9 e:ET_FOOT3 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:12 e:ET_FOOT4 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:15 e:ET_FOOT5 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:18 e:ET_FOOT6 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:21 e:ET_FOOT7 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:24 e:ET_FOOT8 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:27 e:ET_FOOT9 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:30 e:ET_FOOT10 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:31 e:ET_FOOT11 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:35 e:ET_FOOT12 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:38 e:ET_FOOT13 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:41 e:ET_FOOT14 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:45 e:ET_FOOT15 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:48 e:ET_FOOT16 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:51 e:ET_FLY1 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:55 e:ET_FLY2 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:58 e:ET_FLY3 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:61 e:ET_MAGIC1 s:2 t:1 wy:[gc.wayManager getWay:2]];
//            [self runWave:65 e:ET_MAGIC2 s:2 t:1 wy:[gc.wayManager getWay:2]];
            //prepareNextWave函数参数，等待多少秒之后，可以点击下一波
            //[self prepareEndPoint:7];
            //[self prepareEndGame:7];
            [self prepareNextWave:16];
			break;
        case 2:
            //new enemy
            [self runWave:1 e:ET_FOOT1 s:2.2 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT2 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self prepareNextWave:18];
			break;
        case 3:
            [self runWave:1 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:20];
			break;
        case 4:
            [self runWave:1.5 e:ET_FOOT1 s:2 t:3 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT1 s:2 t:3 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:18];
			break;
        case 5:
            //new enemy
            [self runWave:1 e:ET_FOOT3 s:2 t:5 wy:[gc.wayManager getWay:2]];
            [self prepareNextWave:20];
			break;
        case 6:
            [self runWave:1.5 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT3 s:2 t:4 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 7:
            [self runWave:1.5 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT3 s:2 t:6 wy:[gc.wayManager getWay:2]];
            [self runWave:1.5 e:ET_FOOT2 s:2 t:4 wy:[gc.wayManager getWay:3]];
            [self prepareNextWave:20];
			break;
        case 8:
            [self runWave:1.5 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:1]];
            [self runWave:1 e:ET_FOOT3 s:2 t:8 wy:[gc.wayManager getWay:2]];
            [self runWave:2 e:ET_FOOT2 s:2 t:5 wy:[gc.wayManager getWay:3]];
            [self prepareEndPoint:17];
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
    //每一波的出兵数和顺序
    //addWayPoint函数参数
    // addWayPoint:路线编号
    // addWayPoint:路线坐标，按顺序出的    
    [manager addWayPoint:1 wayPoint:ccp(142, 321)];
    [manager addWayPoint:1 wayPoint:ccp(142, 320)];
    [manager addWayPoint:1 wayPoint:ccp(142, 195)];
    [manager addWayPoint:1 wayPoint:ccp(350, 195)];
    [manager addWayPoint:1 wayPoint:ccp(350, 105)];
    [manager addWayPoint:1 wayPoint:ccp(232, 105)];
    [manager addWayPoint:1 wayPoint:ccp(232, 0)];
    [manager addWayPoint:1 wayPoint:ccp(232, -1)];
   
    [manager addWayPoint:2 wayPoint:ccp(157, 321)];
    [manager addWayPoint:2 wayPoint:ccp(157, 320)];
    [manager addWayPoint:2 wayPoint:ccp(157, 210)];
    [manager addWayPoint:2 wayPoint:ccp(365, 210)];
    [manager addWayPoint:2 wayPoint:ccp(365, 90)];
    [manager addWayPoint:2 wayPoint:ccp(247, 90)];
    [manager addWayPoint:2 wayPoint:ccp(247, 0)];
    [manager addWayPoint:2 wayPoint:ccp(247, -1)];
      
    [manager addWayPoint:3 wayPoint:ccp(172, 321)];
    [manager addWayPoint:3 wayPoint:ccp(172, 320)];
    [manager addWayPoint:3 wayPoint:ccp(172, 225)];
    [manager addWayPoint:3 wayPoint:ccp(380, 225)];
    [manager addWayPoint:3 wayPoint:ccp(380, 75)];
    [manager addWayPoint:3 wayPoint:ccp(262, 75)];
    [manager addWayPoint:3 wayPoint:ccp(262, 0)];
    [manager addWayPoint:3 wayPoint:ccp(262, -1)];
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
            [self addWaveTip:ccp(157, 308)];
			break;
        case 2:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(157, 308)];
			break;
        case 3:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(157, 308)];
			break;
        case 4:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(157, 308)];
			break;
        case 5:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(157, 308)];
			break;
        case 6:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(157, 308)];
			break;
        case 7:
            [self autoNextWave:10 mustGold:1 addGold:1];
            [self addWaveTip:ccp(157, 308)];
			break;
        case 8:
			break;
		default:
            //[self prepareNextWave:10];
			break;
	}
}

@end
