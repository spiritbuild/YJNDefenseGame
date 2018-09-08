#import "SpriteInfoScene.h"


@implementation SpriteInfoScene

-(id) init
{
	if( (self=[super init])) {
        [self shiYingIphone5];
        [self initTowerInfo];
        [self initDefenceTowerInfo];
        [self initEnemyInfo];
        [self initFriendlyInfo];
        [self initFlyEnemyInfo];
        [self initMagicFriendlyInfo];
	}
	return self;
}

- (void) initTowerInfo {
    _towerInfo = [[CCSprite spriteWithFile:@"shuZhiBg.png"] retain];
    _towerInfo.position = ccp(291,19);
    
    //缩略图
    CCSprite *spSmall = [CCSprite node];
    CCDirector *director = [CCDirector sharedDirector];
    if([director enableRetinaDisplay:YES])
    {
        spSmall.position = ccp(30, -15);
    }
    else{
        spSmall.position = ccp(30, 5);
    }
    spSmall.anchorPoint = ccp(0.5, 0);
    spSmall.scale = 0.8;
    [_towerInfo addChild:spSmall z:1 tag:1];
    
    //攻击提示图
    CCSprite *attactTip = [CCSprite spriteWithFile:@"gongJiTip.png"];
    attactTip.position = ccp(70, 10);
    attactTip.anchorPoint = ccp(0.5, 0);
    attactTip.scale = 1;
    [_towerInfo addChild:attactTip z:1];
    
    //攻击数值
    CCLabelTTF *attactNum = [CCLabelTTF labelWithString:@"1" fontName:@"Helvetica-Bold" fontSize:11];
    attactNum.position = ccp(90, 12);
    attactNum.anchorPoint = ccp(0.5, 0);
    attactNum.scale = 1;
    [_towerInfo addChild:attactNum z:1 tag:10];
    
    //攻击速度提示图
    CCSprite *attactSpeedTip = [CCSprite spriteWithFile:@"pingLvTip.png"];
    attactSpeedTip.position = ccp(120, 10);
    attactSpeedTip.anchorPoint = ccp(0.5, 0);
    attactSpeedTip.scale = 1;
    [_towerInfo addChild:attactSpeedTip z:1];
    
    //攻击速度
    CCLabelTTF *attactSpeedNum = [CCLabelTTF labelWithString:@"1" fontName:@"Helvetica-Bold" fontSize:12];
    attactSpeedNum.position = ccp(140, 12);
    attactSpeedNum.anchorPoint = ccp(0.5, 0);
    attactSpeedNum.scale = 1;
    [_towerInfo addChild:attactSpeedNum z:1 tag:11];
}

- (void) initDefenceTowerInfo {
    _defenceTowerInfo = [[CCSprite spriteWithFile:@"shuZhiBgDuan.png"] retain];
    _defenceTowerInfo.position = ccp(265,19);
    
    //缩略图
    CCSprite *spSmall = [CCSprite node];
    CCDirector *director = [CCDirector sharedDirector];
    if([director enableRetinaDisplay:YES])
    {
        spSmall.position = ccp(30, -12);
    }
    else{
        spSmall.position = ccp(30, 8);
    }
    spSmall.anchorPoint = ccp(0.5, 0);
    spSmall.scale = 0.9;
    [_defenceTowerInfo addChild:spSmall z:1 tag:1];
    
    //友军提示图
    CCSprite *friendlyTip = [CCSprite spriteWithFile:@"xueTip.png"];
    friendlyTip.position = ccp(60, 10);
    friendlyTip.anchorPoint = ccp(0.5, 0);
    friendlyTip.scale = 0.9;
    [_defenceTowerInfo addChild:friendlyTip z:1];
	
    //友军数值
    CCLabelTTF *friendlyNum = [CCLabelTTF labelWithString:@"1" fontName:@"Helvetica-Bold" fontSize:11];
    friendlyNum.position = ccp(80, 12);
    friendlyNum.anchorPoint = ccp(0.5, 0);
    friendlyNum.scale = 1;
    [_defenceTowerInfo addChild:friendlyNum z:1 tag:15];
}

