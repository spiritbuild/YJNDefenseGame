#import "TDTurretTower.h"
#import "GameControllerScene.h"
#import "SimpleAudioEngine.h"

@implementation TDTurretTower

@synthesize beforeShootName = _beforeShootName;
@synthesize afterShootName = _afterShootName;

- (BOOL) run
{
    if ([super run] == NO) return NO;
    self.towerBG = [CCSprite spriteWithFile:TDS_EMPTY_NAME];
    self.towerBG.scale = 0.5;
    CGFloat xPos = self.towerBG.contentSize.width  / 2;
    CGFloat yPos = self.towerBG.contentSize.height / 2;
    self.towerBG.position = ccp(xPos - 5, yPos - 3);
    self.towerBG.anchorPoint = ccp(0.5, 0.5);
    [self addChild:self.towerBG z:-1];
    [self schedule:@selector(startSearch:)];
    return YES;
}

-(id) init
{
	if( (self=[super init])) {
        self.smallPic = @"smtt01.png";
	}
	return self;
}

- (void) dealloc
{
    [_beforeShootName release];
    [_afterShootName release];
	[super dealloc];
}

- (TDEnemy*) searchClearEnemy {
    double maxDistant = self.attactRange;
	GameController *gc = [GameController getGameController];
	for (TDEnemy *e in gc.enemyArray) {
        if (e && e.spriteStatus == TSS_NORMAL && e.spritePlace == SP_FOOT) {
            double curDistance = ccpDistance(self.position, e.position);
            if (curDistance <= maxDistant) {
                return e;
            }
        }
	}
	return nil;
}

//搜索敌人
- (void) startSearch:(ccTime)dt {
    self.enemy = [self searchClearEnemy];
    if (self.enemy != nil && self.enemy.spriteStatus == TSS_NORMAL) {
        [self unschedule:@selector(startSearch:)];
        if ([self canAttactEnemy] == YES) {
            [self AttactEnemy];
            [self schedule:@selector(attact:) interval:self.attacttime];
        } else {
            [self schedule:@selector(startSearch:)];
        }
    }
}

//攻击敌人
- (void) attact:(ccTime)dt {
    if ([self canAttactEnemy] == YES) {
        [self AttactEnemy];
    } else {
        [self unschedule:@selector(attact:)];
        [self schedule:@selector(startSearch:)];
    }
}

- (void) AttactEnemy
{
    self.enemyPoint = self.enemy.position;
    id actionBefore = [CCAnimate actionWithAnimation:[self getAnimate:_beforeShootName] restoreOriginalFrame:NO];
	id actionAttact = [CCCallFuncN actionWithTarget:self selector:@selector(afterRepeat:)];
    id actionAfter = [CCAnimate actionWithAnimation:[self getAnimate:_afterShootName] restoreOriginalFrame:NO];
	[self runAction:[CCSequence actions:actionBefore, actionAttact, actionAfter, nil]];
}

-(void) afterRepeat:(id)sender {
    GameController *gc = [GameController getGameController];
    TDTowerBullet *b = nil;
	switch (self.towerLevel) {
		case 1:
			b = [TDTurretTowerBullet1 getSprite];
			break;
		case 2:
			b = [TDTurretTowerBullet2 getSprite];
			break;
		case 3:
			b = [TDTurretTowerBullet3 getSprite];
			break;
		default:
			b = [TDTurretTowerBullet1 getSprite];
			break;
	}
    
    if ([self canAttactEnemy] == NO) {
        self.enemy = [self searchClearEnemy];
    }
    
    b.enemy = self.enemy;
    b.enemyPoint = self.enemyPoint;
    b.shooter = self;
    b.position = ccpAdd(self.position, self.bulletCenter);
    [gc.gameBackground addChild:b z:5000];
    [gc.bulletArray addObject:b];
    [[SimpleAudioEngine sharedEngine] playEffect:@"tt.wav"];
    [b run];
}

- (void) spriteTouchBegan:(UITouch *)touch operateType:(TOperateType)operateType
{
    [super spriteTouchBegan:touch operateType:operateType];
    GameControllerScene *gcs = [GameController getGameController].gameController;
    [gcs clearSceneSrpite];
    NSString *money = nil;
    CCLabelTTF *lblBuild = nil;
    
    if (self.canUpdate) {
        gcs.btnUpdate = [self addButton:@"btnUpN.png" selected:@"btnUpN.png" disabled:@"btnUpU.png" sel:@selector(updateSelf:) pos:BUTTON4_POS];
        money = [NSString stringWithFormat:@"%d", gcs.updateGold];
        lblBuild = [CCLabelTTF labelWithString:money dimensions:CGSizeMake(24, 11) alignment:UITextAlignmentCenter fontName:@"Helvetica-Bold" fontSize:11];
        lblBuild.position = ccp(gcs.btnUpdate.contentSize.width / 2, 11);
        lblBuild.color = ccc3(255, 204, 0);
        [gcs.btnUpdate addChild:lblBuild z:1 tag:1];
    }
    
    gcs.btnSell = [self addButton:@"btnSell.png" selected:@"btnSell.png" disabled:@"btnSell.png" sel:@selector(sellSelf:) pos:SELL_POS];
    money = [NSString stringWithFormat:@"%d", self.getGold];
    lblBuild = [CCLabelTTF labelWithString:money dimensions:CGSizeMake(24, 11) alignment:UITextAlignmentCenter fontName:@"Helvetica-Bold" fontSize:11];
    lblBuild.position = ccp(gcs.btnSell.contentSize.width / 2, 11);
    lblBuild.color = ccc3(255, 204, 0);
    [gcs.btnSell addChild:lblBuild z:1 tag:1];
    gcs.canUpdate = self.canUpdate;
    [[GameController getGameController] setGameStatus];
}

