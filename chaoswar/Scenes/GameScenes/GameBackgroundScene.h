#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@interface GameBackgroundScene : CCLayer {

}

@property (nonatomic, readonly) CCSprite *background;
@property (nonatomic, readonly) CCSprite *showground;	
@property int waveLevel;
@property int pointNum;

+ (id) scene:(int)gk JN1:(int)JN1 JN2:(int)JN2;

- (void) initMap:(int)pn;

- (void) sceneTouchBegan:(NSSet*)touches operateType:(TOperateType)operateType;

- (void) sceneTouchMoved:(NSSet*)touches operateType:(TOperateType)operateType;

- (void) sceneTouchEnded:(NSSet*)touches operateType:(TOperateType)operateType;

-(void)shiYingIphone5;

@end