- (void) initEnemyInfo {
    _enemyInfo = [[CCSprite spriteWithFile:@"shuZhiBg.png"] retain];
    _enemyInfo.position = ccp(245,19);
    
    //缩略图
    CCSprite *spSmall = [CCSprite node];
    CCDirector *director = [CCDirector sharedDirector];
    if([director enableRetinaDisplay:YES])
    {
        spSmall.position = ccp(30, -12);
    }
    else{
        spSmall.position = ccp(30, 8);
    }
    spSmall.anchorPoint = ccp(0.5, 0);
    spSmall.scale = 0.8;
    [_enemyInfo addChild:spSmall z:1 tag:1];
    
    //攻击提示图
    CCSprite *attactTip = [CCSprite spriteWithFile:@"gongJiTip.png"];
    attactTip.position = ccp(50, 10);
    attactTip.anchorPoint = ccp(0.5, 0);
    attactTip.scale = 1;
    [_enemyInfo addChild:attactTip z:1];
    
    //攻击数值
    CCLabelTTF *attactNum = [CCLabelTTF labelWithString:@"1" fontName:@"Helvetica-Bold" fontSize:11];
    attactNum.position = ccp(70, 12);
    attactNum.anchorPoint = ccp(0.5, 0);
    attactNum.scale = 1;
    [_enemyInfo addChild:attactNum z:1 tag:10];
    
    //血值提示图
    CCSprite *bloodTip = [CCSprite spriteWithFile:@"xueTip.png"];
    bloodTip.position = ccp(90, 10);
    bloodTip.anchorPoint = ccp(0.5, 0);
    bloodTip.scale = 0.8;
    [_enemyInfo addChild:bloodTip z:1];
    
    //血值数值
    CCLabelTTF *bloodNum = [CCLabelTTF labelWithString:@"1" fontName:@"Helvetica-Bold" fontSize:11];
    bloodNum.position = ccp(110, 12);
    bloodNum.anchorPoint = ccp(0.5, 0);
    bloodNum.scale = 1;
    [_enemyInfo addChild:bloodNum z:1 tag:12];
    
    //移动速度提示图
    CCSprite *speedTip = [CCSprite spriteWithFile:@"pingLvTip.png"];
    speedTip.position = ccp(130, 10);
    speedTip.anchorPoint = ccp(0.5, 0);
    speedTip.scale = 1;
    [_enemyInfo addChild:speedTip z:1];
    
    //移动速度
    CCLabelTTF *speedNum = [CCLabelTTF labelWithString:@"1" fontName:@"Helvetica-Bold" fontSize:11];
    speedNum.position = ccp(150, 12);
    speedNum.anchorPoint = ccp(0.5, 0);
    speedNum.scale = 1;
    [_enemyInfo addChild:speedNum z:1 tag:13];
}

