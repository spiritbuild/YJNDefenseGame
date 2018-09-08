#import <Foundation/Foundation.h>
#import "TDSprite.h"

@interface TDObject : TDSprite {

}

// 移动时间（秒）
@property float moveTime;
// 攻击力：计算扣血值
@property int attact;
// 攻击模式：影响攻击效果 0 普通攻击 1 魔法攻击
@property TAcctactType attactMode;

@end
