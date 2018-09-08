#import "Pointer.h"
#import "SimpleAudioEngine.h"
#import "GameController.h"
#import "ArchievementController.h"
#import "TDBullet.h"
#import "TDTower.h"
#import "TDEnemy.h"
#import "TDFriendly.h"
#import "WayPoint.h"
#import "Wave.h"
#import "AnimateManager.h"
#import "NBSkillButton.h"
#import "GameBackgroundScene.h"
#import "GameImfomationScene.h"
#import "GameMagicScene.h"
#import "GameControllerScene.h"
#import "GameHintScene.h"
#import "SelectSence.h"
#import "SceneManager.h"
#import "GnDataController.h"
#import "GameEndSence.h"
#import "GameConfig.h"

static CGContextRef CreateRGBABitmapContext (CGImageRef inImage) 
{
	CGContextRef context = NULL; 
	CGColorSpaceRef colorSpace; 
	void *bitmapData; //内存空间的指针，该内存空间的大小等于图像使用RGB通道所占用的字节数。
	int bitmapByteCount; 
	int bitmapBytesPerRow;
    
	size_t pixelsWide = CGImageGetWidth(inImage); //获取横向的像素点的个数
	size_t pixelsHigh = CGImageGetHeight(inImage); 
    
    
    
	bitmapBytesPerRow	= (pixelsWide * 4); //每一行的像素点占用的字节数，每个像素点的ARGB四个通道各占8个bit(0-255)的空间
	bitmapByteCount	= (bitmapBytesPerRow * pixelsHigh); //计算整张图占用的字节数
    
	colorSpace = CGColorSpaceCreateDeviceRGB();//创建依赖于设备的RGB通道
	//分配足够容纳图片字节数的内存空间
	bitmapData = malloc( bitmapByteCount ); 
    //创建CoreGraphic的图形上下文，该上下文描述了bitmaData指向的内存空间需要绘制的图像的一些绘制参数
	context = CGBitmapContextCreate (bitmapData, 
                                     pixelsWide, 
                                     pixelsHigh, 
                                     8, 
                                     bitmapBytesPerRow, 
                                     colorSpace, 
                                     kCGImageAlphaPremultipliedLast);
    //Core Foundation中通过含有Create、Alloc的方法名字创建的指针，需要使用CFRelease()函数释放
	CGColorSpaceRelease( colorSpace ); 
	return context;
}

static unsigned char *RequestImagePixelData(UIImage *inImage) 
{
	CGImageRef img = [inImage CGImage]; 
	CGSize size = [inImage size];
    //使用上面的函数创建上下文
	CGContextRef cgctx = CreateRGBABitmapContext(img); 
	
	CGRect rect = {{0,0},{size.width, size.height}};
    //将目标图像绘制到指定的上下文，实际为上下文内的bitmapData。
	CGContextDrawImage(cgctx, rect, img); 
	unsigned char *data = CGBitmapContextGetData (cgctx); 
    //释放上面的函数创建的上下文
	CGContextRelease(cgctx);
	return data;
}

@implementation Pointer

@synthesize waveArray = _waveArray;
@synthesize tipsArray = _tipsArray;
@synthesize waveGold = _waveGold;
@synthesize waveMinusGold = _waveMinusGold;
@synthesize pointerNum = _pointerNum;

- (BOOL) isWhite:(CGPoint)point
{
    if (!imgBackground) {
        NSLog(@"(%f,%f) is not white");
        return NO;
    }
    CGPoint pt = [[CCDirector sharedDirector] convertToUI: point];
    
    
    CGFloat width  = imgBackground.size.width;
    unsigned char *imgPixel = RequestImagePixelData(imgBackground);
    int i = 4 * width * pt.y + 4 * pt.x;
    int r = (unsigned char)imgPixel[i];
    int g = (unsigned char)imgPixel[i+1];
    int b = (unsigned char)imgPixel[i+2];
    
    if (r == 255 && g == 255 && b == 255) {
        NSLog(@"(%f,%f) is white");
        return YES;
    }
    NSLog(@"(%f,%f) is not white");
    return NO;
}

- (void) initController
{

}