- (void) initFriendlyInfo {
    _friendlyInfo = [[CCSprite spriteWithFile:@"shuZhiBg.png"] retain];
    _friendlyInfo.position = ccp(245,19);

    //缩略图
    CCSprite *spSmall = [CCSprite node];
    CCDirector *director = [CCDirector sharedDirector];
    if([director enableRetinaDisplay:YES])
    {
        spSmall.position = ccp(30, -12);
    }
    else{
        spSmall.position = ccp(30, 8);
    }
    spSmall.anchorPoint = ccp(0.5, 0);
    spSmall.scale = 0.8;
    [_friendlyInfo addChild:spSmall z:1 tag:1];
    
    //攻击提示图
    CCSprite *attactTip = [CCSprite spriteWithFile:@"gongJiTip.png"];
    attactTip.position = ccp(50, 10);
    attactTip.anchorPoint = ccp(0.5, 0);
    attactTip.scale = 1;
    [_friendlyInfo addChild:attactTip z:1];
    
    //攻击数值
    CCLabelTTF *attactNum = [CCLabelTTF labelWithString:@"1" fontName:@"Helvetica-Bold" fontSize:11];
    attactNum.position = ccp(70, 12);
    attactNum.anchorPoint = ccp(0.5, 0);
    attactNum.scale = 1;
    [_friendlyInfo addChild:attactNum z:1 tag:10];
    
    //血值提示图
    CCSprite *bloodTip = [CCSprite spriteWithFile:@"xueTip.png"];
    bloodTip.position = ccp(90, 10);
    bloodTip.anchorPoint = ccp(0.5, 0);
    bloodTip.scale = 0.9;
    [_friendlyInfo addChild:bloodTip z:1];
    
    //血值数值
    CCLabelTTF *bloodNum = [CCLabelTTF labelWithString:@"1" fontName:@"Helvetica-Bold" fontSize:11];
    bloodNum.position = ccp(110, 12);
    bloodNum.anchorPoint = ccp(0.5, 0);
    bloodNum.scale = 1;
    [_friendlyInfo addChild:bloodNum z:1 tag:12];
}

- (void) initFlyEnemyInfo {
    _flyEnemyInfo = [[CCSprite spriteWithFile:@"shuZhiBg.png"] retain];
    _flyEnemyInfo.position = ccp(245,19);
    
    //缩略图
    CCSprite *spSmall = [CCSprite node];
    CCDirector *director = [CCDirector sharedDirector];
    if([director enableRetinaDisplay:YES])
    {
        spSmall.position = ccp(30, -12);
    }
    else{
        spSmall.position = ccp(30, 8);
    }
    spSmall.anchorPoint = ccp(0.5, 0);
    spSmall.scale = 0.8;
    [_flyEnemyInfo addChild:spSmall z:1 tag:1];
    
    //攻击提示图
    CCSprite *attactTip = [CCSprite spriteWithFile:@"gongJiTip.png"];
    attactTip.position = ccp(50, 10);
    attactTip.anchorPoint = ccp(0.5, 0);
    attactTip.scale = 1;
    [_flyEnemyInfo addChild:attactTip z:1];
    
    //攻击数值
    CCLabelTTF *attactNum = [CCLabelTTF labelWithString:@"0" fontName:@"Helvetica-Bold" fontSize:11];
    attactNum.position = ccp(70, 12);
    attactNum.anchorPoint = ccp(0.5, 0);
    attactNum.scale = 1;
    [_flyEnemyInfo addChild:attactNum z:1];
    
    //血值提示图
    CCSprite *bloodTip = [CCSprite spriteWithFile:@"xueTip.png"];
    bloodTip.position = ccp(90, 10);
    bloodTip.anchorPoint = ccp(0.5, 0);
    bloodTip.scale = 0.9;
    [_flyEnemyInfo addChild:bloodTip z:1];
    
    //血值数值
    CCLabelTTF *bloodNum = [CCLabelTTF labelWithString:@"1" fontName:@"Helvetica-Bold" fontSize:11];
    bloodNum.position = ccp(110, 12);
    bloodNum.anchorPoint = ccp(0.5, 0);
    bloodNum.scale = 1;
    [_flyEnemyInfo addChild:bloodNum z:1 tag:12];
    
    //移动速度提示图
    CCSprite *speedTip = [CCSprite spriteWithFile:@"pingLvTip.png"];
    speedTip.position = ccp(130, 10);
    speedTip.anchorPoint = ccp(0.5, 0);
    speedTip.scale = 1;
    [_flyEnemyInfo addChild:speedTip z:1];
    
    //移动速度
    CCLabelTTF *speedNum = [CCLabelTTF labelWithString:@"1" fontName:@"Helvetica-Bold" fontSize:11];
    speedNum.position = ccp(150, 12);
    speedNum.anchorPoint = ccp(0.5, 0);
    speedNum.scale = 1;
    [_flyEnemyInfo addChild:speedNum z:1 tag:13];
}

