#import "GamePubDef.h"

@interface WayPoint : CCNode {

}

@property (readonly) CGPoint point;

+ (WayPoint*) getWayPoint:(CGPoint)pt;

- (void) setValue:(CGPoint)pt;

@end
