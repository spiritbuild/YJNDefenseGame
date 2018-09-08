#import "UpdataSence.h"
#import "SelectSence.h"
#import "SceneManager.h"
#import "SimpleAudioEngine.h"
#import "UpdateInfoList.h"
#import "ArchievementController.h"
#import "UpdateInfo.h"
#import "GnDataController.h"

@implementation UpdataSence

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	UpdataSence *layer = [UpdataSence node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        //初始化参数
        itemId = -1;
        gLock = NO;
       
        size = [[CCDirector sharedDirector] winSize];
        
        [self initSenceView:1];
	}
	return self;
}

-(void)initSenceView:(int) uId
{
    [self removeAllChildrenWithCleanup:YES];
    [self shiYingIphone5];
    
    //加载升级动画
    sjCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    [sjCache addSpriteFramesWithFile:@"SjSheet.plist"];
    sjSheet = [CCSpriteBatchNode batchNodeWithFile:@"SjSheet.png"];
    
    //加载背景图片
    bgImg = [CCSprite spriteWithFile:@"updataBg.png"];
    bgImg.position = CGPointMake(240 , size.height/2);
    bgImg.scale = 1;
    [self addChild:bgImg z:1];
    
    //加载tip图片
    tipImg = [CCSprite spriteWithFile:@"updataTip.png"];
    tipImg.position = CGPointMake(168 , 70);
    tipImg.scale = 1;
    [self addChild:tipImg z:2];
    
    //加载分数前缀
    scoreTip = [CCSprite spriteWithFile:@"jinBi.png"];
    scoreTip.position = CGPointMake(378 , 297);
    [self addChild:scoreTip z:2];
    
    //加载分数
    labelScore = [CCLabelTTF labelWithString:@"0" fontName:@"Helvetica-Bold" fontSize:25];
    labelScore.position = CGPointMake(390 ,297);
    labelScore.anchorPoint = CGPointMake(0 ,0.5);
    labelScore.color = ccc3(255, 204, 0);
    [self addChild: labelScore z:2];
    
    //加载选中动画
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"XzSheet.plist"];
    spritebatchXz = [CCSpriteBatchNode batchNodeWithFile:@"XzSheet.png"];
    [self addChild:spritebatchXz z:5];
    
    NSMutableArray *animFramesXz = [NSMutableArray array];
    for(int i = 1; i < 10; i++) {
        CCSpriteFrame *frameXz = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"1%04d.png",i]];
        if (i==1) {
            spriteXz = [[CCSprite alloc] initWithSpriteFrame:frameXz];
        }
        [animFramesXz addObject:frameXz];
    }
    animationXz = [CCAnimation animationWithName:@"Xz" frames:animFramesXz];
    [spritebatchXz addChild:spriteXz z:5];
    [spriteXz release];
    spriteXz.position = ccp(65,220);
    [spriteXz runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:1 animation:animationXz restoreOriginalFrame:NO] ]];
    
    //加载返回按钮
    btnBack = [[CCMenuItemImage alloc] initFromNormalImage:@"btnBack.png" selectedImage:@"btnBackDown.png" disabledImage:@"btnBack.png" target:self selector:@selector(goToSelectSence:)];		
    CCMenu *btnBackMenu = [CCMenu menuWithItems:btnBack, nil];
    btnBackMenu.position = CGPointMake(420 , 50);
    [self addChild:btnBackMenu z:2];
    
    //加载技能信息
    NSMutableArray *updataInfoArray = [UpdateInfoList getAllUpdateInfo];
    
    NSMutableArray *values;
    UpdateInfo *updateInfo;
    CCMenuItemImage *btnItem;
    CCSprite *jnXingBg;
    CCSprite *jnXing;
    
    for (int i = 0; i<[updataInfoArray count]; i++) {
        values = [updataInfoArray objectAtIndex:i];
        updateInfo = [[[UpdateInfo alloc] init] autorelease];
        updateInfo.Update_Info_ID = [[values objectAtIndex:0] intValue];
        updateInfo.Level = [[values objectAtIndex:1] intValue];
        updateInfo.PictureName = [values objectAtIndex:2];
        updateInfo.Position = [values objectAtIndex:3];
        updateInfo.Explain2 = [values objectAtIndex:4];
        updateInfo.Explain3 = [values objectAtIndex:5];
        
        jnXingBg = [CCSprite spriteWithFile:@"jnXingBg.png"];
        jnXingBg.position = CGPointMake(CGPointFromString(updateInfo.Position).x, CGPointFromString(updateInfo.Position).y - 30);
        jnXingBg.scale = 1;
        [self addChild:jnXingBg z:3];
        
        int width = -12;
        for (int j=1; j<=updateInfo.Level; j++) {
            jnXing = [CCSprite spriteWithFile:@"jnXing.png"];
            jnXing.position = CGPointMake(CGPointFromString(updateInfo.Position).x + width, CGPointFromString(updateInfo.Position).y - 29);
            [self addChild:jnXing z:4];
            width = width + 12;
        }
        width = -12;
        
        btnItem = [[CCMenuItemImage alloc] initFromNormalImage:updateInfo.PictureName selectedImage:updateInfo.PictureName disabledImage:updateInfo.PictureName target:self  selector:@selector(updataJN:)];
        btnItem.tag = updateInfo.Update_Info_ID;
        CCMenu *btnItemMenu = [CCMenu menuWithItems:btnItem, nil];
        btnItemMenu.position = CGPointFromString(updateInfo.Position);
        [self addChild:btnItemMenu z:2];
        [btnItem release];
    }
    
    //加载分数读取数据
    int scoreVal = [GnDataController getGameScore];
    [labelScore setString:[NSString stringWithFormat:@"%d",scoreVal]];
    
    //加载升级按钮
    btnUpdata = [[CCMenuItemImage alloc] initFromNormalImage:@"btnUpdateLv.png" selectedImage:@"btnUpdateLvDown.png" disabledImage:@"btnUpdataHui.png" target:self selector:@selector(updataLevel:)];		
    CCMenu *btnUpdataMenu = [CCMenu menuWithItems:btnUpdata, nil];
    btnUpdataMenu.position = CGPointMake(340 , 50);
    btnUpdata.visible = NO;
    [self addChild:btnUpdataMenu z:2];
    
    gLock = NO;
    [self updataJnById:uId];
}

