#import "SelectSence.h"
#import "MainMenuSence.h"
#import "UpdataSence.h"
#import "SceneManager.h"
#import "GameBackgroundScene.h"
#import "LoadingSence.h"
#import "SimpleAudioEngine.h"
#import "GamePointList.h"
#import "GamePoint.h"
#import "GnDataController.h"

@implementation SelectSence

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	SelectSence *layer = [SelectSence node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
		//初始化参数
		intJN001 = 10;
		intJN002 = 10;
		guanKa = 0;
        [self shiYingIphone5];
		
        CGSize size = [[CCDirector sharedDirector] winSize];
        //加载背景图片
        bgImg = [CCSprite spriteWithFile:@"selectWaveBg.png"];
		bgImg.position = CGPointMake(240 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
        
        resetBg = [CCSprite spriteWithFile:@"resetBg.png"];
		resetBg.position = CGPointMake(240 , size.height/2);
		resetBg.scale = 1;
        resetBg.visible = NO;
		[self addChild:resetBg z:100];
		
		//加载魔法背景图片
        btnWaveStationLight = [CCSprite spriteWithFile:@"waveStationLight.png"];
		btnWaveStationLight.position = CGPointMake(240 , size.height/2);
		btnWaveStationLight.scale = 1;
        btnWaveStationLight.visible = NO;
		[self addChild:btnWaveStationLight z:5];
        
        //加载魔法背景图片
        selectMagicBg = [CCSprite spriteWithFile:@"selectMagicBg.png"];
		selectMagicBg.position = CGPointMake(240 , size.height/2);
		selectMagicBg.scale = 1;
		[self addChild:selectMagicBg z:13];
        
        //加载透明按钮
        btnTouMing = [[CCMenuItemImage alloc] initFromNormalImage:@"touMingBg.png" selectedImage:@"touMingBg.png" disabledImage:@"touMingBg.png" target:self selector:@selector(doNothing:)];		
        CCMenu *btnTouMingMenu = [CCMenu menuWithItems:btnTouMing, nil];
		btnTouMingMenu.position = CGPointMake(240 , size.height/2);
        btnTouMing.visible = NO;
		[self addChild:btnTouMingMenu z:3];
		[btnTouMing release];
		
		//加载技能1按钮
		btnJN001 = [[CCMenuItemImage alloc] initFromNormalImage:@"jN001.png" selectedImage:@"jN001.png" disabledImage:@"jN001Hui.png" target:self selector:@selector(addJn:)];		
        CCMenu *btnJN001Menu = [CCMenu menuWithItems:btnJN001, nil];
		btnJN001Menu.position = CGPointMake(144 , 175);
		btnJN001.tag = 1;
		[self addChild:btnJN001Menu z:14];
		[btnJN001 release];
		
		//加载技能2按钮
		btnJN002 = [[CCMenuItemImage alloc] initFromNormalImage:@"jN002.png" selectedImage:@"jN002.png" disabledImage:@"jN002Hui.png" target:self selector:@selector(addJn:)];		
        CCMenu *btnJN002Menu = [CCMenu menuWithItems:btnJN002, nil];
		btnJN002Menu.position = CGPointMake(215 , 175);
		btnJN002.tag = 2;
		[self addChild:btnJN002Menu z:14];
		[btnJN002 release];
		
		//加载技能3按钮
		btnJN003 = [[CCMenuItemImage alloc] initFromNormalImage:@"jN003.png" selectedImage:@"jN003.png" disabledImage:@"jN003Hui.png" target:self selector:@selector(addJn:)];		
        CCMenu *btnJN003Menu = [CCMenu menuWithItems:btnJN003, nil];
		btnJN003Menu.position = CGPointMake(286 , 175);
		btnJN003.tag = 3;
		[self addChild:btnJN003Menu z:14];
		[btnJN003 release];
		
		//加载技能4按钮
		btnJN004 = [[CCMenuItemImage alloc] initFromNormalImage:@"jN004.png" selectedImage:@"jN004.png" disabledImage:@"jN004Hui.png" target:self selector:@selector(addJn:)];		
        CCMenu *btnJN004Menu = [CCMenu menuWithItems:btnJN004, nil];
		btnJN004Menu.position = CGPointMake(357 , 175);
		btnJN004.tag = 4;
		[self addChild:btnJN004Menu z:14];
		[btnJN004 release];
		
		//加载技能1边框按钮
		btnselectJn1 = [[CCMenuItemImage alloc] initFromNormalImage:@"selectJn.png" selectedImage:@"selectJn.png" disabledImage:@"selectJn.png" target:self selector:@selector(removeJn1:)];		
        CCMenu *btnselectJn1Menu = [CCMenu menuWithItems:btnselectJn1, nil];
		btnselectJn1Menu.position = CGPointMake(145 , 113);
		[self addChild:btnselectJn1Menu z:14];
		[btnselectJn1 release];
		
		//加载技能2边框按钮
		btnselectJn2 = [[CCMenuItemImage alloc] initFromNormalImage:@"selectJn.png" selectedImage:@"selectJn.png" disabledImage:@"selectJn.png" target:self selector:@selector(removeJn2:)];		
        CCMenu *btnselectJn2Menu = [CCMenu menuWithItems:btnselectJn2, nil];
		btnselectJn2Menu.position = CGPointMake(217 , 113);
		[self addChild:btnselectJn2Menu z:14];
		[btnselectJn2 release];
		
        //加载关闭按钮
		btnClose = [[CCMenuItemImage alloc] initFromNormalImage:@"close.png" selectedImage:@"closeDown.png" disabledImage:@"close.png" target:self selector:@selector(closeMagic:)];		
        CCMenu *btnCloseMenu = [CCMenu menuWithItems:btnClose, nil];
		btnCloseMenu.position = CGPointMake(385 , 230);
		[self addChild:btnCloseMenu z:15];
        btnClose.visible = NO;
		[btnClose release];
        
		//加载开始 按钮
		btnPlay = [[CCMenuItemImage alloc] initFromNormalImage:@"btnPlayGame.png" selectedImage:@"btnPlayGamedown.png" disabledImage:@"btnPlayGameHui.png" target:self selector:@selector(goToLoadingSence:)];		
        CCMenu *btnPlayMenu = [CCMenu menuWithItems:btnPlay, nil];
		btnPlayMenu.position = CGPointMake(322 , 93);
		[self addChild:btnPlayMenu z:14];
		btnPlay.isEnabled = NO;
        btnPlay.scale = 0.8;
		[btnPlay release];
        
        //加载返回按钮
		btnBack = [[CCMenuItemImage alloc] initFromNormalImage:@"btnBack.png" selectedImage:@"btnBackDown.png" disabledImage:@"btnBack.png" target:self selector:@selector(goToMainMenuSence:)];		
        CCMenu *btnBackMenu = [CCMenu menuWithItems:btnBack, nil];
		btnBackMenu.position = CGPointMake(430 , 25);
		[self addChild:btnBackMenu z:2];
		[btnBack release];
        
        //加载升级按钮
		btnUpdata = [[CCMenuItemImage alloc] initFromNormalImage:@"btnUpdate.png" selectedImage:@"btnUpdateDown.png" disabledImage:@"btnUpdate.png" target:self selector:@selector(goToUpdataSence:)];		
        CCMenu *btnUpdataMenu = [CCMenu menuWithItems:btnUpdata, nil];
		btnUpdataMenu.position = CGPointMake(340 , 25);
		[self addChild:btnUpdataMenu z:2];
		[btnUpdata release];
        
        //加载重置按钮
        btnReset = [[CCMenuItemImage alloc] initFromNormalImage:@"btnReset.png" selectedImage:@"btnResetDown.png" disabledImage:@"btnReset.png" target:self selector:@selector(resetGame:)];		
        CCMenu *btnResetMenu = [CCMenu menuWithItems:btnReset, nil];
        btnResetMenu.position = CGPointMake(36 , 289);
        btnReset.scale = 0.85;
        [self addChild:btnResetMenu z:2];
        [btnReset release];
        
        //加载重置YES按钮
        btnYes = [[CCMenuItemImage alloc] initFromNormalImage:@"btnYes.png" selectedImage:@"btnYes.png" disabledImage:@"btnYes.png" target:self selector:@selector(yesToResetGame:)];		
        CCMenu *btnYesMenu = [CCMenu menuWithItems:btnYes, nil];
        btnYesMenu.position = CGPointMake(185 , 105);
        [self addChild:btnYesMenu z:101];
        btnYes.visible = NO;
        [btnYes release];
        
        //加载重置NO按钮
        btnNo = [[CCMenuItemImage alloc] initFromNormalImage:@"btnNo.png" selectedImage:@"btnNo.png" disabledImage:@"btnNo.png" target:self selector:@selector(noToResetGame:)];		
        CCMenu *btnNoMenu = [CCMenu menuWithItems:btnNo, nil];
        btnNoMenu.position = CGPointMake(295 , 105);
        [self addChild:btnNoMenu z:101];
        btnNo.visible = NO;
        [btnNo release];
        
        //加载关卡及分数
        NSMutableArray *gamePointArray = [GamePointList getAllGamePoint];
        NSMutableArray *values;
        GamePoint *gamePoint;
        CCMenuItemImage *btnWaveStation;
        CCSprite *waveScore;
        for (int i = 0; i < [gamePointArray count]; i++) {
            values = [gamePointArray objectAtIndex:i];
            gamePoint = [[[GamePoint alloc] init] autorelease];
            gamePoint.Game_Point_ID = [[values objectAtIndex:0] intValue];
            gamePoint.Is_Open = [[values objectAtIndex:1] intValue];
            gamePoint.Position = [values objectAtIndex:2];
            gamePoint.Score = [[values objectAtIndex:3] intValue];
            //if (1 == 1) {
            if (gamePoint.Is_Open == 1) {
                btnWaveStation = [[CCMenuItemImage alloc] initFromNormalImage:@"btnWaveStation.png" selectedImage:@"btnWaveStation.png" disabledImage:@"btnWaveStation.png" target:self  selector:@selector(setMagic:)];
                btnWaveStation.scale = 0.85;
                btnWaveStation.tag = gamePoint.Game_Point_ID - 1;
                CCMenu *btnWaveStationMenu = [CCMenu menuWithItems:btnWaveStation, nil];
                btnWaveStationMenu.position = CGPointFromString(gamePoint.Position);;
                [self addChild:btnWaveStationMenu z:2];
                [btnWaveStation release];
                
                for (int i=0; i < gamePoint.Score; i++) {
                    waveScore = [CCSprite spriteWithFile:@"starLight.png"];
                    waveScore.position = CGPointMake(CGPointFromString(gamePoint.Position).x - 15 + (i * 15), CGPointFromString(gamePoint.Position).y + 40);
                    [self addChild:waveScore z:2];
                }
                
                for (int i=gamePoint.Score; i < 3; i++) {
                    waveScore = [CCSprite spriteWithFile:@"starLightHui.png"];
                    waveScore.position = CGPointMake(CGPointFromString(gamePoint.Position).x - 15 + (i * 15), CGPointFromString(gamePoint.Position).y + 40);
                    [self addChild:waveScore z:2];
                }
            }
        }
		
		[self setMagicHidden];
	}
	return self;
}

