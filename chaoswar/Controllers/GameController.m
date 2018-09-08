#import "GameController.h"
#import "MagicController.h"
#import "GnDataController.h"
#import "SpritesImp.h"
#import "Wave.h"
#import "WayPoint.h"
#import "WayManager.h"
#import "GameBackgroundScene.h"
#import "GameImfomationScene.h"
#import "GameMagicScene.h"
#import "GameControllerScene.h"
#import "SimpleAudioEngine.h"
#import "SpriteInfoScene.h"
#import "GameHintScene.h"
#import "NBSkillButton.h"
#import "Pointer.h"
#import "Pointer1.h"
#import "Pointer2.h"
#import "Pointer3.h"
#import "Pointer4.h"
#import "Pointer5.h"
#import "Pointer6.h"
#import "Pointer7.h"
#import "Pointer8.h"
#import "Pointer9.h"
#import "Pointer10.h"
#import "Pointer11.h"
#import "Pointer12.h"
#import "SceneManager.h"
#import "SelectSence.h"
#import "GameConfig.h"

@implementation GameController

@synthesize gameBackground = _gameBackground;
@synthesize gameImfomation = _gameImfomation;
@synthesize gameMagic = _gameMagic;
@synthesize gameController = _gameController;
@synthesize spriteInfo = _spriteInfo;
@synthesize gameHint = _gameHint;
@synthesize enemyArray = _enemyArray;
@synthesize towerArray = _towerArray;
@synthesize bulletArray = _bulletArray;
@synthesize frientlyArray = _frientlyArray;
@synthesize wayManager = _wayManager;
@synthesize pt = _pt;
@synthesize ptNum = _ptNum;
@synthesize maxWave = _maxWave;
@synthesize currentWave = _currentWave;
@synthesize currentHealth = _currentHealth;
@synthesize currentGold = _currentGold;
@synthesize screenClickType = _screenClickType;
@synthesize operateType = _operateType;
@synthesize mapType = _mapType;
@synthesize canNext = _canNext;

static GameController *_sharedController = nil;

+ (GameController*) getGameController
{
	return _sharedController;
}

+ (void) initGameController
{
    if (!_sharedController) {
		_sharedController = [[self alloc] init];
	}
	if (_sharedController) {
		[_sharedController initScene];
	}
}

+ (void) releaseGameController
{
	if (_sharedController) {
		[_sharedController release];
        _sharedController = nil;
	}
}

- (CCAnimation*) getAnimation:(NSString*)animationName
{
    return [_pt getAnimation:animationName];
}

- (Pointer*) getPointer:(int)p
{
	switch (p) {
        case 0:
            return [[Pointer1 alloc] init];
            break;
        case 1:
            return [[Pointer2 alloc] init];
            break;
        case 2:
            return [[Pointer3 alloc] init];
            break;
        case 3:
            return [[Pointer4 alloc] init];
            break;
        case 4:
            return [[Pointer5 alloc] init];
            break;
        case 5:
            return [[Pointer6 alloc] init];
            break;
        case 6:
            return [[Pointer7 alloc] init];
            break;
        case 7:
            return [[Pointer8 alloc] init];
            break;
        case 8:
            return [[Pointer9 alloc] init];
            break;
        case 9:
            return [[Pointer10 alloc] init];
            break;
        case 10:
            return [[Pointer11 alloc] init];
            break;
        case 11:
            return [[Pointer12 alloc] init];
            break;
        default:
            return nil;
            break;
    }
}

- (void) initController:(int)p {
    _ptNum = p;
    _pt = [self getPointer:p];
    [_pt setImageName:[NSString stringWithFormat:@"map%04db.png", _ptNum+1]];
}

- (void) start
{
    self.screenClickType = SCT_ALL;
    self.operateType = OT_NORMAL;
    [_gameMagic reStart];

    //=========初始化设置
    [_pt initController];
    //=========初始化动画
    [_pt initAnimate];
    //=========初始化路线
    [_pt initWayPoint:_wayManager];
    //=========初始化塔
    [_pt initTower:_towerArray];
    //=========初始化敌人
    [_pt initEnemy:_enemyArray];
    //=========初始化子弹
    [_pt initBullety:_bulletArray];
    //=========初始化友军
    [_pt initFriendly:_frientlyArray];
}

- (void) restart
{
    [self releaseScene];
    [self start];
}

