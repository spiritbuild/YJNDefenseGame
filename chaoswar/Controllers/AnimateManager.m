#import "AnimateManager.h"

@implementation AnimateManager

@synthesize parentScene;

- (id)init {
    self = [super init];
    if (self) {
        dicAnimates = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [dicAnimates removeAllObjects];
    [dicAnimates release];
    [super dealloc];
}

- (void) initAnimate:(NSString*)fileName
{
    if (parentScene) {
        CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
        [cache addSpriteFramesWithFile:[NSString stringWithFormat:@"%@.plist", fileName]];        
        CCSpriteBatchNode *sheet = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"%@.png", fileName]];
        [parentScene addChild:sheet];
    }
}

- (void) addAnimation:(NSString*)frameName animationName:(NSString*)animationName
{
    CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
    NSMutableArray *animArray = [NSMutableArray array];
    CCSpriteFrame *frame = nil;
    int i = 1;
    do {
        frame = [cache spriteFrameByName:[NSString stringWithFormat:frameName, i]];
        i++;
        if (frame != nil) {
            [animArray addObject:frame];
        }
    } while (frame != nil);
    if ([animArray count] == 0) {
        [NSString stringWithFormat:@"%@ animate is fail", animationName];
    }
    CCAnimation *anim = [CCAnimation animationWithFrames:animArray delay:0.05f];
    [anim setName:animationName];
    [dicAnimates setObject:anim forKey:animationName];
}

- (CCAnimation*) getAnimation:(NSString*)animationName
{
    if (![dicAnimates objectForKey:animationName]) {
        return nil;
    }
    return (CCAnimation*) [dicAnimates objectForKey:animationName];
}

- (void) initBoss01
{
    [self initAnimate:@"bs01"];
    [self addAnimation:@"bs01mvu%04d.png" animationName:@"bs01mvu"];
    [self addAnimation:@"bs01mvc%04d.png" animationName:@"bs01mvc"];
    [self addAnimation:@"bs01dd%04d.png" animationName:@"bs01dd"];
    [self addAnimation:@"bs01at%04d.png" animationName:@"bs01at"];
}

- (void) initBoss02
{
    [self initAnimate:@"bs021"];
    [self initAnimate:@"bs022"];
    [self addAnimation:@"bs02mvd%04d.png" animationName:@"bs02mvd"];
    [self addAnimation:@"bs02mvc%04d.png" animationName:@"bs02mvc"];
    [self addAnimation:@"bs02dd%04d.png" animationName:@"bs02dd"];
    [self addAnimation:@"bs02at%04d.png" animationName:@"bs02at"];
}

- (void) initFly01
{
    [self initAnimate:@"fl01"];
    [self addAnimation:@"fl01mvu%04d.png" animationName:@"fl01mvu"];
    [self addAnimation:@"fl01mvd%04d.png" animationName:@"fl01mvd"];
    [self addAnimation:@"fl01mvc%04d.png" animationName:@"fl01mvc"];
    [self addAnimation:@"fl01dd%04d.png" animationName:@"fl01dd"];
    [self addAnimation:@"fl01at%04d.png" animationName:@"fl01at"];
}

- (void) initFly02
{
    [self initAnimate:@"fl02"];
    [self addAnimation:@"fl02mvu%04d.png" animationName:@"fl02mvu"];
    [self addAnimation:@"fl02mvd%04d.png" animationName:@"fl02mvd"];
    [self addAnimation:@"fl02mvc%04d.png" animationName:@"fl02mvc"];
    [self addAnimation:@"fl02dd%04d.png" animationName:@"fl02dd"];
    [self addAnimation:@"fl02at%04d.png" animationName:@"fl02at"];
}

