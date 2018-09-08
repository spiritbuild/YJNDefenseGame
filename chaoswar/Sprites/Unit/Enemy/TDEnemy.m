#import <Foundation/Foundation.h>
#import "TDEnemy.h"
#import "GameController.h"
#import "GameMagicScene.h"
#import "SpriteInfoScene.h"
#import "TDFriendly.h"
#import "TDBullet.h"
#import "TDDefBullet.h"
#import "TDMagicBullet.h"
#import "TDTower.h"

const NSMutableArray* regfriendlyArray = nil;

@implementation TDEnemy

@synthesize nextWayPoint = _nextWayPoint;
@synthesize way = _way;
@synthesize shootBulletArray = _shootBulletArray;
@synthesize towerBulletArray = _towerBulletArray;
@synthesize friendlyBulletArray = _friendlyBulletArray;
@synthesize magicBulletArray = _magicBulletArray;
@synthesize towerArray = _towerArray;

-(id) init
{
    self = [super init];
	if(self) {
        _shootBulletArray = [[NSMutableArray alloc] init];
        _towerBulletArray = [[NSMutableArray alloc] init];
        _friendlyBulletArray = [[NSMutableArray alloc] init];
        _magicBulletArray = [[NSMutableArray alloc] init];
        _towerArray = [[NSMutableArray alloc] init];
        _friendlyArray = [[NSMutableArray alloc] init];
        _isAttacting = NO;
	}
	return self;
}

- (void) clearSpriteData
{
    NSMutableArray *tmpArray = nil;
    //发射的子弹清空
    tmpArray = [NSMutableArray arrayWithArray:_shootBulletArray];
    for (TDEnemyBullet *t in tmpArray) t.shooter = nil;
    [tmpArray removeAllObjects];
    //被攻击的子弹清空
    tmpArray = [NSMutableArray arrayWithArray:_towerBulletArray];
    for (TDTowerBullet *t in tmpArray) t.enemy = nil;
    [tmpArray removeAllObjects];
    //被攻击的子弹清空
    tmpArray = [NSMutableArray arrayWithArray:_friendlyBulletArray];
    for (TDFriendlyBullet *t in tmpArray) t.enemy = nil;
    [tmpArray removeAllObjects];
    //被攻击的子弹清空
    tmpArray = [NSMutableArray arrayWithArray:_magicBulletArray];
    for (TDMagicBullet *t in tmpArray) t.enemy = nil;
    [tmpArray removeAllObjects];
    //被攻击的塔清空
    tmpArray = [NSMutableArray arrayWithArray:_towerArray];
    for (TDTower *t in tmpArray) t.enemy = nil;
    [tmpArray removeAllObjects];
    //被攻击的友军清空
    tmpArray = [NSMutableArray arrayWithArray:_friendlyArray];
    for (TDFriendly *t in tmpArray) t.enemy = nil;
    [tmpArray removeAllObjects];
    [super clearSpriteData];
}

- (void) dealloc
{
    [_shootBulletArray removeAllObjects];
    [_towerBulletArray removeAllObjects];
    [_friendlyBulletArray removeAllObjects];
    [_magicBulletArray removeAllObjects];
    [_towerArray removeAllObjects];
    [_friendlyArray removeAllObjects];
    [_shootBulletArray release];
    [_towerBulletArray release];
    [_friendlyBulletArray release];
    [_magicBulletArray release];
    [_towerArray release];
    [_friendlyArray release];
    self.way = nil;
	[super dealloc];
}

- (void) spriteTouchBegan:(UITouch *)touch operateType:(TOperateType)operateType
{
    [super spriteTouchBegan:touch operateType:operateType];
    switch (operateType) {
        case OT_NORMAL:
            break;
        case OT_MAGIC_THUNDER:
            [self doMagicThunder];
            break;
        case OT_MAGIC_STOP:
            [self doMagicStop];
            break;
        default:
            break;
    }
}

- (CGPoint) getPositionAfterTime:(ccTime)dt isHead:(float)isHead
{
    GLfloat headPos = self.textureRect.size.height * isHead;
    if (self.unitStatus != US_NORMAL) {
        return ccp(self.position.x, self.position.y + headPos);
    }
    if (!self.canSchedule) {
        return ccp(self.position.x, self.position.y + headPos);
    }
    CGFloat doDistance = self.moveSpeed * dt;
    CGPoint currentPos = self.position;
    CGPoint nextPos = self.position;
    int iWave = _nextWayPoint;
    while ((iWave < self.way.count)) {
        WayPoint *wp = [self.way objectAtIndex:iWave];
        nextPos = wp.point;
        CGFloat curDistance = ccpDistance(currentPos, nextPos);
        if (curDistance >= doDistance) {
            CGFloat x = nextPos.x - currentPos.x;
            x = x * doDistance;
            x = x / curDistance;
            x = currentPos.x + x;
            CGFloat y = nextPos.y - currentPos.y;
            y = y * doDistance;
            y = y / curDistance;
            y = currentPos.y + y;

            return ccp(x, y + headPos);
        }
        doDistance = doDistance - curDistance;
        currentPos = nextPos;
        iWave++;
    }
    return ccp(currentPos.x, currentPos.y + headPos);
}

