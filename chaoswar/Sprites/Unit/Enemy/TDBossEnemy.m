#import "TDBossEnemy.h"
#import "GamePubDef.h"

@implementation TDBossEnemy

- (void) addAnimate:(int)level
{
    self.mvuAniName = [NSString stringWithFormat:@"bs%02dmvu", level];
    self.mvdAniName = [NSString stringWithFormat:@"bs%02dmvd", level];
    self.mvcAniName = [NSString stringWithFormat:@"bs%02dmvc", level];
    self.ddAniName = [NSString stringWithFormat:@"bs%02ddd", level];
    self.atAniName = [NSString stringWithFormat:@"bs%02dat", level];
    self.mcAniName = [NSString stringWithFormat:@"bs%02dmagic", level];
    self.smallPic = [NSString stringWithFormat:@"smbs%02d.png", level];
}

@end

@implementation TDBossEnemy1

+ (id) getSprite {
    TDBossEnemy1 *enemy = [TDBossEnemy1 spriteWithSpriteFrameName:@"bs01mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"bs01mvc0001.png";
        [enemy setScale:TDS_BS1_SCALE];
        enemy.maxHP = TDS_BS1_MAXHP;
        enemy.currentHP = TDS_BS1_CURRENTHP;
        enemy.moveSpeed = TDS_BS1_MOVESPEED;
        enemy.attacttime = TDS_BS1_ATTACTTIME;
        enemy.attactRange = TDS_BS1_ATTACTRANGE;     
        enemy.attact = TDS_BS1_ATTACT;
        enemy.attactMode = TDS_BS1_ATTACTMODE;
        enemy.defence = TDS_BS1_DEFENCE;
        enemy.defenceMode = TDS_BS1_DEFENCEMODE;
        enemy.getGold = TDS_BS1_GETGOLD;
        [enemy addAnimate:1];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDBossEnemy2

+ (id) getSprite {
    TDBossEnemy2 *enemy = [TDBossEnemy2 spriteWithSpriteFrameName:@"bs02mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"bs02mvc0001.png";
        [enemy setScale:TDS_BS2_SCALE];
        enemy.maxHP = TDS_BS2_MAXHP;
        enemy.currentHP = TDS_BS2_CURRENTHP;
        enemy.moveSpeed = TDS_BS2_MOVESPEED;
        enemy.attacttime = TDS_BS2_ATTACTTIME;
        enemy.attactRange = TDS_BS2_ATTACTRANGE;     
        enemy.attact = TDS_BS2_ATTACT;
        enemy.attactMode = TDS_BS2_ATTACTMODE;
        enemy.defence = TDS_BS2_DEFENCE;
        enemy.defenceMode = TDS_BS2_DEFENCEMODE;
        enemy.getGold = TDS_BS2_GETGOLD;
        [enemy addAnimate:2];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end