-(void) addJn:(id) sender 
{
    CCMenuItemImage *button = sender;
    NSString *picUrl = [NSString stringWithFormat:@"jN00%d.png", button.tag];
	if (intJN001 == 10) {
		select1 = [CCSprite spriteWithFile:picUrl];
		select1.position = CGPointMake(145 , 113);
		select1.scale = 1;
		[self addChild:select1 z:16];
		intJN001 = button.tag;
		button.isEnabled = NO;
	}
	else if(intJN002 == 10){
		select2 = [CCSprite spriteWithFile:picUrl];
		select2.position = CGPointMake(217 , 113);
		select2.scale = 1;
		[self addChild:select2 z:16];
		intJN002 = button.tag;
		button.isEnabled = NO;
	}
	
	if (intJN002 != 10 && intJN001 != 10) {
		btnPlay.isEnabled = YES;
	}
	else {
		btnPlay.isEnabled = NO;
	}
	
}

-(void) removeJn1:(id) sender 
{
	[self removeChild:select1 cleanup:NO];
	
	if (intJN001 == 1) {
		btnJN001.isEnabled = YES;
	}
	
	if (intJN001 == 2) {
		btnJN002.isEnabled = YES;
	}
	
	if (intJN001 == 3) {
		btnJN003.isEnabled = YES;
	}
	
	if (intJN001 == 4) {
		btnJN004.isEnabled = YES;
	}
	intJN001 = 10;
	
	if (intJN002 != 10 && intJN001 != 10) {
		btnPlay.isEnabled = YES;
	}
	else {
		btnPlay.isEnabled = NO;
	}
}

