#import "TDBullet.h"
#import "TDEnemy.h"
#import "TDFriendly.h"
#import "TDTower.h"
#import "cocos2d.h"

@implementation TDBullet

-(id) init
{
	if( (self=[super init])) {
        self.canClick = NO;
        self.baseZOrder = 2000;
	}
	return self;
}

@end

@implementation TDTowerBullet

@synthesize enemy = _enemy;
@synthesize shooter = _shooter;
@synthesize enemyPoint = _enemyPoint;

- (void) attact:(id)sender
{
    if (self.enemy && self.enemy.spriteStatus == TSS_NORMAL) {
        [self.enemy beAttact:_shooter an:self.attact at:self.attactMode];
    }
    self.spriteStatus = TSS_DEAD;
}

- (BOOL) run
{
    if ([super run] == NO) return NO;
    [self move];
    return YES;
}

- (void) move {

}

- (void) setEnemy:(TDEnemy *)enemy
{
    if (_enemy) {
        [_enemy.towerBulletArray removeObject:self];
    }
    _enemy = enemy;
    if (_enemy) {
        [_enemy.towerBulletArray addObject:self];
    }
}

- (void) setShooter:(TDTower *)shooter
{
    if (_shooter) {
        [_shooter.bulletArray removeObject:self];
    }
    _shooter = shooter;
    if (_shooter) {
        [_shooter.bulletArray addObject:self];
    }
}

- (void) clearSpriteData
{
    //攻击的敌人清空
    _enemy = nil;
    //发射的友军清空
    _shooter = nil;
    [super clearSpriteData];
}

@end

@implementation TDFriendlyBullet

@synthesize enemy = _enemy;
@synthesize shooter = _shooter;

- (void) attact:(id)sender
{
    if (self.enemy && self.enemy.spriteStatus == TSS_NORMAL) {
        [self.enemy beAttact:_shooter an:self.attact at:self.attactMode];
    }
    [self removeFromParentAndCleanup:YES];
    self.spriteStatus = TSS_DEAD;
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
    id actionMove = [CCJumpTo actionWithDuration:self.moveTime position:[self.enemy getPositionAfterTime:self.moveTime isHead:0] height:30 jumps:1];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(attact:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

- (void) setEnemy:(TDEnemy *)enemy
{
    if (_enemy) {
        [_enemy.friendlyBulletArray removeObject:self];
    }
    _enemy = enemy;
    if (_enemy) {
        [_enemy.friendlyBulletArray addObject:self];
    }
}

- (void) setShooter:(TDFriendly *)shooter
{
    if (_shooter) {
        [_shooter.shootBulletArray removeObject:self];
    }
    _shooter = shooter;
    if (_shooter) {
        [_shooter.shootBulletArray addObject:self];
    }
}

- (void) clearSpriteData
{
    //攻击的敌人清空
    _enemy = nil;
    //发射的友军清空
    _shooter = nil;
    [super clearSpriteData];
}

@end

@implementation TDEnemyBullet

@synthesize enemy = _enemy;
@synthesize shooter = _shooter;

- (void) attact:(id)sender
{
    if (self.enemy && self.enemy.spriteStatus == TSS_NORMAL) {
        [self.enemy beAttact:_shooter an:self.attact at:self.attactMode];
    }
    [self removeFromParentAndCleanup:YES];
    self.spriteStatus = TSS_DEAD;
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
    id actionMove = [CCJumpTo actionWithDuration:self.moveTime position:self.enemy.position height:30 jumps:1];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(attact:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

- (void) setEnemy:(TDFriendly *)enemy
{
    if (_enemy) {
        [_enemy.enemyBulletArray removeObject:self];
    }
    _enemy = enemy;
    if (_enemy) {
        [_enemy.enemyBulletArray addObject:self];
    }
}

- (void) setShooter:(TDEnemy *)shooter
{
    if (_shooter) {
        [_shooter.shootBulletArray removeObject:self];
    }
    _shooter = shooter;
    if (_shooter) {
        [_shooter.shootBulletArray addObject:self];
    }
}

- (void) clearSpriteData
{
    //攻击的敌人清空
    _enemy = nil;
    //发射的友军清空
    _shooter = nil;
    [super clearSpriteData];
}

@end

@implementation TDMagicBullet

@synthesize enemy = _enemy;

- (void) setEnemy:(TDEnemy *)enemy
{
    if (_enemy) {
        [_enemy.magicBulletArray removeObject:self];
    }
    _enemy = enemy;
    if (_enemy) {
        [_enemy.magicBulletArray addObject:self];
    }
}

- (void) clearSpriteData
{
    //攻击的敌人清空
    _enemy = nil;
    [super clearSpriteData];
}

@end

@implementation TDMoveBullet

@synthesize firePoint = _firePoint;
@synthesize attactRange = _attactRange;

@end