- (void) initAnimate
{
    [animateManager initBoss01];
    [animateManager initBoss02];
    [animateManager initFly01];
    [animateManager initFly02];
    [animateManager initFly03];
    [animateManager initShooter01];
    [animateManager initMagic01];
    [animateManager initMagic02];
    [animateManager initFoot01];
    [animateManager initFoot02];
    [animateManager initFoot03];
    [animateManager initFoot04];
    [animateManager initFoot05];
    [animateManager initFoot06];
    [animateManager initFoot07];
    [animateManager initFoot08];
    [animateManager initFoot09];
    [animateManager initFoot10];
    [animateManager initFoot11];
    [animateManager initFoot12];
    [animateManager initFoot13];
    [animateManager initFoot14];
    [animateManager initFoot15];
    [animateManager initFoot16];
    [animateManager initDefenceTower01];
    [animateManager initDefenceTower02];
    [animateManager initDefenceTower03];
    [animateManager initTurretTower01];
    [animateManager initTurretTower02];
    [animateManager initTurretTower03];
    [animateManager initTurretBullet];
    [animateManager initMagicTower01];
    [animateManager initMagicTower02];
    [animateManager initMagicTower03];
    [animateManager initMagicFriendly01];
    [animateManager initForeverFriendly01];
    [animateManager initMagicFire];
    [animateManager initMagicThunder];
    [animateManager initMagicStone];
    [animateManager initAllEffect];
}

- (CCAnimation*) getAnimation:(NSString*)animationName
{
    return [animateManager getAnimation:animationName];
}

- (void) addTower:(NSMutableArray*)a t:(TDTower*)t p:(CGPoint)p s:(CGPoint)s
{
    GameController *gc = [GameController getGameController];
    CGSize size = [[CCDirector sharedDirector] winSize];
    t.searchPoint = s;
    t.anchorPoint = ccp(0.5, 0);
    t.position = p;
    [gc.gameBackground addChild:t z:size.height - t.position.y + 100];
    [t run];
    [a addObject:t];
}

- (void) runWave:(float)b e:(TEnemyType)e s:(float)s t:(int)t wy:(NSMutableArray*)wy
{
    [_waveArray addObject:[Wave runWave:b e:e s:s t:t wy:wy]];
}

- (void) prepareNextWave:(ccTime)dt
{
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(nextWaveReady:) forTarget:self interval:dt paused:NO];
}

- (void) prepareEndPoint:(ccTime)dt
{
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(endPointReady:) forTarget:self interval:dt paused:NO];
}

- (void) prepareEndGame:(ccTime)dt
{
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(endGameReady:) forTarget:self interval:dt paused:NO];
}

- (void) nextWaveReady:(ccTime)dt
{
    [[CCScheduler sharedScheduler] unscheduleSelector:@selector(nextWaveReady:) forTarget:self];
    [self doAutoNextWave];
    GameController *gc = [GameController getGameController];
	gc.canNext = YES;
    [gc setGameStatus];
}

- (void) endPointReady:(ccTime)dt
{
    [[CCScheduler sharedScheduler] unscheduleSelector:@selector(endPointReady:) forTarget:self];
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(doEndPointReady:) forTarget:self interval:1.5 paused:NO];
}

- (void) endGameReady:(ccTime)dt
{
    [[CCScheduler sharedScheduler] unscheduleSelector:@selector(endGameReady:) forTarget:self];
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(doEndGameReady:) forTarget:self interval:1.5 paused:NO];
}

