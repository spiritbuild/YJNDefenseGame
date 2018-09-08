#import "TDMagicEnemy.h"
#import "GameController.h"
#import "GamePubDef.h"

@implementation MEMagic

@synthesize enemy = _enemy;
@synthesize magicTime = _magicTime;

- (id) init {
    self = [super init];
    if (self) {
       arrayMagicEnemy = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL) run {
    if (!_enemy) {
        return NO;
    }
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(doingMagic:) forTarget:self interval:_magicTime paused:NO];
    return YES;
}

- (void) doingMagic:(ccTime)dt {
    [arrayMagicEnemy removeAllObjects];
    [arrayMagicEnemy addObjectsFromArray:[_enemy searchMagicEnemy]];
    if ([arrayMagicEnemy count] > 0) {
        [_enemy unscheduleAllSelectors];
        [_enemy stopAllActions];
        _enemy.doMagic = YES;
        id actionAttact = [CCAnimate actionWithAnimation:[_enemy getAnimate:_enemy.mcAniName] restoreOriginalFrame:NO];
        id actionAttactDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterMagic:)];
        [_enemy runAction:[CCSequence actions:actionAttact, actionAttactDone, nil]];
    }
}

-(void) afterMagic:(id)sender {
    [_enemy doMagicLogic:arrayMagicEnemy];
    _enemy.doMagic = NO;
    [_enemy doUnitLogic];
}

- (BOOL) stop {
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    return YES;
}

- (void)dealloc {
    [self stop];
    [arrayMagicEnemy release];
    [super dealloc];
}

@end;

@implementation TDMagicEnemy

@synthesize magicRange = _magicRange;
@synthesize doMagic = _doMagic;

-(id) init
{
    self = [super init];
	if(self) {
        _magicRange = 100;
        meMagic = [[MEMagic alloc] init];
        meMagic.enemy = self;
        meMagic.magicTime = 7;
        _doMagic = NO;
	}
	return self;
}

- (void) clearSpriteData
{
    _doMagic = NO;
    if (meMagic) {
        [meMagic stop];
        [meMagic release];
        meMagic = nil;
    }
    [super clearSpriteData];
}

- (BOOL) run
{
    if ([super run] == NO) return NO;
    [meMagic run];
    return YES;
}

- (void)doUnitLogic {
    if (_doMagic) return;
    [super doUnitLogic];
}

- (NSArray*) searchMagicEnemy {
    NSMutableArray *array = [NSMutableArray array];
    float x_min = self.position.x - self.magicRange;
    float x_max = self.position.x + self.magicRange;
    float y_min = self.position.y - self.magicRange;
    float y_max = self.position.y + self.magicRange;
    WayPoint *wp = [self.way objectAtIndex:self.nextWayPoint];
    CGPoint position = wp.point;
    float x_plus = position.x - self.position.x;
    float y_plus = position.y - self.position.y;
    if (abs(x_plus) > abs(y_plus)) {
        if (x_plus > 0) {
            x_min = self.position.x;
        } else {
            x_max = self.position.x;
        }
    } else {
        if (y_plus > 0) {
            y_min = self.position.y;
        } else {
            y_max = self.position.y;
        }
    }
    double maxDistant = self.magicRange;
	GameController *gc = [GameController getGameController];
	for (TDEnemy *e in gc.enemyArray) {
        if (e && e.spriteStatus == TSS_NORMAL && e != self) {
            double curDistance = ccpDistance(self.position, e.position);
            if (curDistance <= maxDistant) {
                if (   e.position.x >= x_min
                    && e.position.x <= x_max
                    && e.position.y >= y_min
                    && e.position.y <= y_max) {
                    [array addObject:e];
                }
            }
        }
	}
	return array;
}

- (void) doMagicLogic:(NSMutableArray*)array {

}

- (void) addAnimate:(int)level
{
    self.mvuAniName = [NSString stringWithFormat:@"mc%02dmvu", level];
    self.mvdAniName = [NSString stringWithFormat:@"mc%02dmvd", level];
    self.mvcAniName = [NSString stringWithFormat:@"mc%02dmvc", level];
    self.ddAniName = [NSString stringWithFormat:@"mc%02ddd", level];
    self.atAniName = [NSString stringWithFormat:@"mc%02dat", level];
    self.mcAniName = [NSString stringWithFormat:@"mc%02dmagic", level];
    self.smallPic = [NSString stringWithFormat:@"smmc%02d.png", level];
}

@end

@implementation TDMagicEnemy1

+ (id) getSprite {
    TDMagicEnemy1 *enemy = [TDMagicEnemy1 spriteWithSpriteFrameName:@"mc01mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"mc01mvc0001.png";
        [enemy setScale:TDS_MC1_SCALE];
        enemy.maxHP = TDS_MC1_MAXHP;
        enemy.currentHP = TDS_MC1_CURRENTHP;
        enemy.moveSpeed = TDS_MC1_MOVESPEED;
        enemy.attacttime = TDS_MC1_ATTACTTIME;
        enemy.attactRange = TDS_MC1_ATTACTRANGE;     
        enemy.attact = TDS_MC1_ATTACT;
        enemy.attactMode = TDS_MC1_ATTACTMODE;
        enemy.defence = TDS_MC1_DEFENCE;
        enemy.defenceMode = TDS_MC1_DEFENCEMODE;
        enemy.getGold = TDS_MC1_GETGOLD;
        [enemy addAnimate:1];
    }
    return enemy;
}

- (void) doMagicLogic:(NSMutableArray*)array {
    if (!array) {
        return;
    }
    for (TDEnemy *e in array) {
        [e doMagicLifeStatus];
    }
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDMagicEnemy2

+ (id) getSprite {
    TDMagicEnemy2 *enemy = [TDMagicEnemy2 spriteWithSpriteFrameName:@"mc02mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"mc02mvc0001.png";
        [enemy setScale:TDS_MC2_SCALE];
        enemy.maxHP = TDS_MC2_MAXHP;
        enemy.currentHP = TDS_MC2_CURRENTHP;
        enemy.moveSpeed = TDS_MC2_MOVESPEED;
        enemy.attacttime = TDS_MC2_ATTACTTIME;
        enemy.attactRange = TDS_MC2_ATTACTRANGE;     
        enemy.attact = TDS_MC2_ATTACT;
        enemy.attactMode = TDS_MC2_ATTACTMODE;
        enemy.defence = TDS_MC2_DEFENCE;
        enemy.defenceMode = TDS_MC2_DEFENCEMODE;
        enemy.getGold = TDS_MC2_GETGOLD;
        [enemy addAnimate:2];
    }
    return enemy;
}

- (void) doMagicLogic:(NSMutableArray*)array {
    if (!array) {
        return;
    }
    for (TDEnemy *e in array) {
        [e doMagicSpeedStatus];
    }
}

- (void) dealloc
{  
    [super dealloc];
}

@end
