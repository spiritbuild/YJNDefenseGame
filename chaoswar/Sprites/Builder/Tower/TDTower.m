#import <Foundation/Foundation.h>
#import "TDTower.h"
#import "GameControllerScene.h"
#import "GameBackgroundScene.h"
#import "SpriteInfoScene.h"
#import "TDSprite.h"
#import "TDArrowTower.h"
#import "TDTurretTower.h"
#import "TDDefenceTower.h"
#import "TDMagicTower.h"

@implementation TDTower

@synthesize enemy = _enemy;
@synthesize enemyPoint = _enemyPoint;
@synthesize bulletArray = _bulletArray;
@synthesize towerLevel = _towerLevel;
@synthesize towerBG = _towerBG;
@synthesize rangeSprite = _rangeSprite;
@synthesize bulletCenter = _bulletCenter;
@synthesize rangeCenter = _rangeCenter;
@synthesize searchPoint = _searchPoint;
@synthesize canBuild1 = _canBuild1;
@synthesize canBuild2 = _canBuild2;
@synthesize canBuild3 = _canBuild3;
@synthesize canBuild4 = _canBuild4;
@synthesize canUpdate = _canUpdate;

-(id) init
{
	if( (self=[super init])) {
        _bulletArray = [[NSMutableArray alloc] init];
        _rangeSprite = [CCSprite spriteWithFile:@"tdRange.png"];
        _bulletCenter = ccp(0, 0);
        _rangeCenter = ccp(0, 0);
        _canBuild1 = YES;
        _canBuild2 = YES;
        _canBuild3 = YES;
        _canBuild4 = YES;
        _canUpdate = YES;
        [_rangeSprite setVisible:NO];
        [self addChild:_rangeSprite z:-1];
	}
	return self;
}

- (BOOL) run
{
    if ([super run] == NO) return NO;
    CGPoint cp = ccp(self.textureRect.size.width * self.anchorPoint.x, 
                     self.textureRect.size.height * self.anchorPoint.y);
    cp = ccpAdd(cp, _rangeCenter);
    _rangeSprite.position = cp;
    float ar = self.attactRange;
    float scale = ar / 100;
    [_rangeSprite setScale:scale];
    return YES;
}

- (void) doSelect
{
    [super doSelect];
    [_rangeSprite setVisible:YES];
}

- (void) doUnSelect
{
    [_rangeSprite setVisible:NO];
    [super doUnSelect];
}

- (void) dealloc
{
	[super dealloc];
}

- (TDEnemy*) searchClearEnemy {
    double maxDistant = self.attactRange;
	GameController *gc = [GameController getGameController];
	for (TDEnemy *e in gc.enemyArray) {
        if (e && e.spriteStatus == TSS_NORMAL) {
            double curDistance = ccpDistance(self.position, e.position);
            if (curDistance <= maxDistant) {
                return e;
            }
        }
	}
	return nil;
}

- (BOOL) canAttactEnemy
{
    if (!_enemy) {
        return NO;
    }
    
    if (_enemy.spriteStatus != TSS_NORMAL) {
        return NO;
    }
    
    double distance = ccpDistance(self.position, _enemy.position);
    
    if (distance <= self.attactRange) {
        return YES;
    }
	return NO;
}

-(void) updateTower:(TDTower*)tower 
{
    GameController *gc = [GameController getGameController];
    if (gc.operateType == OT_SETSEARCHPOINT) {
        return;
    }
    gc.currentGold = gc.currentGold - tower.costGold;
    [gc.gameController clearSceneSrpite];
    tower.anchorPoint = self.anchorPoint;
    tower.searchPoint = self.searchPoint;
    tower.position = self.position;
    [gc.gameBackground addChild:tower z:self.zOrder];
    [gc.towerArray addObject:tower];
    [tower run];
    [self.towerBG removeFromParentAndCleanup:YES];
    self.towerBG = nil;
    self.spriteStatus = TSS_DEAD;
    [self removeFromParentAndCleanup:YES];
}

-(void) sellTower
{
    GameController *gc = [GameController getGameController];
    if (gc.operateType == OT_SETSEARCHPOINT) {
        return;
    }
    gc.currentGold = gc.currentGold + self.getGold;
    [gc.gameController clearSceneSrpite];
    TDEmptyTower *tower = [TDEmptyTower getSprite];
    tower.anchorPoint = self.anchorPoint;
    tower.searchPoint = self.searchPoint;
    tower.position = self.position;
    [gc.gameBackground addChild:tower z:self.zOrder];
    [gc.towerArray addObject:tower];
    self.spriteStatus = TSS_DEAD;
    [tower run];
    
}

- (void) setEnemy:(TDEnemy *)enemy
{
    if (_enemy) {
        [_enemy.towerArray removeObject:self];
    }
    _enemy = enemy;
    if (_enemy) {
        [_enemy.towerArray addObject:self];
    }
}