- (void) stopGame
{
    
}

//游戏逻辑（循环）
- (void) setGameStatus {
	// 设置当前金额，波数等信息
    [_gameImfomation setPauseMenuStatus];
	// 控制法术按钮及下一波按钮的状态
    [_gameMagic setGoMenuStatus];
    [_gameMagic setMagic1MenuStatus];
    [_gameMagic setMagic2MenuStatus];
    [_gameMagic setMagic3MenuStatus];
    [_gameMagic setMagic4MenuStatus];
    // 控制建造按钮及其他操作按钮的状态
    [_gameController setBuild1MenuStatus];
    [_gameController setBuild2MenuStatus];
    [_gameController setBuild3MenuStatus];
    [_gameController setBuild4MenuStatus];
    [_gameController setUpdateMenuStatus];
    [_gameController setSellMenuStatus];
    [_gameController setZoneMenuStatus];
}

- (void) startNextWave
{
    if ([_pt runWaves:_currentWave + 1]) {
        self.currentWave++;
    }
}

- (int) maxWave {
    return _maxWave;
}

- (void) setMaxWave:(int)maxWave
{
    _maxWave = maxWave;
    [_gameImfomation setWaveValue];
    [self setGameStatus];
}

- (int) currentWave {
    return _currentWave;
}

- (void) setCurrentWave:(int)currentWave
{
    _currentWave = currentWave;
    [_gameImfomation setWaveValue];
    [self setGameStatus];
}

- (int) currentHealth {
    return _currentHealth;
}

- (void) setCurrentHealth:(int)currentHealth
{
    if (currentHealth < _currentHealth) {
        [[SimpleAudioEngine sharedEngine] playEffect:@"lifePlus.wav"];
    }
    _currentHealth = currentHealth;
    [_gameImfomation setEnemyNumValue];
    [self setGameStatus];
    if (_currentHealth <= 0) {
        isGameStop = YES;
        [[CCDirector sharedDirector] pause];
        //背景
        CCSprite *lostBg = [CCSprite spriteWithFile:@"lostBg.png"];
        lostBg.position = ccp(240 , 175);
        [_gameHint addChild:lostBg z:100];
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"lostBg.mp3"];
        //退出
        CCMenuItemImage *btnMenu = [CCMenuItemImage itemFromNormalImage:@"btnQuit.png" selectedImage:@"btnQuitdown.png" disabledImage:@"btnQuit.png"  target:self selector:@selector(backToMenu:)];
        CCMenu *btnMenuMenu = [CCMenu menuWithItems:btnMenu, nil];
        btnMenuMenu.position = ccp(240 , 100);
        [_gameHint addChild:btnMenuMenu z:101];
        //重来
        CCMenuItemImage *btnRestart = [CCMenuItemImage itemFromNormalImage:@"btnRestart.png" selectedImage:@"btnRestartdown.png"  disabledImage:@"btnRestart.png"  target:self selector:@selector(restartGame:)];
        CCMenu *btnRestartMenu = [CCMenu menuWithItems:btnRestart, nil];
        btnRestartMenu.position = ccp(240 , 155);
        [_gameHint addChild:btnRestartMenu z:101];
    }
}

-(void) backToMenu:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    isGameStop = NO;
    [[CCDirector sharedDirector] resume];
    [self stopGame];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"mainBg.mp3"];
	[[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[SelectSence scene]]];
}

-(void) restartGame:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    isGameStop = NO;
    [[CCDirector sharedDirector] resume];
    [_gameHint removeAllChildrenWithCleanup:YES];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"mainBg.mp3"];
	[self restart];
    [self setGameStatus];
}

- (int) currentGold {
    return _currentGold;
}

- (void) setCurrentGold:(int)currentGold
{
    _currentGold = currentGold;
    [_gameImfomation setGoldValue];
    [self setGameStatus];
}

- (TScreenClickType) screenClickType {
    return _screenClickType;
}

- (void)setScreenClickType:(TScreenClickType)sct
{
    _screenClickType = sct;
    [self setGameStatus];
}

- (TOperateType) operateType {
    return _operateType;
}

