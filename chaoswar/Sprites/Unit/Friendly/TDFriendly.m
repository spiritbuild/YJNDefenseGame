#import "TDFriendly.h"
#import "TDDefenceTower.h"
#import "SpriteInfoScene.h"
#import "TDFlyEnemy.h"
#import "SimpleAudioEngine.h"

@implementation MFLife

@synthesize friendly = _friendly;
@synthesize lifeTime = _lifeTime;

- (BOOL) run {
    if (!_friendly) {
        return NO;
    }
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(autoAddLife:) forTarget:self interval:_lifeTime paused:NO];
    return YES;
}

- (BOOL) stop {
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    return YES;
}

//自动死亡
- (void) autoAddLife:(ccTime)dt {
    if (_friendly) {
        _friendly.currentHP = _friendly.currentHP + 2;
        if (_friendly.currentHP > _friendly.maxHP) {
            _friendly.currentHP = _friendly.maxHP;
        }
    }
}

- (void)dealloc {
    [self stop];
    [super dealloc];
}

@end;

@implementation TDFriendly

@synthesize enemy = _enemy;
@synthesize shootBulletArray = _shootBulletArray;
@synthesize enemyBulletArray = _enemyBulletArray;
@synthesize attactEnemyArray = _attactEnemyArray;
@synthesize mvAniName = _mvAniName;
@synthesize searchPoint = _searchPoint;


-(id) init
{
	if( (self=[super init])) {
        _shootBulletArray = [[NSMutableArray alloc] init];
        _enemyBulletArray = [[NSMutableArray alloc] init];
        _attactEnemyArray = [[NSMutableArray alloc] init];
        _mfLife = [[MFLife alloc] init];
        _mfLife.friendly = self;
        _mfLife.lifeTime = 1;
	}
	return self;
}

- (void) dealloc
{
    if (_mfLife) {
        [_mfLife stop];
        [_mfLife release];
        _mfLife = nil;
    }
    if (_enemy) {
        [_enemy delFriendly:self];
        _enemy = nil;
    }
    [_shootBulletArray removeAllObjects];
    [_enemyBulletArray removeAllObjects];
    [_attactEnemyArray removeAllObjects];
    [_shootBulletArray release];
    [_enemyBulletArray release];
    [_attactEnemyArray release];
    [_mvAniName release];
	[super dealloc];
}

- (void) setEnemy:(TDEnemy *)enemy
{
    if (_enemy) {
        [_enemy delFriendly:self];
    }
    _enemy = enemy;
    if (_enemy) {
        [_enemy addFriendly:self];
    }
    if (self.spriteStatus == TSS_NORMAL) {
        [self doUnitLogic];
    }
}

- (void) clearSpriteData
{
    if (_mfLife) {
        [_mfLife stop];
        [_mfLife release];
        _mfLife = nil;
    }
    [TDEnemy unregFriendly:self];
    NSMutableArray *tmpArray = nil;
    //攻击的敌人清空
    if (_enemy) {
        [_enemy delFriendly:self];
        _enemy = nil;
    }
    [self cleanup];
    //发射的子弹清空
    tmpArray = [NSMutableArray arrayWithArray:_shootBulletArray];
    for (TDFriendlyBullet *t in tmpArray) t.shooter = nil;
    [tmpArray removeAllObjects];
    //攻击的子弹清空
    tmpArray = [NSMutableArray arrayWithArray:_enemyBulletArray];
    for (TDEnemyBullet *t in tmpArray) t.enemy = nil;
    [tmpArray removeAllObjects];
    //被攻击的敌军清空
    tmpArray = [NSMutableArray arrayWithArray:_attactEnemyArray];
    for (TDEnemy *t in tmpArray) [t delFriendly:self];
    [tmpArray removeAllObjects];
    [super clearSpriteData];
}

- (void) statusToDeading {
    [super statusToDeading];
    [[SimpleAudioEngine sharedEngine] playEffect:@"friendlyDead.wav"];
}

- (BOOL) run
{
    if ([super run] == NO) return NO;
    [TDEnemy regFriendly:self];
    [_mfLife run];
    return YES;
}

- (void) doUnitLogic {
    if (self.spriteStatus != TSS_NORMAL) return;
    if (!_enemy) self.unitStatus = US_NORMAL;
    switch (self.unitStatus) {
        case US_NORMAL:
            [self doGoHomeLogic];
            break;
        case US_WAITING:
            [self doMoveToEnemy];
            break;
        case US_ATTACT:
            break;
        default:
            break;
    }
}

