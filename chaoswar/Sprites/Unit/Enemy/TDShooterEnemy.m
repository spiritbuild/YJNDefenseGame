#import "TDShooterEnemy.h"
#import "GamePubDef.h"

@implementation TDShooterEnemy

- (void) addAnimate:(int)level
{
    self.mvuAniName = [NSString stringWithFormat:@"st%02dmvu", level];
    self.mvdAniName = [NSString stringWithFormat:@"st%02dmvd", level];
    self.mvcAniName = [NSString stringWithFormat:@"st%02dmvc", level];
    self.ddAniName = [NSString stringWithFormat:@"st%02ddd", level];
    self.atAniName = [NSString stringWithFormat:@"st%02dat", level];
    self.mcAniName = [NSString stringWithFormat:@"st%02dmagic", level];
    self.smallPic = [NSString stringWithFormat:@"smst%02d.png", level];
}

@end

@implementation TDShooterEnemy1

+ (id) getSprite {
    TDShooterEnemy1 *enemy = [TDShooterEnemy1 spriteWithSpriteFrameName:@"ft01mvc0001.png"];
    if (enemy) {
        [enemy setScale:TDS_ST1_SCALE];
        enemy.maxHP = TDS_ST1_MAXHP;
        enemy.currentHP = TDS_ST1_CURRENTHP;
        enemy.moveSpeed = TDS_ST1_MOVESPEED;
        enemy.attacttime = TDS_ST1_ATTACTTIME;
        enemy.attactRange = TDS_ST1_ATTACTRANGE;     
        enemy.attact = TDS_ST1_ATTACT;
        enemy.attactMode = TDS_ST1_ATTACTMODE;
        enemy.defence = TDS_ST1_DEFENCE;
        enemy.defenceMode = TDS_ST1_DEFENCEMODE;
        enemy.getGold = TDS_ST1_GETGOLD;
        [enemy addAnimate:1];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end
