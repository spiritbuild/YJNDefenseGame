#import <Foundation/Foundation.h>
#import "GameTypeDef.h"
#import "TDBullet.h"

@interface TDArrowTowerBullet : TDTowerBullet {
    
}

@end

@interface TDArrowTowerBullet1 : TDArrowTowerBullet {
    
}

@end

@interface TDArrowTowerBullet2 : TDArrowTowerBullet {
    
}

@end

@interface TDArrowTowerBullet3 : TDArrowTowerBullet {
    
}

@end

@interface TDTurretTowerBullet : TDTowerBullet {

}

@property int attactRange;
@property (nonatomic, retain) NSString *aniBoomName;

- (void) afterRepeat:(id)sender;
- (void) searchClearEnemy;
- (void) attactAEnemy:(TDEnemy*)enemy;

@end

@interface TDTurretTowerBullet1 : TDTurretTowerBullet {
    
}

@end

@interface TDTurretTowerBullet2 : TDTurretTowerBullet {
    
}

@end

@interface TDTurretTowerBullet3 : TDTurretTowerBullet {
    
}

@end

@interface TDMagicTowerBullet : TDTowerBullet {
    
}

@end

@interface TDMagicTowerBullet1 : TDMagicTowerBullet {
    
}

@end

@interface TDMagicTowerBullet2 : TDMagicTowerBullet {
    
}

@end

@interface TDMagicTowerBullet3 : TDMagicTowerBullet {
    
}

@end
