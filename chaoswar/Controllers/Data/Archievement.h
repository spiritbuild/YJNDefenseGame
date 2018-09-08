//
//  Archievement.h
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Archievement : NSObject {
    
}

@property int Archievement_ID;
@property (nonatomic, retain) NSString *PictureName;
@property (nonatomic, retain) NSString *Position;
@property (nonatomic, retain) NSString *Explain;
@property int Is_Open;
@property int Has_Scores;

@end
