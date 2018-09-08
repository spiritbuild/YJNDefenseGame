#import "TDFootEnemy.h"
#import "GamePubDef.h"

@implementation TDFootEnemy

- (void) addAnimate:(int)level
{
    self.mvuAniName = [NSString stringWithFormat:@"ft%02dmvu", level];
    self.mvdAniName = [NSString stringWithFormat:@"ft%02dmvd", level];
    self.mvcAniName = [NSString stringWithFormat:@"ft%02dmvc", level];
    self.ddAniName = [NSString stringWithFormat:@"ft%02ddd", level];
    self.atAniName = [NSString stringWithFormat:@"ft%02dat", level];
    self.smallPic = [NSString stringWithFormat:@"smft%02d.png", level];
}

@end

@implementation TDFootEnemy1

+ (id) getSprite {
    TDFootEnemy1 *enemy = [TDFootEnemy1 spriteWithSpriteFrameName:@"ft01mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft01mvc0001.png";
        [enemy setScale:TDS_FT1_SCALE];
        enemy.maxHP = TDS_FT1_MAXHP;
        enemy.currentHP = TDS_FT1_CURRENTHP;
        enemy.moveSpeed = TDS_FT1_MOVESPEED;
        enemy.attacttime = TDS_FT1_ATTACTTIME;
        enemy.attactRange = TDS_FT1_ATTACTRANGE;     
        enemy.attact = TDS_FT1_ATTACT;
        enemy.attactMode = TDS_FT1_ATTACTMODE;
        enemy.defence = TDS_FT1_DEFENCE;
        enemy.defenceMode = TDS_FT1_DEFENCEMODE;
        enemy.getGold = TDS_FT1_GETGOLD;
        [enemy addAnimate:1];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy2

+ (id) getSprite {
    TDFootEnemy2 *enemy = [TDFootEnemy2 spriteWithSpriteFrameName:@"ft02mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft02mvc0001.png";
        [enemy setScale:TDS_FT2_SCALE];
        enemy.maxHP = TDS_FT2_MAXHP;
        enemy.currentHP = TDS_FT2_CURRENTHP;
        enemy.moveSpeed = TDS_FT2_MOVESPEED;
        enemy.attacttime = TDS_FT2_ATTACTTIME;
        enemy.attactRange = TDS_FT2_ATTACTRANGE;     
        enemy.attact = TDS_FT2_ATTACT;
        enemy.attactMode = TDS_FT2_ATTACTMODE;
        enemy.defence = TDS_FT2_DEFENCE;
        enemy.defenceMode = TDS_FT2_DEFENCEMODE;
        enemy.getGold = TDS_FT2_GETGOLD;
        [enemy addAnimate:2];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy3

+ (id) getSprite {
    TDFootEnemy3 *enemy = [TDFootEnemy3 spriteWithSpriteFrameName:@"ft03mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft03mvc0001.png";
        [enemy setScale:TDS_FT3_SCALE];
        enemy.maxHP = TDS_FT3_MAXHP;
        enemy.currentHP = TDS_FT3_CURRENTHP;
        enemy.moveSpeed = TDS_FT3_MOVESPEED;
        enemy.attacttime = TDS_FT3_ATTACTTIME;
        enemy.attactRange = TDS_FT3_ATTACTRANGE;     
        enemy.attact = TDS_FT3_ATTACT;
        enemy.attactMode = TDS_FT3_ATTACTMODE;
        enemy.defence = TDS_FT3_DEFENCE;
        enemy.defenceMode = TDS_FT3_DEFENCEMODE;
        enemy.getGold = TDS_FT3_GETGOLD;
        [enemy addAnimate:3];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy4

+ (id) getSprite {
    TDFootEnemy4 *enemy = [TDFootEnemy4 spriteWithSpriteFrameName:@"ft04mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft04mvc0001.png";
        [enemy setScale:TDS_FT4_SCALE];
        enemy.maxHP = TDS_FT4_MAXHP;
        enemy.currentHP = TDS_FT4_CURRENTHP;
        enemy.moveSpeed = TDS_FT4_MOVESPEED;
        enemy.attacttime = TDS_FT4_ATTACTTIME;
        enemy.attactRange = TDS_FT4_ATTACTRANGE;     
        enemy.attact = TDS_FT4_ATTACT;
        enemy.attactMode = TDS_FT4_ATTACTMODE;
        enemy.defence = TDS_FT4_DEFENCE;
        enemy.defenceMode = TDS_FT4_DEFENCEMODE;
        enemy.getGold = TDS_FT4_GETGOLD;
        [enemy addAnimate:4];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy5

+ (id) getSprite {
    TDFootEnemy5 *enemy = [TDFootEnemy5 spriteWithSpriteFrameName:@"ft05mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft05mvc0001.png";
        [enemy setScale:TDS_FT5_SCALE];
        enemy.maxHP = TDS_FT5_MAXHP;
        enemy.currentHP = TDS_FT5_CURRENTHP;
        enemy.moveSpeed = TDS_FT5_MOVESPEED;
        enemy.attacttime = TDS_FT5_ATTACTTIME;
        enemy.attactRange = TDS_FT5_ATTACTRANGE;     
        enemy.attact = TDS_FT5_ATTACT;
        enemy.attactMode = TDS_FT5_ATTACTMODE;
        enemy.defence = TDS_FT5_DEFENCE;
        enemy.defenceMode = TDS_FT5_DEFENCEMODE;
        enemy.getGold = TDS_FT5_GETGOLD;
        [enemy addAnimate:5];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy6

+ (id) getSprite {
    TDFootEnemy6 *enemy = [TDFootEnemy6 spriteWithSpriteFrameName:@"ft06mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft06mvc0001.png";
        [enemy setScale:TDS_FT6_SCALE];
        enemy.maxHP = TDS_FT6_MAXHP;
        enemy.currentHP = TDS_FT6_CURRENTHP;
        enemy.moveSpeed = TDS_FT6_MOVESPEED;
        enemy.attacttime = TDS_FT6_ATTACTTIME;
        enemy.attactRange = TDS_FT6_ATTACTRANGE;     
        enemy.attact = TDS_FT6_ATTACT;
        enemy.attactMode = TDS_FT6_ATTACTMODE;
        enemy.defence = TDS_FT6_DEFENCE;
        enemy.defenceMode = TDS_FT6_DEFENCEMODE;
        enemy.getGold = TDS_FT6_GETGOLD;
        [enemy addAnimate:6];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy7

+ (id) getSprite {
    TDFootEnemy7 *enemy = [TDFootEnemy7 spriteWithSpriteFrameName:@"ft07mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft07mvc0001.png";
        [enemy setScale:TDS_FT7_SCALE];
        enemy.maxHP = TDS_FT7_MAXHP;
        enemy.currentHP = TDS_FT7_CURRENTHP;
        enemy.moveSpeed = TDS_FT7_MOVESPEED;
        enemy.attacttime = TDS_FT7_ATTACTTIME;
        enemy.attactRange = TDS_FT7_ATTACTRANGE;     
        enemy.attact = TDS_FT7_ATTACT;
        enemy.attactMode = TDS_FT7_ATTACTMODE;
        enemy.defence = TDS_FT7_DEFENCE;
        enemy.defenceMode = TDS_FT7_DEFENCEMODE;
        enemy.getGold = TDS_FT7_GETGOLD;
        [enemy addAnimate:7];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy8

+ (id) getSprite {
    TDFootEnemy8 *enemy = [TDFootEnemy8 spriteWithSpriteFrameName:@"ft08mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft08mvc0001.png";
        [enemy setScale:TDS_FT8_SCALE];
        enemy.maxHP = TDS_FT8_MAXHP;
        enemy.currentHP = TDS_FT8_CURRENTHP;
        enemy.moveSpeed = TDS_FT8_MOVESPEED;
        enemy.attacttime = TDS_FT8_ATTACTTIME;
        enemy.attactRange = TDS_FT8_ATTACTRANGE;     
        enemy.attact = TDS_FT8_ATTACT;
        enemy.attactMode = TDS_FT8_ATTACTMODE;
        enemy.defence = TDS_FT8_DEFENCE;
        enemy.defenceMode = TDS_FT8_DEFENCEMODE;
        enemy.getGold = TDS_FT8_GETGOLD;
        [enemy addAnimate:8];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy9

+ (id) getSprite {
    TDFootEnemy9 *enemy = [TDFootEnemy9 spriteWithSpriteFrameName:@"ft09mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft09mvc0001.png";
        [enemy setScale:TDS_FT9_SCALE];
        enemy.maxHP = TDS_FT9_MAXHP;
        enemy.currentHP = TDS_FT9_CURRENTHP;
        enemy.moveSpeed = TDS_FT9_MOVESPEED;
        enemy.attacttime = TDS_FT9_ATTACTTIME;
        enemy.attactRange = TDS_FT9_ATTACTRANGE;     
        enemy.attact = TDS_FT9_ATTACT;
        enemy.attactMode = TDS_FT9_ATTACTMODE;
        enemy.defence = TDS_FT9_DEFENCE;
        enemy.defenceMode = TDS_FT9_DEFENCEMODE;
        enemy.getGold = TDS_FT9_GETGOLD;
        [enemy addAnimate:9];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy10

+ (id) getSprite {
    TDFootEnemy10 *enemy = [TDFootEnemy10 spriteWithSpriteFrameName:@"ft10mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft10mvc0001.png";
        [enemy setScale:TDS_FT10_SCALE];
        enemy.maxHP = TDS_FT10_MAXHP;
        enemy.currentHP = TDS_FT10_CURRENTHP;
        enemy.moveSpeed = TDS_FT10_MOVESPEED;
        enemy.attacttime = TDS_FT10_ATTACTTIME;
        enemy.attactRange = TDS_FT10_ATTACTRANGE;     
        enemy.attact = TDS_FT10_ATTACT;
        enemy.attactMode = TDS_FT10_ATTACTMODE;
        enemy.defence = TDS_FT10_DEFENCE;
        enemy.defenceMode = TDS_FT10_DEFENCEMODE;
        enemy.getGold = TDS_FT10_GETGOLD;
        [enemy addAnimate:10];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy11

+ (id) getSprite {
    TDFootEnemy11 *enemy = [TDFootEnemy11 spriteWithSpriteFrameName:@"ft11mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft11mvc0001.png";
        [enemy setScale:TDS_FT11_SCALE];
        enemy.maxHP = TDS_FT11_MAXHP;
        enemy.currentHP = TDS_FT11_CURRENTHP;
        enemy.moveSpeed = TDS_FT11_MOVESPEED;
        enemy.attacttime = TDS_FT11_ATTACTTIME;
        enemy.attactRange = TDS_FT11_ATTACTRANGE;     
        enemy.attact = TDS_FT11_ATTACT;
        enemy.attactMode = TDS_FT11_ATTACTMODE;
        enemy.defence = TDS_FT11_DEFENCE;
        enemy.defenceMode = TDS_FT11_DEFENCEMODE;
        enemy.getGold = TDS_FT11_GETGOLD;
        [enemy addAnimate:11];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy12

+ (id) getSprite {
    TDFootEnemy12 *enemy = [TDFootEnemy12 spriteWithSpriteFrameName:@"ft12mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft12mvc0001.png";
        [enemy setScale:TDS_FT12_SCALE];
        enemy.maxHP = TDS_FT12_MAXHP;
        enemy.currentHP = TDS_FT12_CURRENTHP;
        enemy.moveSpeed = TDS_FT12_MOVESPEED;
        enemy.attacttime = TDS_FT12_ATTACTTIME;
        enemy.attactRange = TDS_FT12_ATTACTRANGE;     
        enemy.attact = TDS_FT12_ATTACT;
        enemy.attactMode = TDS_FT12_ATTACTMODE;
        enemy.defence = TDS_FT12_DEFENCE;
        enemy.defenceMode = TDS_FT12_DEFENCEMODE;
        enemy.getGold = TDS_FT12_GETGOLD;
        [enemy addAnimate:12];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy13

+ (id) getSprite {
    TDFootEnemy13 *enemy = [TDFootEnemy13 spriteWithSpriteFrameName:@"ft13mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft13mvc0001.png";
        [enemy setScale:TDS_FT13_SCALE];
        enemy.maxHP = TDS_FT13_MAXHP;
        enemy.currentHP = TDS_FT13_CURRENTHP;
        enemy.moveSpeed = TDS_FT13_MOVESPEED;
        enemy.attacttime = TDS_FT13_ATTACTTIME;
        enemy.attactRange = TDS_FT13_ATTACTRANGE;     
        enemy.attact = TDS_FT13_ATTACT;
        enemy.attactMode = TDS_FT13_ATTACTMODE;
        enemy.defence = TDS_FT13_DEFENCE;
        enemy.defenceMode = TDS_FT13_DEFENCEMODE;
        enemy.getGold = TDS_FT13_GETGOLD;
        [enemy addAnimate:13];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy14

+ (id) getSprite {
    TDFootEnemy14 *enemy = [TDFootEnemy14 spriteWithSpriteFrameName:@"ft14mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft14mvc0001.png";
        [enemy setScale:TDS_FT14_SCALE];
        enemy.maxHP = TDS_FT14_MAXHP;
        enemy.currentHP = TDS_FT14_CURRENTHP;
        enemy.moveSpeed = TDS_FT14_MOVESPEED;
        enemy.attacttime = TDS_FT14_ATTACTTIME;
        enemy.attactRange = TDS_FT14_ATTACTRANGE;     
        enemy.attact = TDS_FT14_ATTACT;
        enemy.attactMode = TDS_FT14_ATTACTMODE;
        enemy.defence = TDS_FT14_DEFENCE;
        enemy.defenceMode = TDS_FT14_DEFENCEMODE;
        enemy.getGold = TDS_FT14_GETGOLD;
        [enemy addAnimate:14];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy15

+ (id) getSprite {
    TDFootEnemy15 *enemy = [TDFootEnemy15 spriteWithSpriteFrameName:@"ft15mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft15mvc0001.png";
        [enemy setScale:TDS_FT15_SCALE];
        enemy.maxHP = TDS_FT15_MAXHP;
        enemy.currentHP = TDS_FT15_CURRENTHP;
        enemy.moveSpeed = TDS_FT15_MOVESPEED;
        enemy.attacttime = TDS_FT15_ATTACTTIME;
        enemy.attactRange = TDS_FT15_ATTACTRANGE;     
        enemy.attact = TDS_FT15_ATTACT;
        enemy.attactMode = TDS_FT15_ATTACTMODE;
        enemy.defence = TDS_FT15_DEFENCE;
        enemy.defenceMode = TDS_FT15_DEFENCEMODE;
        enemy.getGold = TDS_FT15_GETGOLD;
        [enemy addAnimate:15];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation TDFootEnemy16

+ (id) getSprite {
    TDFootEnemy16 *enemy = [TDFootEnemy16 spriteWithSpriteFrameName:@"ft16mvc0001.png"];
    if (enemy) {
        enemy.firstFrameName = @"ft16mvc0001.png";
        [enemy setScale:TDS_FT16_SCALE];
        enemy.maxHP = TDS_FT16_MAXHP;
        enemy.currentHP = TDS_FT16_CURRENTHP;
        enemy.moveSpeed = TDS_FT16_MOVESPEED;
        enemy.attacttime = TDS_FT16_ATTACTTIME;
        enemy.attactRange = TDS_FT16_ATTACTRANGE;     
        enemy.attact = TDS_FT16_ATTACT;
        enemy.attactMode = TDS_FT16_ATTACTMODE;
        enemy.defence = TDS_FT16_DEFENCE;
        enemy.defenceMode = TDS_FT16_DEFENCEMODE;
        enemy.getGold = TDS_FT16_GETGOLD;
        [enemy addAnimate:16];
    }
    return enemy;
}

- (void) dealloc
{  
    [super dealloc];
}

@end
