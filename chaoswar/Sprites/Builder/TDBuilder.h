#import <Foundation/Foundation.h>
#import "TDSprite.h"

@interface TDBuilder : TDSprite {

}

//魔法最大值
@property int maxMP;
//当前魔法值
@property int currentMP;
//攻击间隔
@property float attacttime;
//攻击距离
@property int attactRange;
//攻击力
@property int attact;
//攻击模式
@property TAcctactType attactMode;

@property (nonatomic, retain) NSString *smallPic;

@end
