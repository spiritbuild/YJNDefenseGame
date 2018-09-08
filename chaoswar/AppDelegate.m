#import "GamePubDef.h"

#import "AppDelegate.h"
#import "GameConfig.h"
#import "RootViewController.h"
#import "MainMenuSence.h"
#import "SceneManager.h"
#import "TDSprite.h"
#import "DBDataManager.h"
#import "GamePointList.h"
#import "UpdateInfoList.h"
#import "GameProcessList.h"
#import "ArchievementList.h"

@implementation AppDelegate

@synthesize window;

- (void) removeStartupFlicker
{
	//
	// THIS CODE REMOVES THE STARTUP FLICKER
	//
	// Uncomment the following code if you Application only supports landscape mode
	//
#if GAME_AUTOROTATION == kGameAutorotationUIViewController

//	CC_ENABLE_DEFAULT_GL_STATES();
//	CCDirector *director = [CCDirector sharedDirector];
//	CGSize size = [director winSize];
//	CCSprite *sprite = [CCSprite spriteWithFile:@"Default.png"];
//	sprite.position = ccp(size.width/2, size.height/2);
//	sprite.rotation = -90;
//	[sprite visit];
//	[[director openGLView] swapBuffers];
//	CC_ENABLE_DEFAULT_GL_STATES();
	
#endif // GAME_AUTOROTATION == kGameAutorotationUIViewController	
}
- (void) applicationDidFinishLaunching:(UIApplication*)application
{
 
    //设置本地的游戏vc
    [self setNativeVC];
    
}
//设置本地vc
- (void)setNativeVC {
    
    [self initDataBase];
    [GameProcessList initAllData];
    [ArchievementList initAllData];
    
    
    isGameStop = NO;
    //    arrayTDSprite = [[NSMutableArray alloc] init];
    // Init the window
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Try to use CADisplayLink director
    // if it fails (SDK < 3.1) use the default director
    if( ! [CCDirector setDirectorType:kCCDirectorTypeDisplayLink] )
        [CCDirector setDirectorType:kCCDirectorTypeDefault];
    
    
    CCDirector *director = [CCDirector sharedDirector];
    
    // Init the View Controller
    viewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
    viewController.wantsFullScreenLayout = YES;
    
    
    // Create the EAGLView manually
    //  1. Create a RGB565 format. Alternative: RGBA8
    //  2. depth format of 0 bit. Use 16 or 24 bit for 3d effects, like CCPageTurnTransition
    //
    EAGLView *glView = [EAGLView viewWithFrame:[window bounds]
                                   pixelFormat:kEAGLColorFormatRGB565    // kEAGLColorFormatRGBA8
                                   depthFormat:0                        // GL_DEPTH_COMPONENT16_OES
                        ];
    
    // attach the openglView to the director
    [director setOpenGLView:glView];
    
    //    // Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
    if( ! [director enableRetinaDisplay:YES] )
        CCLOG(@"Retina Display Not supported");
    
    //
    // VERY IMPORTANT:
    // If the rotation is going to be controlled by a UIViewController
    // then the device orientation should be "Portrait".
    //
    // IMPORTANT:
    // By default, this template only supports Landscape orientations.
    // Edit the RootViewController.m file to edit the supported orientations.
    //
#if GAME_AUTOROTATION == kGameAutorotationUIViewController
    [director setDeviceOrientation:kCCDeviceOrientationPortrait];
#else
    [director setDeviceOrientation:kCCDeviceOrientationLandscapeLeft];
#endif
    
    [director setAnimationInterval:1.0/60];
    [director setDisplayFPS:NO];
    
    
    // make the OpenGLView a child of the view controller
    [viewController setView:glView];
    
    // make the View Controller a child of the main window
    //[window addSubview: viewController.view];
    if ( [[UIDevice currentDevice].systemVersion floatValue] < 6.0)
    { // warning: addSubView doesn't work on iOS6
        [window addSubview: viewController.view];
    }
    else
    { // use this mehod on ios6
        //如果不设置rootvc 就会崩溃
        [window setRootViewController:viewController];
    }
    
    [window makeKeyAndVisible];
    
    // Default texture format for PNG/BMP/TIFF/JPEG/GIF images
    // It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
    // You can change anytime.
    [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
    
    
    // Removes the startup flicker
    [self removeStartupFlicker];
    
    // Run the intro Scene
    [[CCDirector sharedDirector] runWithScene: [SceneManager TransFade:0.6f layer:[MainMenuSence node]]];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [GameProcessList saveAllData];
    [ArchievementList saveAllData];
	[[CCDirector sharedDirector] pause];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    if (!isGameStop) {
        [[CCDirector sharedDirector] resume];
    }
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
	[[CCDirector sharedDirector] purgeCachedData];
}

-(void) applicationDidEnterBackground:(UIApplication*)application {
    [GameProcessList saveAllData];
    [ArchievementList saveAllData];
	[[CCDirector sharedDirector] stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application {
	[[CCDirector sharedDirector] startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [GameProcessList saveAllData];
    [ArchievementList saveAllData];
	CCDirector *director = [CCDirector sharedDirector];
	
	[[director openGLView] removeFromSuperview];
	
//    [arrayTDSprite release];
    
	[viewController release];
	
	[window release];
	
	[director end];	
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void)dealloc {
    [GameProcessList saveAllData];
    [ArchievementList saveAllData];
	[[CCDirector sharedDirector] end];
	[window release];
	[super dealloc];
}

- (void) initDataBase {
    [GamePointList initDataBase];
    [UpdateInfoList initDataBase];
    [GameProcessList initDataBase];
    [ArchievementList initDataBase];
}



@end
