#import "TDDefenceTower.h"
#import "GameControllerScene.h"
#import "GameBackgroundScene.h"
#import "SpriteInfoScene.h"
#import "TDTowerFriendly.h"
#import "Pointer.h"

@implementation TDDefenceTower

@synthesize aniShootName = _aniShootName;
@synthesize spSprite = _spSprite;

- (BOOL) run
{
    if ([super run] == NO) return NO;
    self.towerBG = [CCSprite spriteWithFile:TDS_EMPTY_NAME];
    self.towerBG.scale = 0.5;
    _needCreateFriendly = TDS_DT_FRIENDLY_NO;
    CGFloat xPos = self.towerBG.contentSize.width  / 2;
    CGFloat yPos = self.towerBG.contentSize.height / 2;
    self.towerBG.position = ccp(xPos - 6, yPos - 5);
    self.towerBG.anchorPoint = ccp(0.5, 0.5);
    [self addChild:self.towerBG z:-1];
    GameController *gc = [GameController getGameController];
    for (int i = 0; i < TDS_DT_FRIENDLY_NO; i++) {
        [self addFriendly:[self friendlyType]];
        TDTowerFriendly *f = [self getFriendly:i];
        f.position = self.position;
        f.anchorPoint = ccp(0.5, 0);
        f.tower = self;
        [gc.gameBackground addChild:f z:self.zOrder];
        [gc.frientlyArray addObject:f];
        [f run];
    }
    [self setFriendlyPos];
    return YES;
}

-(id) init
{
	if( (self=[super init])) {
        self.smallPic = @"smdt01.png";
        _arrayFriendly = [[NSMutableArray alloc] init];
        _spSprite = [CCSprite spriteWithFile:@"dtpo.png"];
        _spSprite.anchorPoint = ccp(0, 0);
        [_spSprite setVisible:NO];
        GameController *gc = [GameController getGameController];
        [gc.gameBackground addChild:_spSprite z:1800];
	}
	return self;
}

- (void) dealloc
{
    [_arrayFriendly removeAllObjects];
    [_arrayFriendly release];
    
    [_spSprite removeFromParentAndCleanup:YES];
    [_aniShootName release];
    [super dealloc];
}

- (void) addAnimate:(int)level
{
    self.aniShootName = [NSString stringWithFormat:@"dt%02d", level];
}

-(void) setZone:(id) sender 
{
    GameController *gc = [GameController getGameController];
    if (gc.operateType == OT_SETSEARCHPOINT) {
        gc.operateType = OT_NORMAL;
        gc.screenClickType = SCT_ALL;
    } else {
        gc.operateType = OT_SETSEARCHPOINT;
        gc.screenClickType = SCT_ONLYWHITE;
    }
    [gc setGameStatus];
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
    
    gcs.btnZone = [self addButton:@"btnZone.png" selected:@"btnZoneLiang.png" disabled:@"btnZone.png" sel:@selector(setZone:) pos:BUTTON3_POS];
    
    gcs.btnSell = [self addButton:@"btnSell.png" selected:@"btnSell.png" disabled:@"btnSell.png" sel:@selector(sellSelf:) pos:SELL_POS];
    money = [NSString stringWithFormat:@"%d", self.getGold];
    lblBuild = [CCLabelTTF labelWithString:money dimensions:CGSizeMake(24, 11) alignment:UITextAlignmentCenter fontName:@"Helvetica-Bold" fontSize:11];
    lblBuild.position = ccp(gcs.btnSell.contentSize.width / 2, 11);
    lblBuild.color = ccc3(255, 204, 0);
    [gcs.btnSell addChild:lblBuild z:1 tag:1];
    gcs.canUpdate = self.canUpdate;
    [[GameController getGameController] setGameStatus];
}


- (void) spriteTouchEnded:(UITouch *)touch operateType:(TOperateType)operateType
{
    [super spriteTouchEnded:touch operateType:operateType];
    GameController *gc = [GameController getGameController];
    CGPoint point = [gc.gameBackground convertTouchToNodeSpace:touch];
    if ([gc.pt isWhite:point]) {
        gc.operateType = OT_SETSEARCHPOINT;
        gc.screenClickType = SCT_ONLYWHITE;
        [gc setGameStatus];
        [gc.gameBackground sceneTouchBegan:[NSSet setWithObject:touch] operateType:gc.operateType];
    }
}

