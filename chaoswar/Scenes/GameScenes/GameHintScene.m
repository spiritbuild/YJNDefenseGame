#import "GameHintScene.h"


@implementation GameHintScene

-(id) init
{
	if( (self=[super init])) {
        [self shiYingIphone5];
	}
	return self;
}

-(void)shiYingIphone5
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    if (size.width == 568) {
        self.position = ccp(self.position.x + 44, self.position.y);
    }
}

- (void) dealloc {
    [super dealloc];
}

@end


