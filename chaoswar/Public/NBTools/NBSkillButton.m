//
//  NBSkillButton.m
//  chaoswar
//
//  Created by Swimming on 11-11-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "NBSkillButton.h"

@implementation NBSkillButton

-(id) initFromNormalImage: (NSString*) normalI selectedImage:(NSString*)selectedI disabledImage: (NSString*) disabledI target:(id)t selector:(SEL)sel
{
    self = [super initFromNormalImage:normalI selectedImage:selectedI disabledImage:normalI target:t selector:sel];
    if (self) {
        _doingProgress = NO;
        _progress = [CCProgressTimer progressWithFile:disabledI];
        _progress.position = ccp(self.contentSize.width / 2, self.contentSize.height / 2);
        [self addChild:_progress z:1];
        [_progress setVisible:!self.isEnabled];
    }
    return self;
}

- (void)removeFromParentAndCleanup:(BOOL)cleanup {
    if (_progress) {
        [_progress removeFromParentAndCleanup:cleanup];
    }
    [super removeFromParentAndCleanup:cleanup];
}

- (void) dealloc {
    [self removeFromParentAndCleanup:YES];
    [super dealloc];
}

- (void)setIsEnabled:(BOOL)enabled {
    [super setIsEnabled:enabled];
    if (!_doingProgress) {
        [_progress setVisible:!self.isEnabled];
        _progress.percentage = 100;
    }
}

- (void)setPercentage:(float)percentage {
    [_progress setPercentage:percentage];
}

- (float)percentage {
    return _progress.percentage;
}

-(void) stopAllActions {
    [super stopAllActions];
    _doingProgress = NO;
    [_progress stopAllActions];
}

- (void) doProgress:(ccTime)duration from:(float)from to:(float)to t:(id)t s:(SEL)s {
    _doingProgress = YES;
    [_progress stopAllActions];
    [_progress setType:kCCProgressTimerTypeRadialCCW];
    [_progress setVisible:YES];
    CCCallFuncN* actionAfter = [CCCallFuncN actionWithTarget:t selector:s];
    CCCallFuncN* actionEnabled = [CCCallFuncN actionWithTarget:self selector:@selector(selfEnabled:)];
    CCProgressFromTo* actionProgress = [CCProgressFromTo actionWithDuration:duration from:from to:to];
    [_progress runAction:[CCSequence actions:actionProgress, actionEnabled, actionAfter, nil]];
}

- (void) selfEnabled:(id) sender {
    _doingProgress = NO;
    [self setIsEnabled:YES];
}

- (void) stopProgress {
    [self stopAllActions];
    [_progress setVisible:NO];
}

@end
