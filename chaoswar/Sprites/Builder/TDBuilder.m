#import "TDBuilder.h"

@implementation TDBuilder

@synthesize maxMP = _maxMP;
@synthesize currentMP = _currentMP;
@synthesize attacttime = _attacttime;
@synthesize attactRange = _attactRange;
@synthesize attact = _attact;
@synthesize attactMode = _attactMode;
@synthesize smallPic = _smallPic;
-(id) init
{
	if( (self=[super init])) {
        self.smallPic = @"smat01.png";
	}
	return self;
}

- (void)dealloc {
    [_smallPic release];
    [super dealloc];
}

@end
