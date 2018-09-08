//
//  GamePoint.h
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GamePoint : NSObject {
    
}

@property int Game_Point_ID;
@property int Is_Open;
@property (nonatomic, retain) NSString *Position;
@property int Score;

@end
