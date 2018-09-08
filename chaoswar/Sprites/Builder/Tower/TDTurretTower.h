#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "TDSprite.h"
#import "TDTower.h"
#import "TDEnemy.h"
#import "TDBullet.h"
#import "TDDefBullet.h"
#import "GameController.h"

@interface TDTurretTower : TDTower {

}

@property (nonatomic, retain) NSString *beforeShootName;
@property (nonatomic, retain) NSString *afterShootName;

- (void) AttactEnemy;

@end

@interface TDTurretTower1 : TDTurretTower {
    
}

@end

@interface TDTurretTower2 : TDTurretTower {
    
}

@end

@interface TDTurretTower3 : TDTurretTower {
    
}

@end