- (void) clearSpriteData
{
    self.enemy = nil;
    NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:_bulletArray];
    for (TDTowerBullet *bu in tmpArray) bu.shooter = nil;
    [tmpArray removeAllObjects];
    [_rangeSprite removeFromParentAndCleanup:YES];
    if (_towerBG) {
        [_towerBG removeFromParentAndCleanup:YES];
    }
    [super clearSpriteData];
}

- (void) showImformation {
    [[GameController getGameController].spriteInfo showTowerInfo];
    [[GameController getGameController].spriteInfo setSmallPic:self.smallPic];
    [[GameController getGameController].spriteInfo setAttact:self.attact];
    [[GameController getGameController].spriteInfo setAttactSpeed:self.attacttime];
    [[GameController getGameController].spriteInfo setBloodNum:self.currentHP];
}

@end

@implementation TDEmptyTower

@synthesize progressLine = _progressLine;
@synthesize progressBack = _progressBack;


+ (id) getSprite {
    TDEmptyTower *tower = [TDEmptyTower spriteWithFile:TDS_EMPTY_NAME];
    if (tower) {
        tower.scale = 0.85;
        tower.attact = 0;
        tower.attactRange = 0;
        tower.attacttime = 9999;
        tower.canBuild1 = CAN_BUILD_ARROW_TOWER;
        tower.canBuild2 = CAN_BUILD_DEFENCE_TOWER;
        tower.canBuild3 = CAN_BUILD_TURRET_TOWER;
        tower.canBuild4 = CAN_BUILD_MAGIC_TOWER;
        tower.canUpdate = NO;
    }
    return tower;
}

- (void) spriteTouchBegan:(UITouch *)touch operateType:(TOperateType)operateType
{
    [super spriteTouchBegan:touch operateType:operateType];
    GameControllerScene *gcs = [GameController getGameController].gameController;
    [gcs clearSceneSrpite];
    
    //箭塔
    gcs.btnBuild1 = [self addButton:@"buildButton01n.png" selected:@"buildButton01n.png" disabled:@"buildButton01u.png" sel:@selector(bulidArrayTower:) pos:BUTTON1_POS];
    NSString *money = nil;
    CCLabelTTF *lblBuild = nil;
    money = [NSString stringWithFormat:@"%d", TDS_ARROW_TOWER1_BUYGOLD];
    lblBuild = [CCLabelTTF labelWithString:money dimensions:CGSizeMake(24, 11) alignment:UITextAlignmentCenter fontName:@"Helvetica-Bold" fontSize:11];
    lblBuild.position = ccp(gcs.btnBuild1.contentSize.width / 2, 10);
    lblBuild.color = ccc3(255, 204, 0);
    [gcs.btnBuild1 addChild:lblBuild z:1 tag:1];
    //防塔
    gcs.btnBuild2 = [self addButton:@"buildButton02n.png" selected:@"buildButton02n.png" disabled:@"buildButton02u.png" sel:@selector(bulidDefenceTower:) pos:BUTTON2_POS];
    money = [NSString stringWithFormat:@"%d", TDS_DEFENCE_TOWER1_BUYGOLD];
    lblBuild = [CCLabelTTF labelWithString:money dimensions:CGSizeMake(24, 11) alignment:UITextAlignmentCenter fontName:@"Helvetica-Bold" fontSize:11];
    lblBuild.position = ccp(gcs.btnBuild2.contentSize.width / 2, 10);
    lblBuild.color = ccc3(255, 204, 0);
    [gcs.btnBuild2 addChild:lblBuild z:1 tag:1];
    //炮塔
    gcs.btnBuild3 = [self addButton:@"buildButton03n.png" selected:@"buildButton03n.png" disabled:@"buildButton03u.png" sel:@selector(bulidTurretTower:) pos:BUTTON3_POS];
    money = [NSString stringWithFormat:@"%d", TDS_TURRET_TOWER1_BUYGOLD];
    lblBuild = [CCLabelTTF labelWithString:money dimensions:CGSizeMake(24, 11) alignment:UITextAlignmentCenter fontName:@"Helvetica-Bold" fontSize:11];
    lblBuild.position = ccp(gcs.btnBuild3.contentSize.width / 2, 10);
    lblBuild.color = ccc3(255, 204, 0);
    [gcs.btnBuild3 addChild:lblBuild z:1 tag:1];
    //魔塔
    gcs.btnBuild4 = [self addButton:@"buildButton04n.png" selected:@"buildButton04n.png" disabled:@"buildButton04u.png" sel:@selector(bulidMagicTower:) pos:BUTTON4_POS];
    money = [NSString stringWithFormat:@"%d", TDS_MAGIC_TOWER1_BUYGOLD];
    lblBuild = [CCLabelTTF labelWithString:money dimensions:CGSizeMake(24, 11) alignment:UITextAlignmentCenter fontName:@"Helvetica-Bold" fontSize:11];
    lblBuild.position = ccp(gcs.btnBuild4.contentSize.width / 2, 10);
    lblBuild.color = ccc3(255, 204, 0);
    [gcs.btnBuild4 addChild:lblBuild z:1 tag:1];    
    gcs.canBuild1 = self.canBuild1;
    gcs.canBuild2 = self.canBuild2;
    gcs.canBuild3 = self.canBuild3;
    gcs.canBuild4 = self.canBuild4;    
    [[GameController getGameController] setGameStatus];
}