- (void) initFly03
{
    [self initAnimate:@"fl03"];
    [self addAnimation:@"fl03mvu%04d.png" animationName:@"fl03mvu"];
    [self addAnimation:@"fl03mvd%04d.png" animationName:@"fl03mvd"];
    [self addAnimation:@"fl03mvc%04d.png" animationName:@"fl03mvc"];
    [self addAnimation:@"fl03dd%04d.png" animationName:@"fl03dd"];
    [self addAnimation:@"fl03at%04d.png" animationName:@"fl03at"];
}

- (void) initShooter01
{
//    [self initAnimate:@"st01"];
//    [self addAnimation:@"st01mvu%04d.png" animationName:@"st01mvu"];
//    [self addAnimation:@"st01mvd%04d.png" animationName:@"st01mvd"];
//    [self addAnimation:@"st01mvc%04d.png" animationName:@"st01mvc"];
//    [self addAnimation:@"st01dd%04d.png" animationName:@"st01dd"];
//    [self addAnimation:@"st01at%04d.png" animationName:@"st01at"];
}

- (void) initMagic01
{
    [self initAnimate:@"mc01"];
    [self addAnimation:@"mc01mvu%04d.png" animationName:@"mc01mvu"];
    [self addAnimation:@"mc01mvd%04d.png" animationName:@"mc01mvd"];
    [self addAnimation:@"mc01mvc%04d.png" animationName:@"mc01mvc"];
    [self addAnimation:@"mc01dd%04d.png" animationName:@"mc01dd"];
    [self addAnimation:@"mc01at%04d.png" animationName:@"mc01at"];
    [self addAnimation:@"mc01magic%04d.png" animationName:@"mc01magic"];
}

- (void) initMagic02
{
    [self initAnimate:@"mc02"];
    [self addAnimation:@"mc02mvu%04d.png" animationName:@"mc02mvu"];
    [self addAnimation:@"mc02mvd%04d.png" animationName:@"mc02mvd"];
    [self addAnimation:@"mc02mvc%04d.png" animationName:@"mc02mvc"];
    [self addAnimation:@"mc02dd%04d.png" animationName:@"mc02dd"];
    [self addAnimation:@"mc02at%04d.png" animationName:@"mc02at"];
    [self addAnimation:@"mc02magic%04d.png" animationName:@"mc02magic"];
}

- (void) initFoot01
{
    [self initAnimate:@"ft01"];
    [self addAnimation:@"ft01mvu%04d.png" animationName:@"ft01mvu"];
    [self addAnimation:@"ft01mvd%04d.png" animationName:@"ft01mvd"];
    [self addAnimation:@"ft01mvc%04d.png" animationName:@"ft01mvc"];
    [self addAnimation:@"ft01dd%04d.png" animationName:@"ft01dd"];
    [self addAnimation:@"ft01at%04d.png" animationName:@"ft01at"];
}

- (void) initFoot02
{
    [self initAnimate:@"ft02"];
    [self addAnimation:@"ft02mvu%04d.png" animationName:@"ft02mvu"];
    [self addAnimation:@"ft02mvd%04d.png" animationName:@"ft02mvd"];
    [self addAnimation:@"ft02mvc%04d.png" animationName:@"ft02mvc"];
    [self addAnimation:@"ft02dd%04d.png" animationName:@"ft02dd"];
    [self addAnimation:@"ft02at%04d.png" animationName:@"ft02at"];
}

- (void) initFoot03
{
    [self initAnimate:@"ft03"];
    [self addAnimation:@"ft03mvu%04d.png" animationName:@"ft03mvu"];
    [self addAnimation:@"ft03mvd%04d.png" animationName:@"ft03mvd"];
    [self addAnimation:@"ft03mvc%04d.png" animationName:@"ft03mvc"];
    [self addAnimation:@"ft03dd%04d.png" animationName:@"ft03dd"];
    [self addAnimation:@"ft03at%04d.png" animationName:@"ft03at"];
}