-(void) removeJn2:(id) sender 
{
	[self removeChild:select2 cleanup:NO];
	if (intJN002 == 1) {
		btnJN001.isEnabled = YES;
	}
	
	if (intJN002 == 2) {
		btnJN002.isEnabled = YES;
	}
	
	if (intJN002 == 3) {
		btnJN003.isEnabled = YES;
	}
	
	if (intJN002 == 4) {
		btnJN004.isEnabled = YES;
	}
	intJN002 = 10;
	
	if (intJN002 != 10 && intJN001 != 10) {
		btnPlay.isEnabled = YES;
	}
	else {
		btnPlay.isEnabled = NO;
	}
}

-(void) closeMagic:(id) sender 
{
	[self setMagicHidden];
}

-(void) setMagicShow
{
	selectMagicBg.visible = YES;
	btnPlay.visible = YES;
	btnJN001.visible = YES;
	btnJN002.visible = YES;
	btnJN003.visible = YES;
	btnJN004.visible = YES;
	btnselectJn1.visible = YES;
	btnselectJn2.visible = YES;
	//select1.visible = YES;
	//select2.visible = YES;
    btnClose.visible = YES;
    btnTouMing.visible = YES;
}

-(void) setMagicHidden
{
	selectMagicBg.visible = NO;
	btnPlay.visible = NO;
	btnJN001.visible = NO;
	btnJN002.visible = NO;
	btnJN003.visible = NO;
	btnJN004.visible = NO;
	btnselectJn1.visible = NO;
	btnselectJn2.visible = NO;
	//select1.visible = NO;
	//select2.visible = NO;
    [self removeChild:select1 cleanup:NO];
    [self removeChild:select2 cleanup:NO];
    btnJN001.isEnabled = YES;
	btnJN002.isEnabled = YES;
	btnJN003.isEnabled = YES;
	btnJN004.isEnabled = YES;
    btnPlay.isEnabled = NO;
    intJN001 = 10;
    intJN002 = 10;
    btnClose.visible = NO;
    btnTouMing.visible = NO;
}