- (void) doEndPointReady:(ccTime)dt
{
    GameController *gc = [GameController getGameController];
    if ([gc.enemyArray count] == 0) {
        [ArchievementController hasArchievement1];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"winBg.wav" loop:NO];
        [[CCScheduler sharedScheduler] unscheduleSelector:@selector(doEndPointReady:) forTarget:self];
        isGameStop = YES;
        [[CCDirector sharedDirector] pause];
        GameController *gc = [GameController getGameController];
        [gc.gameHint removeAllChildrenWithCleanup:YES];
        //背景
        CCSprite *winBg = [CCSprite spriteWithFile:@"winBg.png"];
        winBg.position = ccp(240 , 175);
        [gc.gameHint addChild:winBg z:100];
        
        //按钮
        CCMenuItemImage *btnWin = [CCMenuItemImage itemFromNormalImage:@"btnWin.png" selectedImage:@"btnWindown.png" disabledImage:@"btnWin.png"  target:self selector:@selector(winAndEnd:)];
        CCMenu *btnWinMenu = [CCMenu menuWithItems:btnWin, nil];
        btnWinMenu.position = ccp(240 , 110);
        [gc.gameHint addChild:btnWinMenu z:101];
        
        if (gc.currentHealth == 10) {
            [ArchievementController hasArchievement4];
        }
        //评价
        int score = 0;
        if (gc.currentHealth < 5) {
            score = 1;
        } else if (gc.currentHealth < 9) {
            score = 2;
        } else {
            score = 3;
        }
        
        CCSprite *xing;
        int y = 200;
        for (int i= 1; i <= score; i++) {
            xing = [CCSprite spriteWithFile:@"bigStar.png"];
            xing.position = ccp(y , 155);
            [gc.gameHint addChild:xing z:101];
            y= y+40;
        }
		
        //		int y = 200;
        //        
        //        for (int i= 1; i <= score; i++) {
        //            CCSpriteBatchNode *spritebatchBigStar;
        //            CCSprite *spriteBigStar;
        //            CCAnimation *animationBigStar;
        //            
        //            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"bigStarSheet.plist"];
        //            spritebatchBigStar = [CCSpriteBatchNode batchNodeWithFile:@"bigStarSheet.png"];
        //            [gc.gameHint addChild:spritebatchBigStar z:101];
        //            
        //            NSMutableArray *animFramesBigStar = [NSMutableArray array];
        //            for(int i = 1; i < 6; i++) {
        //                CCSpriteFrame *frameBigStar = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"bigStar%04d.png",i]];
        //                if (i==1) {
        //                    spriteBigStar = [[CCSprite alloc] initWithSpriteFrame:frameBigStar];
        //                }
        //                [animFramesBigStar addObject:frameBigStar];
        //            }
        //            animationBigStar = [CCAnimation animationWithFrames:animFramesBigStar delay:0.05f];
        //            [spritebatchBigStar addChild:spriteBigStar];
        //            [spriteBigStar release];
        //            spriteBigStar.position = ccp(y , 155);
        //            [spriteBigStar runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithDuration:1.5 animation:animationBigStar restoreOriginalFrame:NO] ]];
        //            
        //            y= y+40;
        //}
		
        [gc setGameStatus];
    }
}

-(void) winAndEnd:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    isGameStop = NO;
    [[CCDirector sharedDirector] resume];
    GameController *gc = [GameController getGameController];
    //更新得分和开通下关关卡
    int score = 0;
    if (gc.currentHealth < 5) {
        score = 1;
    } else if (gc.currentHealth < 9) {
        score = 2;
    } else {
        score = 3;
    }
    [GnDataController setSelect:gc.ptNum s:score];
    [gc releaseScene];
    [ArchievementController hasArchievement12];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"mainBg.mp3"];
	[[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[SelectSence scene]]];
}

- (void) doEndGameReady:(ccTime)dt
{
    GameController *gc = [GameController getGameController];
    if ([gc.enemyArray count] == 0) {
        [ArchievementController hasArchievement1];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"winBg.wav" loop:NO];
        [[CCScheduler sharedScheduler] unscheduleSelector:@selector(endGameReady:) forTarget:self];
        isGameStop = YES;
        [[CCDirector sharedDirector] pause];
        GameController *gc = [GameController getGameController];
        //背景
        CCSprite *winBg = [CCSprite spriteWithFile:@"winBg.png"];
        winBg.position = ccp(240 , 175);
        [gc.gameHint addChild:winBg z:100];
        
        //菜单
        CCMenuItemImage *btnWin = [CCMenuItemImage itemFromNormalImage:@"btnWin.png" selectedImage:@"btnWindown.png" disabledImage:@"btnWin.png"  target:self selector:@selector(winAndGameEnd:)];
        CCMenu *btnWinMenu = [CCMenu menuWithItems:btnWin, nil];
        btnWinMenu.position = ccp(240 , 110);
        [gc.gameHint addChild:btnWinMenu z:101];
        
        if (gc.currentHealth == 10) {
            [ArchievementController hasArchievement4];
        }
        //评价
        int score = 0;
        if (gc.currentHealth < 5) {
            score = 1;
        } else if (gc.currentHealth < 9) {
            score = 2;
        } else {
            score = 3;
        }
        
        CCSprite *xing;
        int y = 200;
        for (int i= 1; i <= score; i++) {
            xing = [CCSprite spriteWithFile:@"bigStar.png"];
            xing.position = ccp(y , 155);
            [gc.gameHint addChild:xing z:101];
            y= y+40;
        }
        
        [gc setGameStatus];
    }
}

