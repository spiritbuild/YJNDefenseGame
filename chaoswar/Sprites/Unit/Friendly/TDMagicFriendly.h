//
//  TDMagicFriendly.h
//  chaoswar
//
//  Created by Mac on 11-10-27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TDFriendly.h"

@class MFDead;

@interface TDMagicFriendly : TDFriendly {
    MFDead *_mfDead;
    ccTime _deadTime;
}

@property ccTime deadTime;

@end

@interface TDMagicFriendly1 : TDMagicFriendly {
    
}

@end

@interface TDMagicFriendly2 : TDMagicFriendly {
    
}

@end

@interface MFDead : NSObject {

}

@property (nonatomic, assign) TDMagicFriendly *friendly;
@property ccTime deadTime;

- (BOOL) run;

- (BOOL) stop;

@end

