#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@class GameController;

//显示随时变化位置的信息

@interface GameControllerScene : CCLayer {
    int _build1Gold;
    int _build2Gold;
    int _build3Gold;
    int _build4Gold;
    int _updateGold;
    
    BOOL _canBuild1;
    BOOL _canBuild2;
    BOOL _canBuild3;
    BOOL _canBuild4;
    BOOL _canUpdate;
}

@property (nonatomic, assign) CCMenuItemImage *btnBuild1;
@property (nonatomic, assign) CCMenuItemImage *btnBuild2;
@property (nonatomic, assign) CCMenuItemImage *btnBuild3;
@property (nonatomic, assign) CCMenuItemImage *btnBuild4;
@property (nonatomic, assign) CCMenuItemImage *btnUpdate;
@property (nonatomic, assign) CCMenuItemImage *btnSell;
@property (nonatomic, assign) CCMenuItemImage *btnZone;

@property BOOL canBuild1;
@property BOOL canBuild2;
@property BOOL canBuild3;
@property BOOL canBuild4;
@property BOOL canUpdate;

@property int build1Gold;
@property int build2Gold;
@property int build3Gold;
@property int build4Gold;
@property int updateGold;

- (void) setBuild1MenuStatus;
- (void) setBuild2MenuStatus;
- (void) setBuild3MenuStatus;
- (void) setBuild4MenuStatus;
- (void) setUpdateMenuStatus;
- (void) setSellMenuStatus;
- (void) setZoneMenuStatus;

- (void) clearSceneSrpite;

-(void)shiYingIphone5;

@end