-(void)setOperateType:(TOperateType)ot
{
    _operateType = ot;
    
    CCNode *node = [_gameBackground getChildByTag:100];
    if (node) {
        CCLabelTTF *hintLabel = (CCLabelTTF*) node;
        [hintLabel setColor:ccc3(255, 255, 255)];
        if (hintLabel) {
            switch (_operateType) {
                case OT_NORMAL:
                    [hintLabel setString:@""];
                    break;
                case OT_MAGIC_FIRE:
                    [hintLabel setString:@"Set On Road"];
                    break;
                case OT_MAGIC_FRIENDLY:
                    [hintLabel setString:@"Set On Road"];
                    break;
                case OT_MAGIC_STOP:
                    [hintLabel setString:@"Set On Enemy"];
                    break;
                case OT_MAGIC_THUNDER:
                    [hintLabel setString:@"Set On Enemy"];
                    break;
                case OT_BUILDING:
                    [hintLabel setString:@""];
                    break;
                case OT_SELL:
                    [hintLabel setString:@""];
                    break;
                case OT_UPDATE:
                    [hintLabel setString:@""];
                    break;
                case OT_SETSEARCHPOINT:
                    [hintLabel setString:@"Set Rallying Point"];
                    break;
                case OT_NONE:
                    [hintLabel setString:@""];
                    break;
                default:
                    break;
            }
        }
    }
    [self setGameStatus];
}

- (BOOL) canNext {
    return _canNext;
}

-(void)setCanNext:(BOOL)canNext
{
    _canNext = canNext;
    [self setGameStatus];
}

- (TMapType) mapType {
    return _mapType;
}

- (void)setMapType:(TMapType)mapType
{
    _mapType = mapType;
    if (!_gameImfomation) return;
    _gameImfomation.lblEnemyNum.color = TDS_FONT_COLOR;
    _gameImfomation.lblGold.color = TDS_FONT_COLOR;
    _gameImfomation.lblWave.color = TDS_FONT_COLOR;
}

- (void) initScene
{
    [_enemyArray removeAllObjects];
    [_towerArray removeAllObjects];
    [_bulletArray removeAllObjects];
    [_frientlyArray removeAllObjects];
    [_wayManager removeAllWay];
    _maxWave = 0;
    _currentWave = 0;
    _currentHealth = 0;
    _currentGold = 0;
    _screenClickType = SCT_ALL;
    _operateType = OT_NORMAL;
    _mapType = MT_GREEN;
    _canNext = NO;   
}

- (void) releaseScene
{
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    [_pt stopController];
    NSMutableArray *tempEnemyArray = [NSMutableArray arrayWithArray:_enemyArray];
    for (TDEnemy *en in tempEnemyArray) en.spriteStatus = TSS_DEAD;
    NSMutableArray *tempTowerArray = [NSMutableArray arrayWithArray:_towerArray];
    for (TDTower *to in tempTowerArray) to.spriteStatus = TSS_DEAD;
    NSMutableArray *tempBulletArray = [NSMutableArray arrayWithArray:_bulletArray];
    for (TDBullet *bu in tempBulletArray) bu.spriteStatus = TSS_DEAD;
    NSMutableArray *tempFrientlyArray = [NSMutableArray arrayWithArray:_frientlyArray];
    for (TDFriendly *fr in tempFrientlyArray) fr.spriteStatus = TSS_DEAD;
    [_enemyArray removeAllObjects];
    [_towerArray removeAllObjects];
    [_bulletArray removeAllObjects];
    [_frientlyArray removeAllObjects];
    [_wayManager removeAllWay];
    _maxWave = 0;
    _currentWave = 0;
    _currentHealth = 0;
    _currentGold = 0;
    _screenClickType = SCT_ALL;
    _operateType = OT_NORMAL;
    _mapType = MT_GREEN;
    _canNext = NO;
}

- (id) init
{
	if ((self = [super init])) {
        _enemyArray = [[NSMutableArray alloc] init];
        _towerArray = [[NSMutableArray alloc] init];
        _bulletArray = [[NSMutableArray alloc] init];
        _frientlyArray = [[NSMutableArray alloc] init];
        _wayManager = [[WayManager alloc] init];
	}
	return self;
}

- (void)dealloc {
    [self releaseScene];
    [_enemyArray release];
    [_towerArray release];
    [_bulletArray release];
    [_frientlyArray release];
    [_wayManager release];
    [_pt release];
    _gameBackground = nil;
    _gameImfomation = nil;
    _gameMagic = nil;
    _gameController = nil;
    _spriteInfo = nil;
    _gameHint = nil;
	[super dealloc];
}

