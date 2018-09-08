#import <Foundation/Foundation.h>
#import "GamePubDef.h"
#import "TDEnemy.h"
#import "TDSprite.h"
#import "WayPoint.h"

@class MEMagic;

@interface TDMagicEnemy : TDEnemy {
    MEMagic *meMagic;
}

@property BOOL doMagic;
@property int magicRange;

- (NSArray*) searchMagicEnemy;

- (void) doMagicLogic:(NSMutableArray*)array;

@end

@interface TDMagicEnemy1 : TDMagicEnemy {
    
}

@end

@interface TDMagicEnemy2 : TDMagicEnemy {
    
}

@end

@interface MEMagic : NSObject {
    NSMutableArray *arrayMagicEnemy;
}

@property (nonatomic, assign) TDMagicEnemy *enemy;
@property ccTime magicTime;

- (BOOL) run;

- (BOOL) stop;

@end
