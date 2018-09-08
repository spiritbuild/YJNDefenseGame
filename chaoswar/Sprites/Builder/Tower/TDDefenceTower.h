#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "TDSprite.h"
#import "TDTower.h"
#import "TDEnemy.h"
#import "TDBullet.h"
#import "TDDefBullet.h"
#import "GameController.h"

@class TDTowerFriendly;

@interface TDDefenceTower : TDTower {
    NSMutableArray *_arrayFriendly;
    int _needCreateFriendly;
}

@property (nonatomic, retain) NSString *aniShootName;
@property (nonatomic, assign) CCSprite *spSprite;

- (BOOL) addFriendly:(TDTowerFriendly*)f;

- (BOOL) delFriendly:(TDTowerFriendly*)f;

- (TDTowerFriendly*) getFriendly:(int)i;

- (BOOL) hasFriendly:(TDTowerFriendly*)f;

- (void) setFriendlyPos;

- (TDTowerFriendly*) friendlyType;

- (void) addACreateFriendly;

- (void) delACreateFriendly;

@end

@interface TDDefenceTower1 : TDDefenceTower {
    
}

@end

@interface TDDefenceTower2 : TDDefenceTower {
    
}

@end

@interface TDDefenceTower3 : TDDefenceTower {
    
}

@end