- (void) clearSpriteData
{
    NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:_arrayFriendly];;
    for (TDTowerFriendly *f in tmpArray) {
        if (f) {
            f.spriteStatus = TSS_DEAD;
        }
    }
    [tmpArray removeAllObjects];
    [_arrayFriendly removeAllObjects];
    [super clearSpriteData];
}

- (void) showImformation {
    [[GameController getGameController].spriteInfo showDefenceTowerInfo];
    [[GameController getGameController].spriteInfo setSmallPic:self.smallPic];
    [[GameController getGameController].spriteInfo setFriendlyNum:[_arrayFriendly count]];
}

- (BOOL) addFriendly:(TDTowerFriendly*)f {
    if (!f) {
        return NO;
    }
    if ([self hasFriendly:f]) {
        return YES;
    }
    if ([_arrayFriendly count] < TDS_DT_FRIENDLY_NO) {
        [_arrayFriendly addObject:f];
        [self delACreateFriendly];
        return YES;
    }
    return NO;
}

- (BOOL) delFriendly:(TDTowerFriendly*)f {
    if (!f) {
        return NO;
    }
    int i = [_arrayFriendly count];
    [_arrayFriendly removeObject:f];
    if ([_arrayFriendly count] == i) {
        return NO;
    }
    NSLog(@"a friendly is dead");
    if (self.spriteStatus == TSS_NORMAL) {
        [self addACreateFriendly];
        NSLog(@"create a friendly");
    }
    return YES;
}

- (TDTowerFriendly*) getFriendly:(int)i {
    return [_arrayFriendly objectAtIndex:i];
}

- (BOOL) hasFriendly:(TDTowerFriendly*)f {
    return ([_arrayFriendly indexOfObject:f] < INT_MAX);
}

- (CGPoint) getSearchPoint:(int)index {
    float x = 0;
    float y = 0;
    switch (index) {
        case 0:
            x = 0;
            y = 0;
            break;
        case 1:
            x = -10;
            y = -10;
            break;
        case 2:
            x = 10;
            y = -10;
            break;
        case 3:
            x = -10;
            y = 10;
            break;
        case 4:
            x = 10;
            y = 10;
            break;
        default:
            break;
    }
    return ccpAdd(self.searchPoint, ccp(x, y));
}

- (void) setFriendlyPos {
    for (int i = 0; i < [_arrayFriendly count]; i++) {
        TDTowerFriendly *f = [self getFriendly:i];
        if (f) {
            [f setSearchPoint:[self getSearchPoint:i]];
            [f doUnitLogic];
        }
    }
}

- (TDTowerFriendly*) friendlyType {
    return nil;
}


- (void) addACreateFriendly {
    _needCreateFriendly = _needCreateFriendly + 1;
    if (_needCreateFriendly == 1) {
        [self schedule:@selector(createAFriendly:) interval:self.attacttime];
    }
}

- (void) delACreateFriendly {
    _needCreateFriendly = _needCreateFriendly - 1;
    if (_needCreateFriendly == 0) {
        [self unschedule:@selector(createAFriendly:)];
    }
}

- (void) createAFriendly:(ccTime)dt {
    GameController *gc = [GameController getGameController];
    if ([self addFriendly:[self friendlyType]]) {
        TDTowerFriendly *f = [self getFriendly:[_arrayFriendly count]-1];
        f.position = self.position;
        f.anchorPoint = ccp(0.5, 0);
        f.tower = self;
        [gc.gameBackground addChild:f z:self.zOrder];
        [gc.frientlyArray addObject:f];
        [f run];
        [self setFriendlyPos];
    } else {
        [self unschedule:@selector(createAFriendly:)];
    }
}

@end

@implementation TDDefenceTower1

