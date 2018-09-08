#import <Foundation/Foundation.h>
#import "GameTypeDef.h"
#import "TDEnemy.h"

@class Pointer;

@interface Wave : NSObject {

}

@property ccTime beginRate;
@property ccTime spawnRate;
@property int totalEnemy;
@property TEnemyType enemyType;
@property (nonatomic, assign) NSMutableArray *way;

+ (id)runWave:(float)b e:(TEnemyType)e s:(float)s t:(int)t wy:(NSMutableArray*)wy;

- (void) start;

- (void) stopWave;

@end
