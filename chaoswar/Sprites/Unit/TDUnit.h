#import <Foundation/Foundation.h>
#import "TDSprite.h"

@class MagicController;

@interface TDUnit : TDSprite {
    NSString *_mvuAniName;
    NSString *_mvdAniName;
    NSString *_mvcAniName;
    NSString *_atAniName;
    NSString *_ddAniName;
    NSString *_mcAniName;
    NSString *_smallPic;
    MagicController *_magicController;
}


@property TUnitStatus unitStatus;
// 最大魔法值：MP
@property int maxMP;
// 当前魔法值：MP
@property int currentMP;
// 移动速度：每秒多少像素（如果是子弹则代表移动到某坐标的时间）
@property float moveSpeed;
// 视野范围：像素（半径）
@property float searchRange;
// 攻击力：计算扣血值
@property int attact;
// 攻击模式：影响攻击效果 0 普通攻击 1 魔法攻击
@property TAcctactType attactMode;
// 攻击范围：像素（半径）
@property int attactRange;
// 攻击间隔：多少秒攻击一次
@property float attacttime;
// 攻击力：计算扣血值
@property int defence;
// 攻击模式：影响攻击效果 0 普通攻击 1 魔法攻击
@property TDefenceType defenceMode;
// 动画名
@property (nonatomic, retain) NSString *mvuAniName;
@property (nonatomic, retain) NSString *mvdAniName;
@property (nonatomic, retain) NSString *mvcAniName;
@property (nonatomic, retain) NSString *atAniName;
@property (nonatomic, retain) NSString *ddAniName;
@property (nonatomic, retain) NSString *mcAniName;
// 是否允许执行动作
@property BOOL canAction;
// 是否允许执行时间器
@property BOOL canSchedule;
// 加速度
@property float speedUPNum;

@property (nonatomic, retain) NSString *smallPic;

@property (nonatomic, retain) NSString *firstFrameName;

- (void) doUnitLogic;

- (void) beAttact:(TDSprite*)s an:(int)an at:(TAcctactType)at;

- (void) doMagicStopStatus;

- (void) doMagicSpeedStatus;

- (void) doMagicLifeStatus;

@end