-(void) winAndGameEnd:(id) sender 
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn.wav"];
    isGameStop = NO;
    [[CCDirector sharedDirector] resume];
    GameController *gc = [GameController getGameController];
    //更新得分和开通下关关卡
    int score = 0;
    if (gc.currentHealth < 5) {
        score = 1;
    } else if (gc.currentHealth < 9) {
        score = 2;
    } else {
        score = 3;
    }
    [gc releaseScene];
    [GnDataController setSelect:gc.ptNum s:score];
    [ArchievementController hasArchievement12];
	[[CCDirector sharedDirector] replaceScene: [SceneManager TransFade:0.56f scene:[GameEndSence scene]]];
}

- (void) addWaveTip:(CGPoint)pos
{
    CCSprite *s = [CCSprite spriteWithFile:@"enemyPoint.png"];
    [s runAction:[CCRepeatForever actionWithAction:[CCBlink actionWithDuration:0.5 blinks:1]]];
    GameController *gc = [GameController getGameController];
    s.position = pos;
    s.scale = 1;
    [gc.gameBackground addChild:s z:2000];
    [_tipsArray addObject:s];
}

- (void) autoNextWave:(ccTime)dt mustGold:(int)mustGold addGold:(int)addGold
{
    _waveGold = mustGold + addGold * dt;
    _waveMinusGold = addGold;
    [[CCScheduler sharedScheduler] scheduleSelector:@selector(minusNextWave:) forTarget:self interval:1 paused:NO];
    GameController *gc = [GameController getGameController];
    [gc.gameMagic.btnGo doProgress:dt from:50 to:0 t:self s:@selector(doNextWave:)];
    [gc.gameMagic.btnGo setIsEnabled:YES];
}

- (void) minusNextWave:(ccTime)dt
{
    _waveGold = _waveGold - _waveMinusGold;
}

- (void) doNextWave:(ccTime)dt
{
    GameController *gc = [GameController getGameController];
    [gc startNextWave];
}

- (void) endThisPoint:(ccTime)dt
{

}

- (void) doAutoNextWave
{
    
}

- (void) initEnemy:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initTower:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (BOOL) runWaves:(int)wave
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"waveSound.wav"];
    GameController *gc = [GameController getGameController];
    [gc.gameMagic.btnGo stopAllActions];
    [[CCScheduler sharedScheduler] unscheduleSelector:@selector(minusNextWave:) forTarget:self];
    [[CCScheduler sharedScheduler] unscheduleSelector:@selector(doNextWave:) forTarget:self];
    for (CCSprite *s in _tipsArray) {
        [s removeFromParentAndCleanup:YES];
    }
    [_tipsArray removeAllObjects];
    gc.currentGold = gc.currentGold + _waveGold;
    _waveGold = 0;
    [gc setGameStatus];
    return YES;
}

- (void) initBullety:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (void) initWayPoint:(WayManager*)manager
{
    //
}

- (void) initFriendly:(NSMutableArray*)array
{
    [array removeAllObjects];
}

- (id) init
{
    self = [super init];
	if (self) {
        _waveArray = [[NSMutableArray alloc] init];
        _tipsArray = [[NSMutableArray alloc] init];
        _waveGold = 0;
        _pointerNum = 0;
        animateManager = [[AnimateManager alloc] init];
        GameController *gc = [GameController getGameController];
        animateManager.parentScene = gc.gameBackground;
	}
	return self;
}

- (void) setImageName:(NSString*)name {
    if (imgBackground) {
        [imgBackground release];
        imgBackground = nil;
    }
    imgBackground = [[UIImage imageNamed:name] retain];
}

- (void)dealloc {
    [self stopController];
    if (imgBackground) {
        [imgBackground release];
        imgBackground = nil;
    }
    [_waveArray release];
    [_tipsArray release];
    [animateManager release];
	[super dealloc];
}

- (void) stopController
{
    [[CCScheduler sharedScheduler] unscheduleAllSelectorsForTarget:self];
    for (int i = 0; i < [_waveArray count]; i++) {
        Wave *wave = (Wave*) [_waveArray objectAtIndex:i];
        [wave stopWave];
    }
    [_waveArray removeAllObjects];
    for (CCSprite *s in _tipsArray) {
        [s removeFromParentAndCleanup:YES];
    }
    [_tipsArray removeAllObjects];
}

@end
