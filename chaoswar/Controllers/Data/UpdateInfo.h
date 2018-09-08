//
//  UpdateInfo.h
//  chaoswar
//
//  Created by Swimming on 12-1-3.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UpdateInfo : NSObject {
    
}

@property int Update_Info_ID;
@property int Level;
@property (nonatomic, retain) NSString *PictureName;
@property (nonatomic, retain) NSString *Position;
@property (nonatomic, retain) NSString *Explain2;
@property (nonatomic, retain) NSString *Explain3;

@end
