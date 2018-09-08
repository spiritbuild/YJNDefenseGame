#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "TDSprite.h"
#import "TDObject.h"

@class GameController;
@class TDEnemy;
@class TDTower;
@class TDFriendly;
@class TDTower;

@interface TDBullet : TDObject {
    
}

@end

@interface TDTowerBullet : TDBullet {
    
}

@property (nonatomic, assign) TDEnemy *enemy;
@property (nonatomic, assign) TDTower *shooter;
@property CGPoint enemyPoint;

- (void) attact:(id)sender;
- (void) move;

@end

@interface TDFriendlyBullet : TDBullet {
    
}

@property (nonatomic, assign) TDEnemy *enemy;
@property (nonatomic, assign) TDFriendly *shooter;

- (void) attact:(id)sender;
- (void) move;

@end

@interface TDEnemyBullet : TDBullet {
    
}

@property (nonatomic, assign) TDFriendly *enemy;
@property (nonatomic, assign) TDEnemy *shooter;

- (void) attact:(id)sender;
- (void) move;

@end

@interface TDMagicBullet : TDBullet {
    
}

@property (nonatomic, assign) TDEnemy *enemy;

@end

@interface TDMoveBullet : TDBullet {
    
}

@property CGPoint firePoint;
@property int attactRange;

@end
