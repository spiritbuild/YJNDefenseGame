#import "TDMagicTower.h"
#import "GameControllerScene.h"
#import "SimpleAudioEngine.h"

@implementation TDMagicTower

@synthesize aniShootName = _aniShootName;

- (BOOL) run
{
    if ([super run] == NO) return NO;
    self.towerBG = [CCSprite spriteWithFile:TDS_EMPTY_NAME];
    self.towerBG.scale = 0.5;
    CGFloat xPos = self.towerBG.contentSize.width  / 2;
    CGFloat yPos = self.towerBG.contentSize.height / 2;
    self.towerBG.position = ccp(xPos - 10, yPos - 5);
    self.towerBG.anchorPoint = ccp(0.5, 0.5);
    [self addChild:self.towerBG z:-1];
    [self schedule:@selector(startSearch:)];
    return YES;
}

-(id) init
{
	if( (self=[super init])) {
        self.smallPic = @"smmt01.png";
	}
	return self;
}

- (void) dealloc
{
    [_aniShootName release];
	[super dealloc];
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
    id actionRepeat = [CCAnimate actionWithAnimation:[self getAnimate:_aniShootName] restoreOriginalFrame:NO];
	id actionRepeatDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterRepeat:)];
	[self runAction:[CCSequence actions:actionRepeat, actionRepeatDone, nil]];
    [[SimpleAudioEngine sharedEngine] playEffect:@"mt.wav"];
}

-(void) afterRepeat:(id)sender {
    GameController *gc = [GameController getGameController];
    TDTowerBullet *b = nil;
	switch (self.towerLevel) {
		case 1:
			b = [TDMagicTowerBullet1 getSprite];
			break;
		case 2:
			b = [TDMagicTowerBullet2 getSprite];
			break;
		case 3:
			b = [TDMagicTowerBullet3 getSprite];
			break;
		default:
			b = [TDMagicTowerBullet1 getSprite];
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
    self.aniShootName = [NSString stringWithFormat:@"mt%02d", level];
}

@end

@implementation TDMagicTower1

+ (id) getSprite {
    TDMagicTower1 *tower = [TDMagicTower1 spriteWithSpriteFrameName:@"mt010001.png"];
    if (tower) {
        tower.scale = 1;
        tower.attact = TDS_MAGIC_BULLET1_ATTACT;
        tower.attactRange = TDS_MAGIC_TOWER1_ATTACTRANGE;
        tower.attacttime = TDS_MAGIC_TOWER1_ATTACTTIME;
        tower.getGold = TDS_MAGIC_TOWER1_GETGOLD;
        tower.costGold = TDS_MAGIC_TOWER1_BUYGOLD;
        tower.bulletCenter = ccp(0, 50);
        tower.rangeCenter = ccp(0, 20);
		tower.enemy = nil;
		tower.towerLevel = 1;
        tower.canBuild1 = NO;
        tower.canBuild2 = NO;
        tower.canBuild3 = NO;
        tower.canBuild4 = NO;
        tower.canUpdate = CAN_UPDATE1_MAGIC_TOWER;
        [tower addAnimate:1]; 
    }
    return tower;
}

- (void) doSelect
{
    [super doSelect];
    GameController *gc = [GameController getGameController];
    gc.gameController.updateGold = TDS_MAGIC_TOWER2_BUYGOLD;
}

-(void) updateSelf:(id) sender 
{
    [self updateTower:[TDMagicTower2 getSprite]];
}

-(void) sellSelf:(id) sender 
{
    [self sellTower];
}

@end

@implementation TDMagicTower2

+ (id) getSprite {
    TDMagicTower2 *tower = [TDMagicTower2 spriteWithSpriteFrameName:@"mt020001.png"];
    if (tower) {
        tower.scale = 1;
        tower.attact = TDS_MAGIC_BULLET2_ATTACT;
        tower.attactRange = TDS_MAGIC_TOWER2_ATTACTRANGE;
        tower.attacttime = TDS_MAGIC_TOWER2_ATTACTTIME;
        tower.getGold = TDS_MAGIC_TOWER2_GETGOLD;
        tower.costGold = TDS_MAGIC_TOWER2_BUYGOLD;
        tower.bulletCenter = ccp(0, 50);
        tower.rangeCenter = ccp(0, 20);
		tower.enemy = nil;
		tower.towerLevel = 2;
        tower.canBuild1 = NO;
        tower.canBuild2 = NO;
        tower.canBuild3 = NO;
        tower.canBuild4 = NO;
        tower.canUpdate = CAN_UPDATE2_MAGIC_TOWER;
        [tower addAnimate:2]; 
    }
    return tower;
}

- (void) doSelect
{
    [super doSelect];
    GameController *gc = [GameController getGameController];
    gc.gameController.updateGold = TDS_MAGIC_TOWER3_BUYGOLD;
}

-(void) updateSelf:(id) sender 
{
    [self updateTower:[TDMagicTower3 getSprite]];
}

-(void) sellSelf:(id) sender 
{
    [self sellTower];
}

@end

@implementation TDMagicTower3

+ (id) getSprite {
    TDMagicTower3 *tower = [TDMagicTower3 spriteWithSpriteFrameName:@"mt030001.png"];
    if (tower) {
        tower.scale = 1;
        tower.attact = TDS_MAGIC_BULLET3_ATTACT;
        tower.attactRange = TDS_MAGIC_TOWER3_ATTACTRANGE;
        tower.attacttime = TDS_MAGIC_TOWER3_ATTACTTIME;
        tower.getGold = TDS_MAGIC_TOWER3_GETGOLD;
        tower.costGold = TDS_MAGIC_TOWER3_BUYGOLD;
        tower.bulletCenter = ccp(0, 50);
        tower.rangeCenter = ccp(0, 20);
		tower.enemy = nil;
		tower.towerLevel = 3;
        tower.canBuild1 = NO;
        tower.canBuild2 = NO;
        tower.canBuild3 = NO;
        tower.canBuild4 = NO;
        tower.canUpdate = CAN_UPDATE3_MAGIC_TOWER;
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