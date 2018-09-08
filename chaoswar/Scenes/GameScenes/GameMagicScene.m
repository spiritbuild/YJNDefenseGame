#import "GameMagicScene.h"
#import "GameHintScene.h"
#import "GameController.h"
#import "SpriteInfoScene.h"
#import "SimpleAudioEngine.h"

@implementation GameMagicScene

@synthesize btnGo = _btnGo;
@synthesize btnMagic1 = _btnMagic1;
@synthesize btnMagic2 = _btnMagic2;
@synthesize btnMagic3 = _btnMagic3;
@synthesize btnMagic4 = _btnMagic4;

-(id) init
{
	if( (self=[super init])) {
        [self shiYingIphone5];
        _btnMagic1 = nil;
        _btnMagic2 = nil;
        _btnMagic3 = nil;
        _btnMagic4 = nil;
        magic1Restart = NO;
        magic2Restart = NO;
        magic3Restart = NO;
        magic4Restart = NO;
		//GameController *gc = [GameController getGameController];
		//下一波
		_btnGo = [NBSkillButton itemFromNormalImage:@"go_normal.png" selectedImage:@"go_normaldown.png"  
									   disabledImage:@"go_black.png"  target:self selector:@selector(GoNext:)];
		CCMenu *btnGoMenu = [CCMenu menuWithItems:_btnGo, nil];
		btnGoMenu.position = ccp(448 , 20);
		[self addChild:btnGoMenu z:2];
	}
	return self;
}

- (void) reStart {
    magic1Restart = NO;
    magic2Restart = NO;
    magic3Restart = NO;
    magic4Restart = NO;
    if (self.btnMagic1) {
        [self.btnMagic1 stopProgress];
    }
    
    if (self.btnMagic2) {
        [self.btnMagic2 stopProgress];
    }
    
    if (self.btnMagic3) {
        [self.btnMagic3 stopProgress];
    }
    
    if (self.btnMagic4) {
        [self.btnMagic4 stopProgress];
    }
    
    if (self.btnGo) {
        [self.btnGo stopProgress];
    }

}

- (void) setMagic:(int)JN1 JN2:(int)JN2
{
    switch (JN1) {
        case 1:
            _btnMagic1 = [self addButton:JN1 selector:@selector(Magic1:) point:MAGIC1_POS];
            break;
        case 2:
            _btnMagic2 = [self addButton:JN1 selector:@selector(Magic2:) point:MAGIC1_POS];
            break;
        case 3:
            _btnMagic3 = [self addButton:JN1 selector:@selector(Magic3:) point:MAGIC1_POS];
            break;
        case 4:
            _btnMagic4 = [self addButton:JN1 selector:@selector(Magic4:) point:MAGIC1_POS];
            break;
        default:
            break;
    }
    
    switch (JN2) {
        case 1:
            _btnMagic1 = [self addButton:JN2 selector:@selector(Magic1:) point:MAGIC2_POS];
            break;
        case 2:
            _btnMagic2 = [self addButton:JN2 selector:@selector(Magic2:) point:MAGIC2_POS];
            break;
        case 3:
            _btnMagic3 = [self addButton:JN2 selector:@selector(Magic3:) point:MAGIC2_POS];
            break;
        case 4:
            _btnMagic4 = [self addButton:JN2 selector:@selector(Magic4:) point:MAGIC2_POS];
            break;
        default:
            break;
    }
}

- (NBSkillButton*) addButton:(int)magicNum selector:(SEL)sel point:(CGPoint)point
{
    NSString * jn = [NSString stringWithFormat:@"jN%03d.png", magicNum];
    NSString * jnLiang = [NSString stringWithFormat:@"jN%03dLiang.png", magicNum];
    NSString * jnHUI = [NSString stringWithFormat:@"jN%03dHui.png", magicNum];
    NBSkillButton *btnMagic = [NBSkillButton itemFromNormalImage:jn selectedImage:jnLiang disabledImage:jnHUI target:self selector:sel];
    [btnMagic setScale:0.75];
    CCMenu *btnMagicMenu = [CCMenu menuWithItems:btnMagic, nil];
    btnMagicMenu.position = point;
    [self addChild:btnMagicMenu z:4];
	return btnMagic;
}