- (void) initFoot04
{
    [self initAnimate:@"ft04"];
    [self addAnimation:@"ft04mvu%04d.png" animationName:@"ft04mvu"];
    [self addAnimation:@"ft04mvd%04d.png" animationName:@"ft04mvd"];
    [self addAnimation:@"ft04mvc%04d.png" animationName:@"ft04mvc"];
    [self addAnimation:@"ft04dd%04d.png" animationName:@"ft04dd"];
    [self addAnimation:@"ft04at%04d.png" animationName:@"ft04at"];
}

- (void) initFoot05
{
    [self initAnimate:@"ft05"];
    [self addAnimation:@"ft05mvu%04d.png" animationName:@"ft05mvu"];
    [self addAnimation:@"ft05mvd%04d.png" animationName:@"ft05mvd"];
    [self addAnimation:@"ft05mvc%04d.png" animationName:@"ft05mvc"];
    [self addAnimation:@"ft05dd%04d.png" animationName:@"ft05dd"];
    [self addAnimation:@"ft05at%04d.png" animationName:@"ft05at"];
}

- (void) initFoot06
{
    [self initAnimate:@"ft06"];
    [self addAnimation:@"ft06mvu%04d.png" animationName:@"ft06mvu"];
    [self addAnimation:@"ft06mvd%04d.png" animationName:@"ft06mvd"];
    [self addAnimation:@"ft06mvc%04d.png" animationName:@"ft06mvc"];
    [self addAnimation:@"ft06dd%04d.png" animationName:@"ft06dd"];
    [self addAnimation:@"ft06at%04d.png" animationName:@"ft06at"];
}

- (void) initFoot07
{
    [self initAnimate:@"ft07"];
    [self addAnimation:@"ft07mvu%04d.png" animationName:@"ft07mvu"];
    [self addAnimation:@"ft07mvd%04d.png" animationName:@"ft07mvd"];
    [self addAnimation:@"ft07mvc%04d.png" animationName:@"ft07mvc"];
    [self addAnimation:@"ft07dd%04d.png" animationName:@"ft07dd"];
    [self addAnimation:@"ft07at%04d.png" animationName:@"ft07at"];
}

- (void) initFoot08
{
    [self initAnimate:@"ft08"];
    [self addAnimation:@"ft08mvu%04d.png" animationName:@"ft08mvu"];
    [self addAnimation:@"ft08mvd%04d.png" animationName:@"ft08mvd"];
    [self addAnimation:@"ft08mvc%04d.png" animationName:@"ft08mvc"];
    [self addAnimation:@"ft08dd%04d.png" animationName:@"ft08dd"];
    [self addAnimation:@"ft08at%04d.png" animationName:@"ft08at"];
}

- (void) initFoot09
{
    [self initAnimate:@"ft09"];
    [self addAnimation:@"ft09mvu%04d.png" animationName:@"ft09mvu"];
    [self addAnimation:@"ft09mvd%04d.png" animationName:@"ft09mvd"];
    [self addAnimation:@"ft09mvc%04d.png" animationName:@"ft09mvc"];
    [self addAnimation:@"ft09dd%04d.png" animationName:@"ft09dd"];
    [self addAnimation:@"ft09at%04d.png" animationName:@"ft09at"];
}

- (void) initFoot10
{
    [self initAnimate:@"ft10"];
    [self addAnimation:@"ft10mvu%04d.png" animationName:@"ft10mvu"];
    [self addAnimation:@"ft10mvd%04d.png" animationName:@"ft10mvd"];
    [self addAnimation:@"ft10mvc%04d.png" animationName:@"ft10mvc"];
    [self addAnimation:@"ft10dd%04d.png" animationName:@"ft10dd"];
    [self addAnimation:@"ft10at%04d.png" animationName:@"ft10at"];
}

