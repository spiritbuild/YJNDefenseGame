#import "TDDefBullet.h"
#import "TDUnit.h"
#import "GameController.h"
#import "TDEnemy.h"
#import "SimpleAudioEngine.h"

@implementation TDArrowTowerBullet

- (void) move {
    CGPoint p = CGPointZero;
    float r = 0;
    if (!self.enemy) {
        p = self.enemyPoint;
    } else {
        p = [self.enemy getPositionAfterTime:self.moveTime isHead:0.5];
    }
    
    if (p.x < self.position.x) {
        self.rotation = -10;
        r = -170;
    } else {
        self.rotation = 10;
        r = 170;
    }
    
    id actionMove = [CCJumpTo actionWithDuration:self.moveTime position:p height:30 jumps:1];
    id rotateMove = [CCRotateTo actionWithDuration:self.moveTime angle:r];
    id spawnMove = [CCSpawn actions:actionMove, rotateMove, nil];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(attact:)];
	[self runAction:[CCSequence actions:spawnMove, actionMoveDone, nil]];
}

@end

@implementation TDArrowTowerBullet1

+ (id) getSprite {
    TDArrowTowerBullet1 *bullet = [TDArrowTowerBullet1 spriteWithFile:@"atb.png"];
    if (bullet) {
        bullet.moveTime = TDS_ARROW_BULLET1_MOVETIME;
        bullet.attact = TDS_ARROW_BULLET1_ATTACT;
        bullet.attactMode = TDS_ARROW_BULLET1_ATTACTMODE;
    }
    return bullet;
}

@end

@implementation TDArrowTowerBullet2

+ (id) getSprite {
    TDArrowTowerBullet2 *bullet = [TDArrowTowerBullet2 spriteWithFile:@"atb.png"];
    if (bullet) {
        bullet.moveTime = TDS_ARROW_BULLET2_MOVETIME;
        bullet.attact = TDS_ARROW_BULLET2_ATTACT;
        bullet.attactMode = TDS_ARROW_BULLET2_ATTACTMODE;
    }
    return bullet;
}

@end

@implementation TDArrowTowerBullet3

+ (id) getSprite {
    TDArrowTowerBullet3 *bullet = [TDArrowTowerBullet3 spriteWithFile:@"atb.png"];
    if (bullet) {
        bullet.moveTime = TDS_ARROW_BULLET3_MOVETIME;
        bullet.attact = TDS_ARROW_BULLET3_ATTACT;
        bullet.attactMode = TDS_ARROW_BULLET3_ATTACTMODE;
    }
    return bullet;
}

@end

@implementation TDTurretTowerBullet

@synthesize attactRange = _attactRange;
@synthesize aniBoomName = _aniBoomName;

-(id) init
{
	if( (self=[super init])) {
        _aniBoomName = @"ttat";
	}
	return self;
}

- (void) move {
    CGPoint p = CGPointZero;
    float r = 0;
    if (!self.enemy) {
        p = self.enemyPoint;
    } else {
        p = [self.enemy getPositionAfterTime:self.moveTime isHead:0];
    }
    
    if (p.x < self.position.x) {
        self.rotation = -10;
        r = -170;
    } else {
        self.rotation = 10;
        r = 170;
    }
    
    id actionMove = [CCJumpTo actionWithDuration:self.moveTime position:p height:30 jumps:1];
    id rotateMove = [CCRotateTo actionWithDuration:self.moveTime angle:r];
    id spawnMove = [CCSpawn actions:actionMove, rotateMove, nil];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(attact:)];
	[self runAction:[CCSequence actions:spawnMove, actionMoveDone, nil]];
}

- (void) attact:(id)sender
{
    [self searchClearEnemy];
    id actionRepeat = [CCAnimate actionWithAnimation:[self getAnimate:self.aniBoomName] restoreOriginalFrame:NO];
	id actionRepeatDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterRepeat:)];
	[self runAction:[CCSequence actions:actionRepeat, actionRepeatDone, nil]];
    [[SimpleAudioEngine sharedEngine] playEffect:@"ttbullet.wav"];
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

