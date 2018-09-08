#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "NBSkillButton.h"

@class GameController;

//显示初始化变化位置，之后不变的信息

@interface GameMagicScene : CCLayer {
    BOOL magic1Restart;
    BOOL magic2Restart;
    BOOL magic3Restart;
    BOOL magic4Restart;
}

@property (nonatomic, assign) NBSkillButton *btnGo;
@property (nonatomic, assign) NBSkillButton *btnMagic1;
@property (nonatomic, assign) NBSkillButton *btnMagic2;
@property (nonatomic, assign) NBSkillButton *btnMagic3;
@property (nonatomic, assign) NBSkillButton *btnMagic4;

- (void) setMagic:(int)JN1 JN2:(int)JN2;

- (NBSkillButton*) addButton:(int)magicNum selector:(SEL)sel point:(CGPoint)point;

- (void) reStart;

- (void) setGoMenuStatus;
- (void) setMagic1MenuStatus;
- (void) setMagic2MenuStatus;
- (void) setMagic3MenuStatus;
- (void) setMagic4MenuStatus;

- (void) restartMagicFire;
- (void) restartMagicFriendly;
- (void) restartMagicThunder;
- (void) restartMagicStop;

-(void)shiYingIphone5;

@end