- (void) initFoot11
{
    [self initAnimate:@"ft11"];
    [self addAnimation:@"ft11mvu%04d.png" animationName:@"ft11mvu"];
    [self addAnimation:@"ft11mvd%04d.png" animationName:@"ft11mvd"];
    [self addAnimation:@"ft11mvc%04d.png" animationName:@"ft11mvc"];
    [self addAnimation:@"ft11dd%04d.png" animationName:@"ft11dd"];
    [self addAnimation:@"ft11at%04d.png" animationName:@"ft11at"];
}

- (void) initFoot12
{
    [self initAnimate:@"ft12"];
    [self addAnimation:@"ft12mvu%04d.png" animationName:@"ft12mvu"];
    [self addAnimation:@"ft12mvd%04d.png" animationName:@"ft12mvd"];
    [self addAnimation:@"ft12mvc%04d.png" animationName:@"ft12mvc"];
    [self addAnimation:@"ft12dd%04d.png" animationName:@"ft12dd"];
    [self addAnimation:@"ft12at%04d.png" animationName:@"ft12at"];
}

- (void) initFoot13
{
    [self initAnimate:@"ft13"];
    [self addAnimation:@"ft13mvu%04d.png" animationName:@"ft13mvu"];
    [self addAnimation:@"ft13mvd%04d.png" animationName:@"ft13mvd"];
    [self addAnimation:@"ft13mvc%04d.png" animationName:@"ft13mvc"];
    [self addAnimation:@"ft13dd%04d.png" animationName:@"ft13dd"];
    [self addAnimation:@"ft13at%04d.png" animationName:@"ft13at"];
}

- (void) initFoot14
{
    [self initAnimate:@"ft14"];
    [self addAnimation:@"ft14mvu%04d.png" animationName:@"ft14mvu"];
    [self addAnimation:@"ft14mvd%04d.png" animationName:@"ft14mvd"];
    [self addAnimation:@"ft14mvc%04d.png" animationName:@"ft14mvc"];
    [self addAnimation:@"ft14dd%04d.png" animationName:@"ft14dd"];
    [self addAnimation:@"ft14at%04d.png" animationName:@"ft14at"];
}

- (void) initFoot15
{
    [self initAnimate:@"ft15"];
    [self addAnimation:@"ft15mvu%04d.png" animationName:@"ft15mvu"];
    [self addAnimation:@"ft15mvd%04d.png" animationName:@"ft15mvd"];
    [self addAnimation:@"ft15mvc%04d.png" animationName:@"ft15mvc"];
    [self addAnimation:@"ft15dd%04d.png" animationName:@"ft15dd"];
    [self addAnimation:@"ft15at%04d.png" animationName:@"ft15at"];
}

- (void) initFoot16
{
    [self initAnimate:@"ft16"];
    [self addAnimation:@"ft16mvu%04d.png" animationName:@"ft16mvu"];
    [self addAnimation:@"ft16mvd%04d.png" animationName:@"ft16mvd"];
    [self addAnimation:@"ft16mvc%04d.png" animationName:@"ft16mvc"];
    [self addAnimation:@"ft16dd%04d.png" animationName:@"ft16dd"];
    [self addAnimation:@"ft16at%04d.png" animationName:@"ft16at"];
}

- (void) initDefenceTower01
{
    [self initAnimate:@"dt01"];
    [self addAnimation:@"dt01%04d.png" animationName:@"dt01"];
    [self initAnimate:@"dtf01"];
    [self addAnimation:@"dtf01mv%04d.png" animationName:@"dtf01mv"];
    [self addAnimation:@"dtf01dd%04d.png" animationName:@"dtf01dd"];
    [self addAnimation:@"dtf01at%04d.png" animationName:@"dtf01at"];
}

- (void) initDefenceTower02
{
    [self initAnimate:@"dt02"];
    [self addAnimation:@"dt02%04d.png" animationName:@"dt02"];
    [self initAnimate:@"dtf02"];
    [self addAnimation:@"dtf02mv%04d.png" animationName:@"dtf02mv"];
    [self addAnimation:@"dtf02dd%04d.png" animationName:@"dtf02dd"];
    [self addAnimation:@"dtf02at%04d.png" animationName:@"dtf02at"];
}