-(void) goToSelectSence:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransZoomFlipX:0.56f layer:[SelectSence node]]];
}

-(void) updataLevel:(id) sender 
{
    if (gLock == YES) {
        return;
    }
    else{
        [[SimpleAudioEngine sharedEngine] playEffect:@"shengJi.wav"];
        int scoreVal = [GnDataController getGameScore];
        if(scoreVal <=0 )
        {
            [labelScore runAction:[CCBlink actionWithDuration:0.5 blinks:2]];
            return;
        }
        
        UpdateInfo *uInfo = [UpdateInfoList getUpdateInfo:itemId];
        int level = uInfo.Level;
        level++;
        [UpdateInfoList setLevel:itemId Value:level];
        [ArchievementController hasArchievement11];
        //加载分数读取数据
        scoreVal = [GnDataController getGameScore];
        [labelScore setString:[NSString stringWithFormat:@"%d",scoreVal]];
        
        CGPoint itemPo = CGPointFromString(uInfo.Position);
        spriteXz.position = CGPointMake(itemPo.x, itemPo.y - 9);
        
//        ////刷新升级页面
//        NSString *picUrl = uInfo.PictureName; 
//        NSString *Explain2 = uInfo.Explain2;
//        NSString *Explain3 = uInfo.Explain3;
//        NSString *Explain;
              
//        [self removeChild:itemIcon cleanup:NO];
//        [self removeChild:labelLevel cleanup:NO];
//        [self removeChild:labelExplain cleanup:NO];
        
        //加载升级动画
//        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"SjSheet.plist"];
//        spritebatchSj = [CCSpriteBatchNode batchNodeWithFile:@"SjSheet.png"];
//        [self addChild:spritebatchSj z:10];
//        
//        NSMutableArray *animFramesSj = [NSMutableArray array];
//        for(int i = 1; i < 10; i++) {
//            CCSpriteFrame *frameSj = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"1%04d.png",i]];
//            if (i==1) {
//                spriteSj = [[CCSprite alloc] initWithSpriteFrame:frameSj];
//            }
//            [animFramesSj addObject:frameSj];
//        }
//        animationSj = [CCAnimation animationWithName:@"Sj" frames:animFramesSj];
//        [spritebatchSj addChild:spriteSj];
//        [spriteSj release];
//        spriteSj.position = itemPo;
//        [spriteSj runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:1 animation:animationSj  restoreOriginalFrame:NO]]];
        
//        //加载默认的图标
//        itemIcon = [CCSprite spriteWithFile:picUrl];
//        itemIcon.position = CGPointMake(70 , 70);
//        itemIcon.scale = 0.75;
//        [self addChild:itemIcon z:2];
//        //加载等级
//        labelLevel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Level:%d/3", level] fontName:@"Helvetica-Bold" fontSize:22];
//        labelLevel.position = CGPointMake(315 ,95);
//        labelLevel.anchorPoint = CGPointMake(0 ,0.5);
//        labelLevel.color = ccc3(255, 204, 0);
//        labelLevel.visible = NO;
//        [self addChild: labelLevel z:2];
//        if (level == 1) {
//            Explain = Explain2;
//        }
//        else if (level == 2){
//            Explain = Explain3; 
//        }
//        else{
//            Explain = @"This is Max Level,can't update!"; 
//        }
//        
//        //加载介绍
//        labelExplain = [CCLabelTTF labelWithString:Explain dimensions:CGSizeMake(200,100) alignment:UITextAlignmentLeft fontName:@"Helvetica-Bold" fontSize:16];
//        //[CCLabelTTF labelWithString:Explain dimensions:CGSizeMake(300,300) fontName:@"Marker Felt" fontSize:18];
//        labelExplain.position = CGPointMake(100 ,50);
//        labelExplain.color = ccc3(255, 204, 0);
//        labelExplain.anchorPoint = CGPointMake(0 ,0.5);
//        [self addChild: labelExplain z:2];
//        
//        btnUpdata.visible = YES;
//        if (level == 3) {
//            btnUpdata.isEnabled = NO;
//        }
//        else{
//            btnUpdata.isEnabled = YES;
//        }     
        
        gLock = YES;
        btnUpdata.isEnabled = NO;
        
        NSMutableArray *animArray = [NSMutableArray array];
        CCSpriteFrame *frame = nil;
        int i = 1;
        do {
            frame = [sjCache spriteFrameByName:[NSString stringWithFormat:@"sj1%04d.png", i]];
            if (i==1) {
                spriteSj = [[CCSprite alloc] initWithSpriteFrame:frame];
            }
            i++;
            if (frame != nil) {
                [animArray addObject:frame];
            }
        } while (frame != nil);
        if ([animArray count] == 0) {
            [NSString stringWithFormat:@" animate is fail"];
        }
        CCAnimation *anim = [CCAnimation animationWithFrames:animArray delay:0.05f];
        [anim setName:@"sj"];
        
        spriteSj.position = itemPo;
        spriteSj.scale = 1;
        [self addChild:spriteSj z:10];
        
        id actionSj = [CCAnimate actionWithAnimation:anim restoreOriginalFrame:NO];
        id actionSjDone = [CCCallFuncN actionWithTarget:self selector:@selector(afterSj:)];
        
        [spriteSj runAction:[CCSequence actions:actionSj, actionSjDone, nil]];
        anim = nil;
        [anim release];
        [spriteSj release];
    }
}