- (void) buildTower:(NSString*)buildBG selector:(SEL)selector
{    
    [[GameController getGameController].gameController clearSceneSrpite];
    [self runAction:[CCHide action]];
    self.towerBG = [CCSprite spriteWithFile:buildBG];
    self.towerBG.scale = self.scale;
    //self.towerBG.scale = 0.8;
    self.towerBG.anchorPoint = self.anchorPoint;
    self.towerBG.position = self.position;
    [self.parent addChild:self.towerBG z:self.zOrder];

    _progressBack = [CCSprite spriteWithFile:@"buildProgressBG.png"];
    _progressBack.position = ccp(-8, self.towerBG.contentSize.height + 2);//ccp(xPos, yPos);
    _progressBack.scaleY = TDS_PROGRESS_SCALE_Y;
    _progressBack.scaleX = TDS_PROGRESS_SCALE_X;
    _progressBack.anchorPoint = ccp(0, 0);
    [self.towerBG addChild:_progressBack z:self.zOrder -1];
    
    _progressLine = [CCSprite spriteWithFile:@"showProgress.png"];
    _progressLine.position = ccp(-8, self.towerBG.contentSize.height + 2);
    _progressLine.scaleY = TDS_PROGRESS_SCALE_Y;
    _progressLine.scaleX = 0;
    _progressLine.anchorPoint = ccp(0, 0);
    [self.towerBG addChild:_progressLine z:self.zOrder];

    [_progressLine runAction:[CCScaleTo actionWithDuration:TOWER_BUILDING_TIME scaleX:_progressBack.scaleX scaleY:_progressBack.scaleY]];
    [self schedule:selector interval:TOWER_BUILDING_TIME];
}

-(void) afterBuildTower:(TDTower *)tower
{
    GameController *gc = [GameController getGameController];
    tower.anchorPoint = self.anchorPoint;
    tower.searchPoint = self.searchPoint;
    tower.position = self.position;
    [gc.gameBackground addChild:tower z:self.zOrder];
    [gc.towerArray addObject:tower];
    [tower run];
    [_progressBack removeFromParentAndCleanup:YES];
    [_progressLine removeFromParentAndCleanup:YES];
    _progressBack = nil;
    _progressLine = nil;
    [self.towerBG removeFromParentAndCleanup:YES];
    self.towerBG = nil;
    self.spriteStatus = TSS_DEAD;
    [self removeFromParentAndCleanup:YES];
}

-(void) bulidArrayTower:(id) sender 
{
    GameController *gc = [GameController getGameController];
    gc.currentGold = gc.currentGold - TDS_ARROW_TOWER1_BUYGOLD;
    [self buildTower:@"atBuilding.png" selector:@selector(afterBulidArrayTower:)];
}

-(void) afterBulidArrayTower:(ccTime)dt 
{
    [self afterBuildTower:[TDArrowTower1 getSprite]];
}

-(void) bulidDefenceTower:(id) sender 
{
    GameController *gc = [GameController getGameController];
    gc.currentGold = gc.currentGold - TDS_DEFENCE_TOWER1_BUYGOLD;
    [self buildTower:@"dtBuilding.png" selector:@selector(afterBulidDefenceTower:)];
}

-(void) afterBulidDefenceTower:(ccTime)dt 
{
    [self afterBuildTower:[TDDefenceTower1 getSprite]];
}

-(void) bulidTurretTower:(id) sender 
{
    GameController *gc = [GameController getGameController];
    gc.currentGold = gc.currentGold - TDS_TURRET_TOWER1_BUYGOLD;
    [self buildTower:@"ttBuilding.png" selector:@selector(afterBulidTurretTower:)];
}

-(void) afterBulidTurretTower:(ccTime)dt 
{
    [self afterBuildTower:[TDTurretTower1 getSprite]];
}

-(void) bulidMagicTower:(id) sender 
{
    GameController *gc = [GameController getGameController];
    gc.currentGold = gc.currentGold - TDS_MAGIC_TOWER1_BUYGOLD;
    [self buildTower:@"mtBuilding.png" selector:@selector(afterBulidMagicTower:)];
}

-(void) afterBulidMagicTower:(ccTime)dt 
{
    [self afterBuildTower:[TDMagicTower1 getSprite]];
}

- (void) doSelect
{
    [super doSelect];
    GameController *gc = [GameController getGameController];
    gc.gameController.build1Gold = TDS_ARROW_TOWER1_BUYGOLD;
    gc.gameController.build2Gold = TDS_DEFENCE_TOWER1_BUYGOLD;
    gc.gameController.build3Gold = TDS_TURRET_TOWER1_BUYGOLD;
    gc.gameController.build4Gold = TDS_MAGIC_TOWER1_BUYGOLD;
    [gc setGameStatus];
}

- (void) showImformation {
    
}

@end

