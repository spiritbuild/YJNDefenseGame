#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "TDSprite.h"
#import "TDTower.h"
#import "TDEnemy.h"
#import "TDBullet.h"
#import "TDDefBullet.h"
#import "GameController.h"

@interface TDMagicTower : TDTower {

}

@property (nonatomic, retain) NSString *aniShootName;

- (void) AttactEnemy;

@end

@interface TDMagicTower1 : TDMagicTower {
    
}

@end

@interface TDMagicTower2 : TDMagicTower {
    
}

@end

@interface TDMagicTower3 : TDMagicTower {
    
}

@end