//==============回聚集点（搜索点）==============
- (void) doGoHomeLogic {
    [self stopAllActions];
    [self unscheduleAllSelectors];
    //位置不同就移动过去
    if ((self.searchPoint.x != self.position.x)
        || (self.searchPoint.y != self.position.y)) {
        [self setFlipX:NO];
        double curDistance = ccpDistance(self.position, self.searchPoint);
        ccTime speed = curDistance / self.moveSpeed;
        if (self.position.x > self.searchPoint.x) {
            [self setFlipX:YES];
        }
        [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:[self getAnimate:self.mvAniName] restoreOriginalFrame:NO]]];
        id actionMove = [CCMoveTo actionWithDuration:speed position:self.searchPoint];
        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterToSearchPoint:)];
        [self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
    }
}

-(void) afterToSearchPoint:(id)sender {
    
    CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:self.firstFrameName];
	NSAssert1(frame!=nil, @"Invalid spriteFrameName: %@", self.firstFrameName);
	[self setDisplayFrame:frame];
    [self doUnitLogic];
}

//==============回聚集点（搜索点）==============

//==============攻击敌军==============
-(void) doMoveToEnemy {
    if (_enemy) {
        [self stopAllActions];
        [self unscheduleAllSelectors];
        CGPoint position = _enemy.position;
        ccTime speed = 0;
        if (CCRANDOM_0_1() > 0.5f) {
            position.x = position.x - (_enemy.contentSize.width / 2) - 6;
            double curDistance = ccpDistance(self.position, position);
            speed = curDistance / self.moveSpeed;
        } else {
            position.x = position.x + (_enemy.contentSize.width / 2) + 6;
            double curDistance = ccpDistance(self.position, position);
            speed = curDistance / self.moveSpeed;
        }
        
        if (self.position.x > position.x) {
            [self setFlipX:YES];
        }
        
        [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:[self getAnimate:self.mvAniName] restoreOriginalFrame:NO]]];
        id actionMoveToEnemy = [CCMoveTo actionWithDuration:speed position:position];
        id actionAfterMoveToEnemy = [CCCallFuncN actionWithTarget:self selector:@selector(afterMoveToEnemy:)];
        [self runAction:[CCSequence actions:actionMoveToEnemy, actionAfterMoveToEnemy, nil]];
    }
}

-(void) afterMoveToEnemy:(id)sender {
    if (_enemy) {
        //移动到位，开始攻击
        self.unitStatus = US_ATTACT;
        [_enemy doUnitLogic];
        [self doAttact:0];
        [self schedule:@selector(doAttact:) interval:self.attacttime];
    }
}

//攻击敌军
- (void) doAttact:(ccTime)dt {
    [self stopAllActions];
    [self setFlipX:NO];
    CGPoint position = self.enemy.position;
    if (self.position.x > position.x) {
        [self setFlipX:YES];
    }
    
    id actionAttact = [CCAnimate actionWithAnimation:[self getAnimate:self.atAniName] restoreOriginalFrame:NO];
	id actionAttactDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterAttact:)];
	[self runAction:[CCSequence actions:actionAttact, actionAttactDone, nil]];
}

-(void) afterAttact:(id)sender {
    if (_enemy) {
        [_enemy beAttact:self an:self.attact at:self.attactMode];
    }
    
    if (!_enemy) {
        //无可攻击敌军时，返回营地
        self.unitStatus = US_NORMAL;
        [TDEnemy tellFriendlys];
        [self doUnitLogic];
    }
}

//==============攻击敌军==============

//==============敌军的通知==============

- (BOOL) canAttactEnemy:(TDEnemy*)e
{
    if ([e isKindOfClass:[TDFlyEnemy class]]) {
        return NO;
    }
	return YES;
}

- (void) AttactEnemy:(TDEnemy*)e
{
    if (!e) {
        return;
    }
    
    if (e == _enemy) {
        return;
    }
    
    if (![self canAttactEnemy:e]) {
        return;
    }
    
    if (_enemy && [_enemy friendlyCount] == 1) {
        return;
    }

    self.unitStatus = US_WAITING;
    self.enemy = e;
}

//==============敌军的通知==============

- (void) showImformation {
    [[GameController getGameController].spriteInfo showFriendlyInfo];
    [[GameController getGameController].spriteInfo setSmallPic:self.smallPic];
    [[GameController getGameController].spriteInfo setAttact:self.attact];
    [[GameController getGameController].spriteInfo setAttactSpeed:self.attacttime];
    [[GameController getGameController].spriteInfo setBloodNum:self.currentHP];
    [[GameController getGameController].spriteInfo setMoveSpeed:self.moveSpeed];    
}

@end
