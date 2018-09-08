#import "GameControllerScene.h"
#import "GameController.h"

@implementation GameControllerScene

@synthesize btnBuild1 = _btnBuild1;
@synthesize btnBuild2 = _btnBuild2;
@synthesize btnBuild3 = _btnBuild3;
@synthesize btnBuild4 = _btnBuild4;
@synthesize btnUpdate = _btnUpdate;
@synthesize btnSell = _btnSell;
@synthesize btnZone = _btnZone;
@synthesize canBuild1 = _canBuild1;
@synthesize canBuild2 = _canBuild2;
@synthesize canBuild3 = _canBuild3;
@synthesize canBuild4 = _canBuild4;
@synthesize canUpdate = _canUpdate;

-(id) init
{
	if( (self=[super init])) {
        [self shiYingIphone5];
	}
	return self;
}

- (void) setBuild1MenuStatus
{
    if (!_btnBuild1) return;
    if (!_canBuild1) {
        [_btnBuild1 setIsEnabled:NO];
        [_btnBuild1 removeAllChildrenWithCleanup:YES];
        return;
    }
    GameController *gc = [GameController getGameController];
//    if (gc.operateType != OT_NORMAL) {
//        [_btnBuild1 setIsEnabled:NO];
//        return;
//    }
    
    if (gc.currentGold < _build1Gold) {
        [_btnBuild1 setIsEnabled:NO];
        return;
    }
    
    [_btnBuild1 setIsEnabled:YES];
}

- (void) setBuild2MenuStatus
{
    if (!_btnBuild2) return;
    if (!_canBuild2) {
        [_btnBuild2 setIsEnabled:NO];
        [_btnBuild2 removeAllChildrenWithCleanup:YES];
        return;
    }
    GameController *gc = [GameController getGameController];
//    if (gc.operateType != OT_NORMAL) {
//        [_btnBuild2 setIsEnabled:NO];
//        return;
//    }
    
    if (gc.currentGold < _build2Gold) {
        [_btnBuild2 setIsEnabled:NO];
        return;
    }
    
    [_btnBuild2 setIsEnabled:YES];
}

- (void) setBuild3MenuStatus
{
    if (!_btnBuild3) return;
    if (!_canBuild3) {
        [_btnBuild3 setIsEnabled:NO];
        [_btnBuild3 removeAllChildrenWithCleanup:YES];
        return;
    }
    GameController *gc = [GameController getGameController];
//    if (gc.operateType != OT_NORMAL) {
//        [_btnBuild3 setIsEnabled:NO];
//        return;
//    }
    
    if (gc.currentGold < _build3Gold) {
        [_btnBuild3 setIsEnabled:NO];
        return;
    }
    
    [_btnBuild3 setIsEnabled:YES];
}

- (void) setBuild4MenuStatus
{
    if (!_btnBuild4) return;
    if (!_canBuild4) {
        [_btnBuild4 setIsEnabled:NO];
        [_btnBuild4 removeAllChildrenWithCleanup:YES];
        return;
    }
    GameController *gc = [GameController getGameController];
//    if (gc.operateType != OT_NORMAL) {
//        [_btnBuild4 setIsEnabled:NO];
//        return;
//    }
    
    if (gc.currentGold < _build4Gold) {
        [_btnBuild4 setIsEnabled:NO];
        return;
    }
    
    [_btnBuild4 setIsEnabled:YES];
}

- (void) setUpdateMenuStatus
{
    if (!_btnUpdate) return;
    if (!_canUpdate) {
        [_btnUpdate setIsEnabled:NO];
        //[_btnUpdate removeAllChildrenWithCleanup:NO];
        return;
    }
    GameController *gc = [GameController getGameController];
//    if (gc.operateType == OT_SETSEARCHPOINT) {
//        [_btnUpdate setIsEnabled:NO];
//        return;
//    }
    
    if (gc.currentGold < _updateGold) {
        [_btnUpdate setIsEnabled:NO];
        return;
    }
    
    [_btnUpdate setIsEnabled:YES];
}

- (void) setSellMenuStatus
{
    if (!_btnSell) return;
//    GameController *gc = [GameController getGameController];
//    if (gc.operateType == OT_SETSEARCHPOINT) {
//        [_btnSell setIsEnabled:NO];
//        return;
//    }
    
    [_btnSell setIsEnabled:YES];
}

- (void) setZoneMenuStatus
{
    if (!_btnZone) return;
    GameController *gc = [GameController getGameController];
//    if (gc.operateType != OT_NORMAL && gc.operateType != OT_SETSEARCHPOINT) {
//        [_btnZone setIsEnabled:NO];
//        return;
//    }
    
    [_btnZone setIsEnabled:YES];
    
    if (gc.operateType == OT_SETSEARCHPOINT) {
        [_btnZone selected];
    } else {
        [_btnZone unselected];
    }
}

-(int)build1Gold
{
    return _build1Gold;
}

-(void)setBuild1Gold:(int)bg
{
    _build1Gold = bg;
    [[GameController getGameController] setGameStatus];
}

-(int)build2Gold
{
    return _build2Gold;
}

-(void)setBuild2Gold:(int)bg
{
    _build2Gold = bg;
    [[GameController getGameController] setGameStatus];
}

-(int)build3Gold
{
    return _build3Gold;
}

-(void)setBuild3Gold:(int)bg
{
    _build3Gold = bg;
    [[GameController getGameController] setGameStatus];
}

-(int)build4Gold
{
    return _build4Gold;
}

-(void)setBuild4Gold:(int)bg
{
    _build4Gold = bg;
    [[GameController getGameController] setGameStatus];
}

-(int)updateGold
{
    return _updateGold;
}

-(void)setUpdateGold:(int)ug
{
    _updateGold = ug;
    [[GameController getGameController] setGameStatus];
}

- (void) clearSceneSrpite
{
    [self removeAllChildrenWithCleanup:YES];
    _btnBuild1= nil;
    _btnBuild2= nil;
    _btnBuild3= nil;
    _btnBuild4= nil;
    _btnUpdate= nil;
    _btnSell= nil;
    _btnZone= nil;
}

-(void)shiYingIphone5
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    if (size.width == 568) {
        self.position = ccp(self.position.x + 44, self.position.y);
    }
}

- (void) dealloc {
    [super dealloc];
}

@end