- (void) initMagicFriendlyInfo {
    _magicFriendlyInfo = [[CCSprite spriteWithFile:@"shuZhiBg.png"] retain];
    _magicFriendlyInfo.position = ccp(245,19);
    
    //缩略图
    CCSprite *spSmall = [CCSprite node];
    CCDirector *director = [CCDirector sharedDirector];
    if([director enableRetinaDisplay:YES])
    {
        spSmall.position = ccp(30, -12);
    }
    else{
        spSmall.position = ccp(30, 8);
    }
    spSmall.anchorPoint = ccp(0.5, 0);
    spSmall.scale = 0.8;
    [_magicFriendlyInfo addChild:spSmall z:1 tag:1];
    
    //攻击提示图
    CCSprite *attactTip = [CCSprite spriteWithFile:@"gongJiTip.png"];
    attactTip.position = ccp(50, 10);
    attactTip.anchorPoint = ccp(0.5, 0);
    attactTip.scale = 1;
    [_magicFriendlyInfo addChild:attactTip z:1];
    
    //攻击数值
    CCLabelTTF *attactNum = [CCLabelTTF labelWithString:@"1" fontName:@"Helvetica-Bold" fontSize:11];
    attactNum.position = ccp(70, 12);
    attactNum.anchorPoint = ccp(0.5, 0);
    attactNum.scale = 1;
    [_magicFriendlyInfo addChild:attactNum z:1 tag:10];
    
    //血值提示图
    CCSprite *bloodTip = [CCSprite spriteWithFile:@"xueTip.png"];
    bloodTip.position = ccp(90, 10);
    bloodTip.anchorPoint = ccp(0.5, 0);
    bloodTip.scale = 0.9;
    [_magicFriendlyInfo addChild:bloodTip z:1];
    
    //血值数值
    CCLabelTTF *bloodNum = [CCLabelTTF labelWithString:@"1" fontName:@"Helvetica-Bold" fontSize:11];
    bloodNum.position = ccp(110, 12);
    bloodNum.anchorPoint = ccp(0.5, 0);
    bloodNum.scale = 1;
    [_magicFriendlyInfo addChild:bloodNum z:1 tag:12];

    //时间提示图
    CCSprite *liveTip = [CCSprite spriteWithFile:@"wavesTip.png"];
    liveTip.position = ccp(130, 10);
    liveTip.anchorPoint = ccp(0.5, 0);
    liveTip.scale = 1;
    [_magicFriendlyInfo addChild:liveTip z:1];
    
    //时间
    CCLabelTTF *liveNum = [CCLabelTTF labelWithString:@"1" fontName:@"Helvetica-Bold" fontSize:11];
    liveNum.position = ccp(150, 12);
    liveNum.anchorPoint = ccp(0.5, 0);
    liveNum.scale = 1;
    [_magicFriendlyInfo addChild:liveNum z:1 tag:16];
}

- (void) showTowerInfo {
    [self removeAllChildrenWithCleanup:YES];
    [self addChild:_towerInfo z:1 tag:1];
}

- (void) showDefenceTowerInfo {
    [self removeAllChildrenWithCleanup:YES];
    [self addChild:_defenceTowerInfo z:1 tag:1];
}

- (void) showEnemyInfo {
    [self removeAllChildrenWithCleanup:YES];
    [self addChild:_enemyInfo z:1 tag:1];
}

- (void) showFriendlyInfo {
    [self removeAllChildrenWithCleanup:YES];
    [self addChild:_friendlyInfo z:1 tag:1];
}

- (void) showFlyEnemyInfo {
    [self removeAllChildrenWithCleanup:YES];
    [self addChild:_flyEnemyInfo z:1 tag:1];
}