//================主要逻辑================
- (void) initUnitStatus {
    if (self.friendly == nil) {
        self.unitStatus = US_NORMAL;
        return;
    }
    if (self.canAttactFriendly != nil) {
        self.unitStatus = US_ATTACT;
        return;    
    }
    self.unitStatus = US_WAITING;
}

- (void) doUnitLogic {
    if (self.spriteStatus != TSS_NORMAL) return;
    if (!self.canSchedule) {
        [self unscheduleAllSelectors];
        _isAttacting = NO;
        return;
    }
    [self initUnitStatus];
    switch (self.unitStatus) {
        case US_NORMAL:
            [self doRunning];
            break;
        case US_WAITING:
            [self doWaiting];
            break;
        case US_ATTACT:
            [self doAttact];
            break;
        default:
            break;
    }
}

- (void) doRunning
{
    [self stopAllActions];
    [self unscheduleAllSelectors];
    //按路线行走
    [self schedule:@selector(doMove:)];
}

- (void) doWaiting
{
    [self setFlipX:NO];
    if (_nextWayPoint < self.way.count) {
        WayPoint *wp = [self.way objectAtIndex:_nextWayPoint];
        CGPoint position = wp.point;
        if (position.x - self.position.x) {
            [self setFlipX:YES];
        }
    }
    [self stopAllActions];
    [self unscheduleAllSelectors];
    CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:self.firstFrameName];
	NSAssert1(frame!=nil, @"Invalid spriteFrameName: %@", self.firstFrameName);
	[self setDisplayFrame:frame];
}

- (void) doAttact
{
    if (!_isAttacting) {
        TDFriendly *f = self.canAttactFriendly;
        if (f) {
            _isAttacting = YES;
            [self startAttact];
        }
    }
}

- (void) doMove:(ccTime)dt {
    [self stopAllActions];
    [self unscheduleAllSelectors];
    [self setFlipX:NO];
    GameController *gc = [GameController getGameController];
    CGPoint position = self.position;
    if (_nextWayPoint >= self.way.count) {
        self.spriteStatus = TSS_DEAD;
        gc.currentHealth = gc.currentHealth - 1;
        return;
    }
    WayPoint *wp = [self.way objectAtIndex:_nextWayPoint];
    position = wp.point;
    //动画
    float x_plus = position.x - self.position.x;
    float y_plus = position.y - self.position.y;
    if (abs(x_plus) > abs(y_plus)) {
        //横走
        if (x_plus > 0) {
            //右
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:[self getAnimate:self.mvcAniName] restoreOriginalFrame:NO]]];
        } else {
            //左
            [self setFlipX:YES];
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:[self getAnimate:self.mvcAniName] restoreOriginalFrame:NO]]];
        }
    } else {
        //竖走
        if (y_plus > 0) {
            //上
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:[self getAnimate:self.mvuAniName] restoreOriginalFrame:NO]]];
        } else {
            //下
            [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:[self getAnimate:self.mvdAniName] restoreOriginalFrame:NO]]];
        }
    }
    //移动
    double curDistance = ccpDistance(self.position, position);
    ccTime speed = curDistance / self.moveSpeed / self.speedUPNum;
    id actionMove = [CCMoveTo actionWithDuration:speed position:position];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterMove:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

-(void) afterMove:(id)sender {
    _nextWayPoint++;
    [self doUnitLogic];
}

- (void) startAttact {
    [self stopAllActions];
    [self unscheduleAllSelectors];
    [self doAttactAction:0];
    [self schedule:@selector(doAttactAction:) interval:self.attacttime];
}

- (void) doAttactAction:(ccTime)dt {
    TDFriendly *f = self.canAttactFriendly;
    if (f) {
        CGPoint position = f.position;
        if (self.position.x > position.x) {
            [self setFlipX:YES];
        } else {
            [self setFlipX:NO];
        }
        id actionAttact = [CCAnimate actionWithAnimation:[self getAnimate:self.atAniName] restoreOriginalFrame:NO];
        id actionAttactDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterAttact:)];
        [self runAction:[CCSequence actions:actionAttact, actionAttactDone, nil]];
    } else {
        _isAttacting = NO;
        [self stopAllActions];
        [self unscheduleAllSelectors];
        [self doUnitLogic];
    }
}

