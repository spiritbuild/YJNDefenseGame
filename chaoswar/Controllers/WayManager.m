#import "WayManager.h"
#import "WayPoint.h"

@implementation WayManager


- (id) init
{
	if ((self = [super init])) {
        dicWay = [[NSMutableDictionary alloc] init];
	}
	return self;
}

- (void)dealloc {
    [self removeAllWay];
    [dicWay release];
	[super dealloc];
}

- (void) removeAllWay
{
    NSArray *keys = [dicWay allKeys];
    for (int i = 0; i < keys.count; i++) {
        NSMutableArray *way = [dicWay objectForKey:[keys objectAtIndex:i]];
        [way removeAllObjects];
    }
    [dicWay removeAllObjects];
}

- (void) addWayPoint:(int)roadNum wayPoint:(CGPoint)wayPoint
{
    NSMutableArray *way = [dicWay objectForKey:[NSString stringWithFormat:@"%d", roadNum]];
    if (!way) {
        [dicWay setObject:[NSMutableArray array] forKey:[NSString stringWithFormat:@"%d", roadNum]];
        [self addWayPoint:roadNum wayPoint:wayPoint];
        return;
    }
    [way addObject:[WayPoint getWayPoint:wayPoint]];
}

- (NSMutableArray*) getWay:(int)roadNum
{
    NSMutableArray *way = [dicWay objectForKey:[NSString stringWithFormat:@"%d", roadNum]];
    if (!way) {
        return nil;
    }
    return way;
}

- (CGPoint) getWayPoint:(int)roadNum num:(int)num
{
    NSMutableArray *way = [dicWay objectForKey:[NSString stringWithFormat:@"%d", roadNum]];
    if (!way) {
        return ccp(-100, -100);
    }
    WayPoint *wayPoint = [way objectAtIndex:num];
    if (wayPoint) {
        return wayPoint.point;
    }
    return ccp(-100, -100);
}

@end