- (void) addAnimate:(int)level
{
    self.beforeShootName = [NSString stringWithFormat:@"tt%02db", level];
    self.afterShootName = [NSString stringWithFormat:@"tt%02da", level];
}

@end

@implementation TDTurretTower1

+ (id) getSprite {
    TDTurretTower1 *tower = [TDTurretTower1 spriteWithSpriteFrameName:@"tt01b0001.png"];
    if (tower) {
        tower.scale = 1;
        tower.attact = TDS_TURRET_BULLET1_ATTACT;
        tower.attactRange = TDS_TURRET_TOWER1_ATTACTRANGE;
        tower.attacttime = TDS_TURRET_TOWER1_ATTACTTIME;
        tower.getGold = TDS_TURRET_TOWER1_GETGOLD;
        tower.costGold = TDS_TURRET_TOWER1_BUYGOLD;
        tower.bulletCenter = ccp(0, 50);
        tower.rangeCenter = ccp(0, 20);
		tower.enemy = nil;
		tower.towerLevel = 1;
        tower.canBuild1 = NO;
        tower.canBuild2 = NO;
        tower.canBuild3 = NO;
        tower.canBuild4 = NO;
        tower.canUpdate = CAN_UPDATE1_TURRET_TOWER;
        [tower addAnimate:1]; 
    }
    return tower;
}

- (void) doSelect
{
    [super doSelect];
    GameController *gc = [GameController getGameController];
    gc.gameController.updateGold = TDS_TURRET_TOWER2_BUYGOLD;
}

-(void) updateSelf:(id) sender 
{
    [self updateTower:[TDTurretTower2 getSprite]];
}

-(void) sellSelf:(id) sender 
{
    [self sellTower];
}

@end

@implementation TDTurretTower2

+ (id) getSprite {
    TDTurretTower2 *tower = [TDTurretTower2 spriteWithSpriteFrameName:@"tt02b0001.png"];
    if (tower) {
        tower.scale = 1;
        tower.attact = TDS_TURRET_BULLET2_ATTACT;
        tower.attactRange = TDS_TURRET_TOWER2_ATTACTRANGE;
        tower.attacttime = TDS_TURRET_TOWER2_ATTACTTIME;
        tower.getGold = TDS_TURRET_TOWER2_GETGOLD;
        tower.costGold = TDS_TURRET_TOWER2_BUYGOLD;
        tower.bulletCenter = ccp(0, 50);
        tower.rangeCenter = ccp(0, 20);
		tower.enemy = nil;
		tower.towerLevel = 2;
        tower.canBuild1 = NO;
        tower.canBuild2 = NO;
        tower.canBuild3 = NO;
        tower.canBuild4 = NO;
        tower.canUpdate = CAN_UPDATE2_TURRET_TOWER;
        [tower addAnimate:2]; 
    }
    return tower;
}

- (void) doSelect
{
    [super doSelect];
    GameController *gc = [GameController getGameController];
    gc.gameController.updateGold = TDS_TURRET_TOWER3_BUYGOLD;
}

-(void) updateSelf:(id) sender 
{
    [self updateTower:[TDTurretTower3 getSprite]];
}

-(void) sellSelf:(id) sender 
{
    [self sellTower];
}

@end

@implementation TDTurretTower3

+ (id) getSprite {
    TDTurretTower3 *tower = [TDTurretTower3 spriteWithSpriteFrameName:@"tt03b0001.png"];
    if (tower) {
        tower.scale = 1;
        tower.attact = TDS_TURRET_BULLET3_ATTACT;
        tower.attactRange = TDS_TURRET_TOWER3_ATTACTRANGE;
        tower.attacttime = TDS_TURRET_TOWER3_ATTACTTIME;
        tower.getGold = TDS_TURRET_TOWER3_GETGOLD;
        tower.costGold = TDS_TURRET_TOWER3_BUYGOLD;
        tower.bulletCenter = ccp(0, 50);
        tower.rangeCenter = ccp(0, 20);
		tower.enemy = nil;
		tower.towerLevel = 3;
        tower.canBuild1 = NO;
        tower.canBuild2 = NO;
        tower.canBuild3 = NO;
        tower.canBuild4 = NO;
        tower.canUpdate = CAN_UPDATE3_TURRET_TOWER;
        [tower addAnimate:3]; 
    }
    return tower;
}

- (void) doSelect
{
    [super doSelect];
    GameController *gc = [GameController getGameController];
    gc.gameController.updateGold = 0;
}

-(void) updateSelf:(id) sender 
{

}

-(void) sellSelf:(id) sender 
{
    [self sellTower];
}

@end