- (void) doMagicFire:(CGPoint)point
{
    NSString *ct = now();
    [[FireController getFireController:0.1 pos:point ct:ct] run];
    [[FireController getFireController:0.3 pos:ccpAdd(point, ccp(-15, -15)) ct:ct] run];
    [[FireController getFireController:0.35 pos:ccpAdd(point, ccp(15, 15)) ct:ct] run];
    if ([GnDataController getMagicFireLevel] == 3) {
        [[FireController getFireController:0.55 pos:ccpAdd(point, ccp(-15, 15)) ct:ct] run];
        [[FireController getFireController:0.65 pos:ccpAdd(point, ccp(15, -15)) ct:ct] run];
    }
    self.screenClickType = SCT_ALL;
    self.operateType = OT_NORMAL;
    [_gameMagic restartMagicFire];
}

- (void) doMagicFriendly:(CGPoint)point
{
    NSString *ct = now();
    if ([GnDataController getMagicFriendlyLevel] == 3) {
        [[FriendlyController getFriendlyController:0.01 pos:ccpAdd(point, ccp(-15, -15)) ct:ct] run];
        [[FriendlyController getFriendlyController:0.01 pos:ccpAdd(point, ccp(15, 15)) ct:ct] run];
        [[FriendlyController getFriendlyController:0.01 pos:point ct:ct] run];
    } else {
        [[FriendlyController getFriendlyController:0.01 pos:ccpAdd(point, ccp(-7.5, -7.5)) ct:ct] run];
        [[FriendlyController getFriendlyController:0.01 pos:ccpAdd(point, ccp( 7.5,  7.5)) ct:ct] run];
    }
    self.screenClickType = SCT_ALL;
    self.operateType = OT_NORMAL;
    [_gameMagic restartMagicFriendly];
}

- (void) doSetSearchPoint:(CGPoint)point
{
    TDSprite *s = [TDSprite getCurrentSprite];
    TDDefenceTower *td = nil;
    if ([s isKindOfClass:[TDDefenceTower class]]) {
        td = (TDDefenceTower*) s;
    }
    if (!td) return;
    double distance = ccpDistance(td.position, point);
    if (td.attactRange >= distance) {
        td.searchPoint = point;
        [td.spSprite setVisible:YES];
        td.spSprite.position = point;
        [td.spSprite runAction:[CCFadeOut actionWithDuration:1.5f]];
        [td setFriendlyPos];
        self.screenClickType = SCT_ALL;
        self.operateType = OT_NORMAL;
    }
}

- (void) ArchieveHint:(NSString*)hint
{
    CCNode *node = [_gameBackground getChildByTag:99];
    if (node) {
        [node cleanup];
        [node removeFromParentAndCleanup:YES];
        node = nil;
    }
    
    CCLabelTTF *hintLabel = [CCLabelTTF labelWithString:hint fontName:@"Helvetica-Bold" fontSize:10];
    hintLabel.position = ccp(290, 40);
    hintLabel.anchorPoint = ccp(0.5, 0);
    hintLabel.scale = 1;
    hintLabel.color = ccc3(0, 0, 0);
    [hintLabel runAction:[CCSequence actions:[CCMoveTo actionWithDuration:2.0f position:hintLabel.position], [CCFadeOut actionWithDuration:1.5f], nil]];
    [_gameBackground addChild:hintLabel z:1000 tag:99];
}

- (void) TouchHint:(NSString*)hint {
    CCNode *node = [_gameBackground getChildByTag:99];
    if (node) {
        [node cleanup];
        [node removeFromParentAndCleanup:YES];
        node = nil;
    }
    
    CCLabelTTF *hintLabel = [CCLabelTTF labelWithString:hint fontName:@"Helvetica-Bold" fontSize:10];
    [hintLabel setString:@""];
    hintLabel.position = ccp(290, 40);
    hintLabel.anchorPoint = ccp(0.5, 0);
    hintLabel.scale = 1;
    hintLabel.color = ccc3(0, 0, 0);
    [hintLabel runAction:[CCSequence actions:[CCMoveTo actionWithDuration:2.0f position:hintLabel.position], [CCFadeOut actionWithDuration:1.5f], nil]];
    [_gameBackground addChild:hintLabel z:1000 tag:99];
}

@end
