#import "TDUnit.h"
#import "GameController.h"
#import "ArchievementController.h"
#import "MagicController.h"
#import "SpriteInfoScene.h"

@implementation TDUnit

@synthesize unitStatus = _unitStatus;
@synthesize maxMP = _maxMP;
@synthesize currentMP = _currentMP;
@synthesize moveSpeed = _moveSpeed;
@synthesize searchRange = _searchRange;
@synthesize attact = _attact;
@synthesize attactMode = _attactMode;
@synthesize attactRange = _attactRange;
@synthesize attacttime = _attacttime;
@synthesize defence = _defence;
@synthesize defenceMode = _defenceMode;
@synthesize mvuAniName = _mvuAniName;
@synthesize mvdAniName = _mvdAniName;
@synthesize mvcAniName = _mvcAniName;
@synthesize atAniName = _atAniName;
@synthesize ddAniName = _ddAniName;
@synthesize mcAniName = _mcAniName;
@synthesize canAction = _canAction;
@synthesize canSchedule = _canSchedule;
@synthesize speedUPNum = _speedUPNum;
@synthesize smallPic = _smallPic;
@synthesize firstFrameName = _firstFrameName;

-(id) init
{
	if( (self=[super init])) {
        self.showBlood = YES;
        self.canAction = YES;
        self.canSchedule = YES;
        self.speedUPNum = 1;
        self.unitStatus = US_NORMAL;
        _magicController = [[MagicController alloc] init];
        _magicController.unit = self;
        self.smallPic = @"smbs01.png";
        if (!_firstFrameName) {
            self.firstFrameName = @"";
        }
	}
	return self;
}

- (BOOL) run
{
    if ([super run] == NO) return NO;
    [self doUnitLogic];
    return YES;
}

- (void) doUnitLogic {
    
}

- (void)dealloc {
    [_firstFrameName release];
    [_mvuAniName release];
    [_mvdAniName release];
    [_mvcAniName release];
    [_atAniName release];
    [_ddAniName release];
    [_mcAniName release];
    [_magicController stop];
    [_magicController release];
    [self.smallPic release];
    [super dealloc];
}

//攻击力比例
- (float) getAttactPercent:(TAcctactType)at
{
    switch (self.defenceMode) {
        case DT_NO:
            switch (at) {
                case AT_NORMAL:
                    return 1;
                    break;
                case AT_MAGIC:
                    return 1;
                    break;  
                default:
                    return 1;
                    break;
            }
            break;
        case DT_MAGIC:
            switch (at) {
                case AT_NORMAL:
                    return 1;
                    break;
                case AT_MAGIC:
                    return 0.75;
                    break;  
                default:
                    return 1;
                    break;
            }
            break;
        case DT_HIGH:
            switch (at) {
                case AT_NORMAL:
                    return 0.75;
                    break;
                case AT_MAGIC:
                    return 1;
                    break;  
                default:
                    return 1;
                    break;
            }
            break;
        default:
            return 1;
            break;
    }
    return 1;
}

- (void) beAttact:(TDSprite*)s an:(int)an at:(TAcctactType)at
{
    int attactNum = an - self.defence;
    attactNum = attactNum * [self getAttactPercent:at];
    self.currentHP = self.currentHP - attactNum;
    if (self.currentHP < 0) self.currentHP = 0;
    if (self.currentHP == 0) {
        [ArchievementController addSpriteBeaten:s beater:self];
        s.killNum++;
        [self stopAllActions];
        [self unscheduleAllSelectors];
        self.spriteStatus = TSS_DEADING;
    }
}

- (void) statusToDeading {
    [super statusToDeading];
    GameController *gc = [GameController getGameController];
    //获得金币奖励
    gc.currentGold = gc.currentGold + self.getGold;
    //防止获得多次金币
    self.getGold = 0;
    //执行死亡动画
    id actionDead = [CCAnimate actionWithAnimation:[self getAnimate:self.ddAniName] restoreOriginalFrame:NO];
    id actionDeadDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterDead:)];
    [self runAction:[CCSequence actions:actionDead, actionDeadDone, nil]];
}

-(void) afterDead:(id)sender {
    //状态改为死亡
    self.spriteStatus = TSS_DEAD;
}

//================魔法的操作================

- (void) doMagicStopStatus
{
    if (self.spriteStatus == TSS_NORMAL) {
        [_magicController doMagicStopStatus];
    }
}

- (void) doMagicSpeedStatus
{
    if (self.spriteStatus == TSS_NORMAL) {
        [_magicController doMagicSpeedStatus];
    }
}

- (void) doMagicLifeStatus
{
    if (self.spriteStatus == TSS_NORMAL) {
        [_magicController doMagicLifeStatus];
    }
}

//================魔法的操作================

@end