-(void) goToLoadingSence:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[LoadingSence scene:guanKa JN1:intJN001 JN2:intJN002]]];
}

-(void) doNothing:(id) sender 
{
    NSLog(@"TOUMING");
}

-(void) setMagic:(id) sender 
{
	CCMenuItemImage *button = sender;
	guanKa = button.tag;
    CGPoint po = button.parent.position;
    btnWaveStationLight.position = po;
    btnWaveStationLight.visible = YES;
	[self setMagicShow];
}

-(void) resetGame:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    resetBg.visible = YES;
    btnYes.visible =YES;
    btnNo.visible = YES;
    btnTouMing.visible = YES;
}

-(void) yesToResetGame:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    btnTouMing.visible = NO;
    resetBg.visible = NO;
    btnYes.visible =NO;
    btnNo.visible = NO;
    [GnDataController setFirst];
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeDown:0.56f layer:[MainMenuSence node]]];
}

-(void) noToResetGame:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    resetBg.visible = NO;
    btnYes.visible =NO;
    btnNo.visible = NO;
    btnTouMing.visible = NO;
}

-(void) goToMainMenuSence:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeDown:0.56f layer:[MainMenuSence node]]];
}

-(void) goToUpdataSence:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransZoomFlipX:0.56f layer:[UpdataSence node]]];
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