- (void) attactAEnemy:(TDEnemy*)enemy
{
    if (enemy && enemy.spriteStatus == TSS_NORMAL) {
        [enemy beAttact:self an:self.attact at:self.attactMode];
    }
}

-(void) afterRepeat:(id)sender {
    [self removeFromParentAndCleanup:YES];
    self.spriteStatus = TSS_DEAD;
}

@end

@implementation TDTurretTowerBullet1

+ (id) getSprite {
    TDTurretTowerBullet1 *bullet = [TDTurretTowerBullet1 spriteWithFile:@"ttb01.png"];
    if (bullet) {
        bullet.moveTime = TDS_TURRET_BULLET1_MOVETIME;
        bullet.attact = TDS_TURRET_BULLET1_ATTACT;
        bullet.attactMode = TDS_TURRET_BULLET1_ATTACTMODE;
        bullet.attactRange = TDS_TURRET_BULLET1_RANGE;
    }
    return bullet;
}

@end

@implementation TDTurretTowerBullet2

+ (id) getSprite {
    TDTurretTowerBullet2 *bullet = [TDTurretTowerBullet2 spriteWithFile:@"ttb02.png"];
    if (bullet) {
        bullet.moveTime = TDS_TURRET_BULLET2_MOVETIME;
        bullet.attact = TDS_TURRET_BULLET2_ATTACT;
        bullet.attactMode = TDS_TURRET_BULLET2_ATTACTMODE;
        bullet.attactRange = TDS_TURRET_BULLET2_RANGE;
    }
    return bullet;
}

@end

@implementation TDTurretTowerBullet3

+ (id) getSprite {
    TDTurretTowerBullet3 *bullet = [TDTurretTowerBullet3 spriteWithFile:@"ttb03.png"];
    if (bullet) {
        bullet.moveTime = TDS_TURRET_BULLET3_MOVETIME;
        bullet.attact = TDS_TURRET_BULLET3_ATTACT;
        bullet.attactMode = TDS_TURRET_BULLET3_ATTACTMODE;
        bullet.attactRange = TDS_TURRET_BULLET3_RANGE;
    }
    return bullet;
}

@end

@implementation TDMagicTowerBullet

- (void) move {
    CGPoint p = CGPointZero;
    if (!self.enemy) {
        p = self.enemyPoint;
    } else {
        p = [self.enemy getPositionAfterTime:self.moveTime isHead:0.5];
    }
    id actionMove = [CCMoveTo actionWithDuration:self.moveTime position:p];
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(attact:)];
	[self runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

@end

@implementation TDMagicTowerBullet1

+ (id) getSprite {
    TDMagicTowerBullet1 *bullet = [TDMagicTowerBullet1 spriteWithFile:@"mtb.png"];
    if (bullet) {
        bullet.moveTime = TDS_MAGIC_BULLET1_MOVETIME;
        bullet.attact = TDS_MAGIC_BULLET1_ATTACT;
        bullet.attactMode = TDS_MAGIC_BULLET1_ATTACTMODE;
    }
    return bullet;
}

@end

@implementation TDMagicTowerBullet2

+ (id) getSprite {
    TDMagicTowerBullet2 *bullet = [TDMagicTowerBullet2 spriteWithFile:@"mtb.png"];
    if (bullet) {
        bullet.moveTime = TDS_MAGIC_BULLET2_MOVETIME;
        bullet.attact = TDS_MAGIC_BULLET2_ATTACT;
        bullet.attactMode = TDS_MAGIC_BULLET2_ATTACTMODE;
    }
    return bullet;
}

@end

@implementation TDMagicTowerBullet3

+ (id) getSprite {
    TDMagicTowerBullet3 *bullet = [TDMagicTowerBullet3 spriteWithFile:@"mtb.png"];
    if (bullet) {
        bullet.moveTime = TDS_MAGIC_BULLET3_MOVETIME;
        bullet.attact = TDS_MAGIC_BULLET3_ATTACT;
        bullet.attactMode = TDS_MAGIC_BULLET3_ATTACTMODE;
    }
    return bullet;
}

@end
