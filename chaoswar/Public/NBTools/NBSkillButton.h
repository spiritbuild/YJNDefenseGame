//
//  NBSkillButton.h
//  chaoswar
//
//  Created by Swimming on 11-11-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@interface NBSkillButton : CCMenuItemImage {
    CCProgressTimer* _progress;
    BOOL _doingProgress;
}

@property (nonatomic, readwrite) float percentage;

- (void) doProgress:(ccTime)duration from:(float)from to:(float)to t:(id)t s:(SEL)s;

- (void) stopProgress;

@end