//==============盟军=================
-(void) Magic1:(id) sender 
{
	GameController *gc = [GameController getGameController];
    [gc.spriteInfo removeAllChildrenWithCleanup:YES];
    if (gc.operateType == OT_MAGIC_FRIENDLY) {
        gc.operateType = OT_NORMAL;
        gc.screenClickType = SCT_ALL;
    } else {
        gc.operateType = OT_MAGIC_FRIENDLY;
        gc.screenClickType = SCT_ONLYWHITE;
        //显示魔法信息
    }
    [gc setGameStatus];
}

//==============火雨=================
-(void) Magic2:(id) sender 
{
    GameController *gc = [GameController getGameController];
    [gc.spriteInfo removeAllChildrenWithCleanup:YES];
    if (gc.operateType == OT_MAGIC_FIRE) {
        gc.operateType = OT_NORMAL;
        gc.screenClickType = SCT_ALL;
    } else {
        gc.operateType = OT_MAGIC_FIRE;
        gc.screenClickType = SCT_ONLYWHITE;
        //显示魔法信息
    }
    [gc setGameStatus];
}

//==============雷电=================
-(void) Magic3:(id) sender
{
	GameController *gc = [GameController getGameController];
    [gc.spriteInfo removeAllChildrenWithCleanup:YES];
    if (gc.operateType == OT_MAGIC_THUNDER) {
        gc.operateType = OT_NORMAL;
        gc.screenClickType = SCT_ALL;
    } else {
        gc.operateType = OT_MAGIC_THUNDER;
        gc.screenClickType = SCT_ENEMY;
        //显示魔法信息
    }
    [gc setGameStatus];
}

//==============静止=================
-(void) Magic4:(id) sender 
{
	GameController *gc = [GameController getGameController];
    [gc.spriteInfo removeAllChildrenWithCleanup:YES];
    if (gc.operateType == OT_MAGIC_STOP) {
        gc.operateType = OT_NORMAL;
        gc.screenClickType = SCT_ALL;
    } else {
        gc.operateType = OT_MAGIC_STOP;
        gc.screenClickType = SCT_ENEMY;
        //显示魔法信息
    }
    [gc setGameStatus];
}

-(void) GoNext:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [_btnGo stopAllActions];
	GameController *gc = [GameController getGameController];
	[gc startNextWave];
    [gc setGameStatus];
}

- (void) setGoMenuStatus
{
    GameController *gc = [GameController getGameController];
    if (!gc.canNext) {
        [_btnGo setIsEnabled:NO];
        return;
    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [_btnGo setIsEnabled:NO];
        return;
    }
    
    [_btnGo setIsEnabled:YES];
}

- (void) setMagic1MenuStatus
{
    if (!_btnMagic1) return;
    
    if (magic1Restart) {
        [_btnMagic1 setIsEnabled:NO];
        return;
    }

    GameController *gc = [GameController getGameController];
//    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_FRIENDLY) {
//        [_btnMagic1 setIsEnabled:NO];
//        return;
//    }
//    
    if ([CCDirector sharedDirector].isPaused) {
        [_btnMagic1 setIsEnabled:NO];
        return;
    }
    
    [_btnMagic1 setIsEnabled:YES];
    
    if (gc.operateType == OT_MAGIC_FRIENDLY) {
        [_btnMagic1 selected];
    } else {
        [_btnMagic1 unselected];
    }
}