-(void) afterAttact:(id)sender {
    TDFriendly *f = self.canAttactFriendly;
    if (f) {
        [f beAttact:self an:self.attact at:self.attactMode];
        if (self.friendly == nil) {
            _isAttacting = NO;
            [self stopAllActions];
            [self unscheduleAllSelectors];
            [self doUnitLogic];
        }
    }
}

//================主要逻辑================

//================友军的操作================
+ (void) regFriendly:(TDFriendly*)f {
    if (!regfriendlyArray) {
        regfriendlyArray = [[NSMutableArray alloc] init];
    }
    [regfriendlyArray removeObject:f];
    [regfriendlyArray addObject:f];
    [TDEnemy tellFriendlys];
}

+ (void) tellFriendlys {
    GameController *gc = [GameController getGameController];
    for (TDEnemy* e in gc.enemyArray) {
        if (e.spriteStatus == TSS_NORMAL) {
            [e tellFriendly];
        }
    }
}

+ (void) unregFriendly:(TDFriendly*)f {
    if (!regfriendlyArray) {
        regfriendlyArray = [[NSMutableArray alloc] init];
    }
    [regfriendlyArray removeObject:f];
}

- (void) addFriendly:(TDFriendly*)f {
    if (!f) {
        return;
    }
    if (([_friendlyArray indexOfObject:f] < INT_MAX)) {
        return;
    }
    [_friendlyArray addObject:f];
    [self doUnitLogic];
}

- (void) delFriendly:(TDFriendly*)f {
    if (!f) {
        return;
    }
    [_friendlyArray removeObject:f];
    [self doUnitLogic];
}

- (int) friendlyCount {
    return [_friendlyArray count];
}

- (TDFriendly *)friendly {
    if ([_friendlyArray count] == 0) {
        return nil;
    }
    return [_friendlyArray objectAtIndex:0];
}

- (TDFriendly *) canAttactFriendly
{
    for (TDFriendly *f in _friendlyArray) {
        if (f && f.unitStatus == US_ATTACT) {
            return f;
        }
    }
    return nil;
}

-(void) setPosition: (CGPoint)newPosition
{
    [super setPosition:newPosition];
    if (self.spriteStatus == TSS_NORMAL) {
        [self tellFriendly];
    }
}

- (void) tellFriendly {
    if (!regfriendlyArray) {
        regfriendlyArray = [[NSMutableArray alloc] init];
    }
    for (int i = 0; i < [regfriendlyArray count]; i++) {
        TDFriendly* f = [regfriendlyArray objectAtIndex:i];
        if (f.spriteStatus == TSS_NORMAL) {
            double curDistance = ccpDistance(f.searchPoint, self.position);
            if (curDistance <= f.searchRange) {
                [f AttactEnemy:self];
            }
        }
    }
}
//================友军的操作================

//================魔法的操作================
- (void) doMagicThunder
{
    GameController *gc = [GameController getGameController];
	TDThunderBullet1 *b = [TDThunderBullet1 getSprite];
    b.createTime = now();
    b.enemy = self;
    b.position = ccp(self.position.x, self.position.y + 100);
    [gc.gameBackground addChild:b z:60];
    [gc.bulletArray addObject:b];
    [b run];
    gc.screenClickType = SCT_ALL;
    gc.operateType = OT_NORMAL;
    [gc.gameMagic restartMagicThunder];
}

- (void) doMagicStop
{
    GameController *gc = [GameController getGameController];
	TDStoneBullet1 *b = [TDStoneBullet1 getSprite];
    b.createTime = now();
    b.enemy = self;
    b.position = ccp(self.position.x, self.position.y + 100);
    [gc.gameBackground addChild:b z:60];
    [gc.bulletArray addObject:b];
    [b run];
    gc.screenClickType = SCT_ALL;
    gc.operateType = OT_NORMAL;
    [gc.gameMagic restartMagicStop];
}

//================魔法的操作================

- (void) showImformation {
    [[GameController getGameController].spriteInfo showEnemyInfo];
    [[GameController getGameController].spriteInfo setSmallPic:self.smallPic];
    [[GameController getGameController].spriteInfo setAttact:self.attact];
    [[GameController getGameController].spriteInfo setAttactSpeed:self.attacttime];
    [[GameController getGameController].spriteInfo setBloodNum:self.currentHP];
    [[GameController getGameController].spriteInfo setMoveSpeed:self.moveSpeed];    
}

@end
