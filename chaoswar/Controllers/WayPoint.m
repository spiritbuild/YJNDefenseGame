#import "WayPoint.h"


@implementation WayPoint

@synthesize point = _point;

+ (WayPoint*) getWayPoint:(CGPoint)pt
{
    WayPoint *wayPoint = [[[WayPoint alloc] init] autorelease];
    [wayPoint setValue:pt];
    return wayPoint;
}

- (void) setValue:(CGPoint)pt
{
    _point = pt;

}

@end