-(void)afterSj:(id)sender {
    [self initSenceView:itemId];
}

-(void) clearSj
{
//    [self removeChild:spritebatchSj cleanup:NO];
//    [self removeChild:spriteSj cleanup:NO];
    [self initSenceView:itemId];
    
    //[self removeChild:animationSj cleanup:NO];
}

-(void) updataJnById:(int) jnId
{
    if (gLock == YES) {
        return;
    }
    
    int intId = jnId;
    itemId = intId;
    
    UpdateInfo *uInfo = [UpdateInfoList getUpdateInfo:itemId];
    int level = uInfo.Level;
    NSString *picUrl = uInfo.PictureName; 
    NSString *Explain2 = uInfo.Explain2;
    NSString *Explain3 = uInfo.Explain3;
    NSString *Explain;

    CGPoint itemPo = CGPointFromString(uInfo.Position);
    spriteXz.position = CGPointMake(itemPo.x, itemPo.y - 9);
    //spriteSj.position = itemPo;
    
    [self removeChild:itemIcon cleanup:NO];
    [self removeChild:labelLevel cleanup:NO];
    [self removeChild:labelExplain cleanup:NO];
    
    //加载默认的图标
    itemIcon = [CCSprite spriteWithFile:picUrl];
    itemIcon.position = CGPointMake(65 , 70);
    itemIcon.scale = 0.75;
    [self addChild:itemIcon z:2];
    
    //加载等级
//    labelLevel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Level:%d/3", level] fontName:@"Helvetica-Bold" fontSize:22];
//    labelLevel.position = CGPointMake(315 ,95);
//    labelLevel.anchorPoint = CGPointMake(0 ,0.5);
//    labelLevel.color = ccc3(255, 204, 0);
//    labelLevel.visible = NO;
//    [self addChild: labelLevel z:2];
    
    if (level == 1) {
        Explain = Explain2;
    }
    else if (level == 2){
        Explain = Explain3; 
    }
    else{
        Explain = @"This is Max Level,can't update!"; 
    }
    
    //加载介绍
    labelExplain = [CCLabelTTF labelWithString:Explain dimensions:CGSizeMake(200,100) alignment:UITextAlignmentLeft fontName:@"Helvetica-Bold" fontSize:16];
    //[CCLabelTTF labelWithString:Explain dimensions:CGSizeMake(300,300) fontName:@"Marker Felt" fontSize:18];
    labelExplain.position = CGPointMake(90 ,50);
    labelExplain.anchorPoint = CGPointMake(0 ,0.5);
    labelExplain.color = ccc3(255, 204, 0);
    [self addChild: labelExplain z:2];
    
    btnUpdata.visible = YES;
    
    if (level == 3) {
        btnUpdata.isEnabled = NO;
    }
    else{
        btnUpdata.isEnabled = YES;
    }
}

-(void) updataJN:(id) sender 
{
    if (gLock == YES) {
        return;
    }
    CCMenuItemImage *button = sender;
    int intId = button.tag;
    itemId = intId;
    [self updataJnById:intId];  
}

-(void)shiYingIphone5
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    if (size.width == 568) {
        CCSprite *i5Img = [CCSprite spriteWithFile:@"i5Bg.png"];
        i5Img.position = CGPointMake(240 , size.height/2);
        i5Img.scale = 1;
        [self addChild:i5Img z:1];
        self.position = ccp(self.position.x + 44, self.position.y);
    }
}

- (void) dealloc
{
	[super dealloc];
}

@end