+ (id) getSprite {
    TDDefenceTower1 *tower = [TDDefenceTower1 spriteWithSpriteFrameName:@"dt010001.png"];
    if (tower) {
        tower.scale = 1;
        tower.attactRange = TDS_DEFENCE_TOWER1_ATTACTRANGE;
        tower.attacttime = TDS_DEFENCE_TOWER1_ATTACTTIME;
        tower.getGold = TDS_DEFENCE_TOWER1_GETGOLD;
        tower.costGold = TDS_DEFENCE_TOWER1_BUYGOLD;
        tower.bulletCenter = ccp(0, 20);
        tower.rangeCenter = ccp(0, 20);
		tower.enemy = nil;
        tower.towerLevel = 1;
        tower.canBuild1 = NO;
        tower.canBuild2 = NO;
        tower.canBuild3 = NO;
        tower.canBuild4 = NO;
        tower.canUpdate = CAN_UPDATE1_DEFENCE_TOWER;
        [tower addAnimate:1]; 
    }
    return tower;
}

- (TDTowerFriendly*) friendlyType {
    return [TDTowerFriendly1 getSprite];
}

- (void) doSelect
{
    [super doSelect];
    GameController *gc = [GameController getGameController];
    gc.gameController.updateGold = TDS_DEFENCE_TOWER2_BUYGOLD;
}

-(void) updateSelf:(id) sender 
{
    [self updateTower:[TDDefenceTower2 getSprite]];
}

-(void) sellSelf:(id) sender 
{
    [self sellTower];
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDDefenceTower2

+ (id) getSprite {
    TDDefenceTower2 *tower = [TDDefenceTower2 spriteWithSpriteFrameName:@"dt020001.png"];
    if (tower) {
        tower.scale = 1;
        tower.attactRange = TDS_DEFENCE_TOWER2_ATTACTRANGE;
        tower.attacttime = TDS_DEFENCE_TOWER2_ATTACTTIME;
        tower.getGold = TDS_DEFENCE_TOWER2_GETGOLD;
        tower.costGold = TDS_DEFENCE_TOWER2_BUYGOLD;
        tower.bulletCenter = ccp(0, 50);
        tower.rangeCenter = ccp(0, 20);
		tower.enemy = nil;
        tower.towerLevel = 2;
        tower.canBuild1 = NO;
        tower.canBuild2 = NO;
        tower.canBuild3 = NO;
        tower.canBuild4 = NO;
        tower.canUpdate = CAN_UPDATE2_DEFENCE_TOWER;
        [tower addAnimate:2]; 
    }
    return tower;
}

- (TDTowerFriendly*) friendlyType {
    return [TDTowerFriendly2 getSprite];
}

- (void) doSelect
{
    [super doSelect];
    GameController *gc = [GameController getGameController];
    gc.gameController.updateGold = TDS_DEFENCE_TOWER3_BUYGOLD;
}

-(void) updateSelf:(id) sender 
{
    [self updateTower:[TDDefenceTower3 getSprite]];
}

-(void) sellSelf:(id) sender 
{
    [self sellTower];
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDDefenceTower3

+ (id) getSprite {
    TDDefenceTower3 *tower = [TDDefenceTower3 spriteWithSpriteFrameName:@"dt030001.png"];
    if (tower) {
        tower.scale = 1;
        tower.attactRange = TDS_DEFENCE_TOWER3_ATTACTRANGE;
        tower.attacttime = TDS_DEFENCE_TOWER3_ATTACTTIME;
        tower.getGold = TDS_DEFENCE_TOWER3_GETGOLD;
        tower.costGold = TDS_DEFENCE_TOWER3_BUYGOLD;
        tower.bulletCenter = ccp(0, 50);
        tower.rangeCenter = ccp(0, 20);
		tower.enemy = nil;
        tower.towerLevel = 3;
        tower.canBuild1 = NO;
        tower.canBuild2 = NO;
        tower.canBuild3 = NO;
        tower.canBuild4 = NO;
        tower.canUpdate = CAN_UPDATE3_DEFENCE_TOWER;
        [tower addAnimate:3]; 
    }
    return tower;
}

- (TDTowerFriendly*) friendlyType {
    return [TDTowerFriendly3 getSprite];
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

- (void) dealloc
{  
    [super dealloc];
}

@end