- (void) showMagicFriendlyInfo {
    [self removeAllChildrenWithCleanup:YES];
    [self addChild:_magicFriendlyInfo z:1 tag:1];
}

- (void) setSmallPic:(NSString*)name {
    CCNode *node = [self getChildByTag:1];
    if (node) {
        CCNode *child = [node getChildByTag:1];
        if (child && [child isKindOfClass:[CCSprite class]]) {
            CCSprite *sprite = (CCSprite*) child;
            CCTexture2D *texture2D = [[CCTextureCache sharedTextureCache] addImage:name];
            CCSpriteFrame *spriteFrame = [CCSpriteFrame frameWithTexture:texture2D rect:CGRectMake(0, 0, texture2D.contentSizeInPixels.width, texture2D.contentSizeInPixels.height)];
            [sprite setDisplayFrame:spriteFrame];
        }
    }
}

- (void) setAttact:(int)attact {
    CCNode *node = [self getChildByTag:1];
    if (node) {
        CCNode *child = [node getChildByTag:10];
        if (child && [child isKindOfClass:[CCLabelTTF class]]) {
            CCLabelTTF *sprite = (CCLabelTTF*) child;
            [sprite setString:[NSString stringWithFormat:@"%d", attact]];
        }
    }
}

- (void) setAttactSpeed:(float)attactSpeed {
    CCNode *node = [self getChildByTag:1];
    if (node) {
        CCNode *child = [node getChildByTag:11];
        if (child && [child isKindOfClass:[CCLabelTTF class]]) {
            CCLabelTTF *sprite = (CCLabelTTF*) child;
            [sprite setString:[NSString stringWithFormat:@"%.1f", attactSpeed]];
        }
    }
}

- (void) setBloodNum:(int)bloodNum {
    CCNode *node = [self getChildByTag:1];
    if (node) {
        CCNode *child = [node getChildByTag:12];
        if (child && [child isKindOfClass:[CCLabelTTF class]]) {
            CCLabelTTF *sprite = (CCLabelTTF*) child;
            [sprite setString:[NSString stringWithFormat:@"%d", bloodNum]];
        }
    }
}

- (void) setMoveSpeed:(int)moveSpeed {
    CCNode *node = [self getChildByTag:1];
    if (node) {
        CCNode *child = [node getChildByTag:13];
        if (child && [child isKindOfClass:[CCLabelTTF class]]) {
            CCLabelTTF *sprite = (CCLabelTTF*) child;
            [sprite setString:[NSString stringWithFormat:@"%d", moveSpeed]];
        }
    }
}

- (void) setFriendlyNum:(int)friendlyNum {
    CCNode *node = [self getChildByTag:1];
    if (node) {
        CCNode *child = [node getChildByTag:15];
        if (child && [child isKindOfClass:[CCLabelTTF class]]) {
            CCLabelTTF *sprite = (CCLabelTTF*) child;
            [sprite setString:[NSString stringWithFormat:@"%d", friendlyNum]];
        }
    }
}

- (void) setLiveTime:(int)liveTime {
    CCNode *node = [self getChildByTag:1];
    if (node) {
        CCNode *child = [node getChildByTag:16];
        if (child && [child isKindOfClass:[CCLabelTTF class]]) {
            CCLabelTTF *sprite = (CCLabelTTF*) child;
            [sprite setString:[NSString stringWithFormat:@"%d", liveTime]];
        }
    }
}

-(void)shiYingIphone5
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    if (size.width == 568) {
        self.position = ccp(self.position.x + 44, self.position.y);
    }
}

- (void) dealloc {
    [_towerInfo release];
    [_defenceTowerInfo release];
    [_enemyInfo release];
    [_friendlyInfo release];
    [_flyEnemyInfo release];
    [_magicFriendlyInfo release];
    [super dealloc];
}

@end