- (void) initDefenceTower03
{
    [self initAnimate:@"dt03"];
    [self addAnimation:@"dt03%04d.png" animationName:@"dt03"];
    [self initAnimate:@"dtf03"];
    [self addAnimation:@"dtf03mv%04d.png" animationName:@"dtf03mv"];
    [self addAnimation:@"dtf03dd%04d.png" animationName:@"dtf03dd"];
    [self addAnimation:@"dtf03at%04d.png" animationName:@"dtf03at"];
}

- (void) initTurretTower01
{
    [self initAnimate:@"tt01"];
    [self addAnimation:@"tt01b%04d.png" animationName:@"tt01b"];
    [self addAnimation:@"tt01a%04d.png" animationName:@"tt01a"];
}

- (void) initTurretTower02
{
    [self initAnimate:@"tt02"];
    [self addAnimation:@"tt02b%04d.png" animationName:@"tt02b"];
    [self addAnimation:@"tt02a%04d.png" animationName:@"tt02a"];
}

- (void) initTurretTower03
{
    [self initAnimate:@"tt03"];
    [self addAnimation:@"tt03b%04d.png" animationName:@"tt03b"];
    [self addAnimation:@"tt03a%04d.png" animationName:@"tt03a"];
}

- (void) initTurretBullet
{
    [self initAnimate:@"ttat"];
    [self addAnimation:@"ttat%04d.png" animationName:@"ttat"];
}

- (void) initMagicTower01
{
    [self initAnimate:@"mt01"];
    [self addAnimation:@"mt01%04d.png" animationName:@"mt01"];
}

- (void) initMagicTower02
{
    [self initAnimate:@"mt02"];
    [self addAnimation:@"mt02%04d.png" animationName:@"mt02"];
}

- (void) initMagicTower03
{
    [self initAnimate:@"mt03"];
    [self addAnimation:@"mt03%04d.png" animationName:@"mt03"];
}

- (void) initMagicFriendly01
{
    [self initAnimate:@"mcf01"];
    [self addAnimation:@"mcf01mv%04d.png" animationName:@"mcf01mv"];
    [self addAnimation:@"mcf01dd%04d.png" animationName:@"mcf01dd"];
    [self addAnimation:@"mcf01at%04d.png" animationName:@"mcf01at"];
}

- (void) initForeverFriendly01
{
//    [self initAnimate:@"fcf01"];
//    [self addAnimation:@"fcf01mv%04d.png" animationName:@"fcf01mv"];
//    [self addAnimation:@"fcf01dd%04d.png" animationName:@"fcf01dd"];
//    [self addAnimation:@"fcf01at%04d.png" animationName:@"fcf01at"];
}

- (void) initMagicFire
{
    [self initAnimate:@"mcfire"];
    [self addAnimation:@"firebu%04d.png" animationName:@"firebu"];
    [self addAnimation:@"fireeb%04d.png" animationName:@"fireeb"];
    [self addAnimation:@"fireef%04d.png" animationName:@"fireef"];
}

- (void) initMagicThunder
{
    [self initAnimate:@"mcthunder"];
    [self addAnimation:@"thunderbu%04d.png" animationName:@"thunderbu"];
}

- (void) initMagicStone
{
    [self initAnimate:@"mcstone"];
    [self addAnimation:@"stonebu%04d.png" animationName:@"stonebu"];
    [self addAnimation:@"stoneeb%04d.png" animationName:@"stoneeb"];
}

- (void) initAllEffect
{
    [self initAnimate:@"mcef"];
    [self addAnimation:@"mcef01%04d.png" animationName:@"mcef01"];
    [self addAnimation:@"mcef02%04d.png" animationName:@"mcef02"];
    [self addAnimation:@"mcef03%04d.png" animationName:@"mcef03"];
}

@end