- (void) setMagic2MenuStatus
{
    if (!_btnMagic2) return;
    
    if (magic2Restart) {
        [_btnMagic2 setIsEnabled:NO];
        return;
    }

    GameController *gc = [GameController getGameController];
//    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_FIRE) {
//        [_btnMagic2 setIsEnabled:NO];
//        return;
//    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [_btnMagic2 setIsEnabled:NO];
        return;
    }
    
    [_btnMagic2 setIsEnabled:YES];
    
    if (gc.operateType == OT_MAGIC_FIRE) {
        [_btnMagic2 selected];
    } else {
        [_btnMagic2 unselected];
    }
}

- (void) setMagic3MenuStatus
{
    if (!_btnMagic3) return;
    
    if (magic3Restart) {
        [_btnMagic3 setIsEnabled:NO];
        return;
    }

    GameController *gc = [GameController getGameController];
//    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_THUNDER) {
//        [_btnMagic3 setIsEnabled:NO];
//        return;
//    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [_btnMagic3 setIsEnabled:NO];
        return;
    }
    
    [_btnMagic3 setIsEnabled:YES];
    
    if (gc.operateType == OT_MAGIC_THUNDER) {
        [_btnMagic3 selected];
    } else {
        [_btnMagic3 unselected];
    }
}

- (void) setMagic4MenuStatus
{
    if (!_btnMagic4) return;
    
    if (magic4Restart) {
        [_btnMagic4 setIsEnabled:NO];
        return;
    }

    GameController *gc = [GameController getGameController];
//    if (gc.operateType != OT_NORMAL && gc.operateType != OT_MAGIC_STOP) {
//        [_btnMagic4 setIsEnabled:NO];
//        return;
//    }
    
    if ([CCDirector sharedDirector].isPaused) {
        [_btnMagic4 setIsEnabled:NO];
        return;
    }
    
    [_btnMagic4 setIsEnabled:YES];
    
    if (gc.operateType == OT_MAGIC_STOP) {
        [_btnMagic4 selected];
    } else {
        [_btnMagic4 unselected];
    }
}

- (void) restartMagicFire
{
    [_btnMagic2 setIsEnabled:NO];
    magic2Restart = YES;
    [_btnMagic2 doProgress:MIGIC_FIRE_COOLDOWN from:100 to:0 t:self s:@selector(endRestartMagicFire:)];
}

- (void) endRestartMagicFire:(ccTime)dt {
    [self unschedule:@selector(endRestartMagicFire:)];
    magic2Restart = NO;
    GameController *gc = [GameController getGameController];
    [gc setGameStatus];
}

- (void) restartMagicFriendly
{
    [_btnMagic1 setIsEnabled:NO];
    magic1Restart = YES;
    [_btnMagic1 doProgress:MIGIC_FRIENDLY_COOLDOWN from:100 to:0 t:self s:@selector(endRestartMagicFriendly:)];
}

- (void) endRestartMagicFriendly:(ccTime)dt {
    [self unschedule:@selector(endRestartMagicFriendly:)];
    magic1Restart = NO;
    GameController *gc = [GameController getGameController];
    [gc setGameStatus];
}

- (void) restartMagicThunder
{
    [_btnMagic3 setIsEnabled:NO];
    magic3Restart = YES;
    [_btnMagic3 doProgress:MIGIC_THUNDER_COOLDOWN from:100 to:0 t:self s:@selector(endRestartMagicThunder:)];
}

- (void) endRestartMagicThunder:(ccTime)dt {
    [self unschedule:@selector(endRestartMagicThunder:)];
    magic3Restart = NO;
    GameController *gc = [GameController getGameController];
    [gc setGameStatus];
}

- (void) restartMagicStop
{
    [_btnMagic4 setIsEnabled:NO];
    magic4Restart = YES;
    [_btnMagic4 doProgress:MIGIC_STONE_COOLDOWN from:100 to:0 t:self s:@selector(endRestartMagicStop:)];
}

- (void) endRestartMagicStop:(ccTime)dt {
    [self unschedule:@selector(endRestartMagicStop:)];
    magic4Restart = NO;
    GameController *gc = [GameController getGameController];
    [gc setGameStatus];
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
