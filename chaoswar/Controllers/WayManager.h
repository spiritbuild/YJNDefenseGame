#import <Foundation/Foundation.h>
#import "GameTypeDef.h"

@interface WayManager : NSObject {
    NSMutableDictionary *dicWay;
}

- (void) removeAllWay;

- (void) addWayPoint:(int)roadNum wayPoint:(CGPoint)wayPoint;

- (NSMutableArray*) getWay:(int)roadNum;

- (CGPoint) getWayPoint:(int)roadNum num:(int)num;

@end
