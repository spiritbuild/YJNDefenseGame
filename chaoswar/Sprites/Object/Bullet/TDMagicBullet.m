#import "TDMagicBullet.h"
#import "TDUnit.h"
#import "GameController.h"
#import "TDEnemy.h"

@implementation TDFireBullet1

@synthesize attactRange = _attactRange;
@synthesize aniBoomName = _aniBoomName;
@synthesize aniEffectName = _aniEffectName;

+ (id) getSprite {
    TDFireBullet1 *bullet = [TDFireBullet1 spriteWithSpriteFrameName:@"firebu0001.png"];
    if (bullet) {
        bullet.moveTime = MC_FIRE_BULLET_MOVETIME;
        bullet.attact = MC_FIRE_BULLET_ATTACT;
        bullet.attactMode = MC_FIRE_BULLET_ATTACTMODE;
        bullet.attactRange = MC_FIRE_BULLET_RANGE;
    }
    return bullet;
}

-(id) init
{
	if( (self=[super init])) {
        _aniBoomName = @"fireeb";
        _aniEffectName = @"fireef";
        [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.9 animation:[self getAnimate:@"firebu"] restoreOriginalFrame:NO]]];
	}
	return self;
}

- (BOOL) run
{
    if ([super run] == NO) return NO;
    [self move];
    return YES;
}

- (void) move {
    id actionMove = [CCMoveTo actionWithDuration:self.moveTime position:self.firePoint];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(attact:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

- (void) attact:(id)sender
{
    [self attactEnemy];
}

- (void) attactEnemy
{
    [self stopAllActions];
    id actionBoom = [CCAnimate actionWithAnimation:[self getAnimate:self.aniBoomName] restoreOriginalFrame:NO];
	id actionAttact = [CCCallFuncN actionWithTarget:self selector:@selector(afterRepeat:)];
    id actionEffect = [CCAnimate actionWithAnimation:[self getAnimate:self.aniEffectName] restoreOriginalFrame:NO];
    id actionDead = [CCCallFuncN actionWithTarget:self selector:@selector(selfDead:)];
	[self runAction:[CCSequence actions:actionAttact, actionBoom, actionEffect, actionDead, nil]];
}

-(void) afterRepeat:(id)sender {    
    [self searchClearEnemy];
    if (self.parent) {
        CCNode *p = self.parent;
        [self removeFromParentAndCleanup:NO];
        [p addChild:self z:4];
    }
}

- (void) searchClearEnemy {
	GameController *gc = [GameController getGameController];
	for (TDEnemy *e in gc.enemyArray) {
        if (e && e.spriteStatus == TSS_NORMAL) {
            double curDistance = ccpDistance(self.position, e.position);
            if (curDistance <= self.attactRange) {
                [self attactAEnemy:e];
            }
        }
	}
}

-(void) selfDead:(id)sender {    
    self.spriteStatus = TSS_DEAD;
}

- (void) attactAEnemy:(TDEnemy*)enemy
{
    if (enemy && enemy.spriteStatus == TSS_NORMAL) {
        [enemy beAttact:self an:self.attact at:self.attactMode];
    }
}

@end

@implementation TDThunderBullet1

+ (id) getSprite {
    TDThunderBullet1 *bullet = [TDThunderBullet1 spriteWithSpriteFrameName:@"thunderbu0001.png"];
    if (bullet) {
        bullet.moveTime = MC_THUNDER_BULLET_MOVETIME;
        bullet.attact = MC_THUNDER_BULLET_ATTACT;
        bullet.attactMode = MC_THUNDER_BULLET_ATTACTMODE;
    }
    return bullet;
}

- (BOOL) run
{
    if ([super run] == NO) return NO;
    if (!self.enemy) {
        self.spriteStatus = TSS_DEAD;
        return NO;
    }
    self.anchorPoint = ccp(0.5, 0);
    self.position = ccp(self.enemy.position.x, self.enemy.position.y + self.enemy.textureRect.size.height);
    id actionRepeat = [CCAnimate actionWithAnimation:[self getAnimate:@"thunderbu"] restoreOriginalFrame:NO];
	id actionRepeatDone = [CCCallFuncN actionWithTarget:self selector:@selector(attact:)];
	[self runAction:[CCSequence actions:actionRepeat, actionRepeatDone, nil]];
    return YES;
}

- (void) attact:(id)sender
{
    if (self.enemy && self.enemy.spriteStatus == TSS_NORMAL) {
        [self.enemy beAttact:self an:self.attact at:self.attactMode];
    }
    self.spriteStatus = TSS_DEAD;
}

@end

@implementation TDStoneBullet1

@synthesize faintTime = _faintTime;
@synthesize aniBoomName = _aniBoomName;

+ (id) getSprite {
    TDStoneBullet1 *bullet = [TDStoneBullet1 spriteWithSpriteFrameName:@"stonebu0001.png"];
    if (bullet) {
        bullet.moveTime = MC_STONE_BULLET_MOVETIME;
        bullet.attact = MC_STONE_BULLET_ATTACT;
        bullet.attactMode = MC_STONE_BULLET_ATTACTMODE;
        bullet.faintTime = MC_STONE_BULLET_FAINTTIME;
    }
    return bullet;
}

-(id) init
{
	if( (self=[super init])) {
        _aniBoomName = @"stoneeb";
        [self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:0.1 animation:[self getAnimate:@"stonebu"] restoreOriginalFrame:NO]]];
	}
	return self;
}

- (BOOL) run
{
    if ([super run] == NO) return NO;
    [self move];
    return YES;
}

- (void) move {
    if (!self.enemy) {
        self.spriteStatus = TSS_DEAD;
        return;
    }
    CGPoint p = [self.enemy getPositionAfterTime:self.moveTime isHead:1];
    self.position = ccp(p.x, p.y + 100);
    id actionMove = [CCMoveTo actionWithDuration:self.moveTime position:p];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(attact:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

- (void) attact:(id)sender
{
    [self attactEnemy];
}

- (void) attactEnemy
{
    id actionBoom = [CCAnimate actionWithAnimation:[self getAnimate:self.aniBoomName] restoreOriginalFrame:NO];
	id actionAttact = [CCCallFuncN actionWithTarget:self selector:@selector(afterRepeat:)];
    id actionDead = [CCCallFuncN actionWithTarget:self selector:@selector(selfDead:)];
	[self runAction:[CCSequence actions:actionAttact, actionBoom, actionDead, nil]];
}

-(void) afterRepeat:(id)sender {    
    if (self.enemy && self.enemy.spriteStatus == TSS_NORMAL) {
        self.enemy.canSchedule = NO;
        [self.enemy doMagicStopStatus];
        [self.enemy beAttact:self an:self.attact at:self.attactMode];
        if (self.enemy) {
            //self.enemy.enemyStatus = US_WAITING;
        }
    }
}

-(void) selfDead:(id)sender {    
    self.spriteStatus = TSS_DEAD;
}

@end