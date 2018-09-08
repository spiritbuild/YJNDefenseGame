#import <Foundation/Foundation.h>
#import "GamePubDef.h"

@class GameController;

@interface TDSprite : CCSprite <CCTargetedTouchDelegate>{
    NSString* _createTime;
    int _costGold;
    int _getGold;
    TSpriteStatus _spriteStatus;
    int _maxHP;
    int _currentHP;
    int _killNum;
    BOOL _showBlood;
    BOOL _canClick;
    CCProgressTimer *_bloodShowSprite;
    CCSprite *_bloodBackSprite;
    CCSprite *_arrowSprite;
    
    CGRect _rectOrigin;
}

@property (nonatomic, retain) NSString* createTime;
// 花费金额
@property int costGold;
// 得到金额
@property int getGold;
// 是否已经被删除
@property TSpriteStatus spriteStatus;
// 最大生命值：HP
@property int maxHP;
// 当前生命值：HP
@property int currentHP;
// 杀敌次数
@property int killNum;
// 是否已经被删除
@property BOOL showBlood;
// 是否可以被点击
@property BOOL canClick;
// 是否被选中
@property (readonly) BOOL isSelected;
// 是否可以被点击
@property int baseZOrder;
// 是否可以被点击
@property TSpritePlace spritePlace;
// 血条
@property (nonatomic, assign) CCProgressTimer *bloodShowSprite;
// 血条
@property (nonatomic, assign) CCSprite *bloodBackSprite;
// 选中框
@property (nonatomic, assign) CCSprite *arrowSprite;

@property (readonly) CGPoint headPoint;

// 获取当前精灵的实例
+ (id) getSprite;
+ (id) getCurrentSprite;
+ (void) delCurrentSprite;
// 运行精灵
- (BOOL) run;

// 停止精灵
- (BOOL) stop;

// 初始化动画（声音等）
- (void) initAnimate;

// 选中时
- (void) doSelect;

// 离开时
- (void) doUnSelect;

// 正常状态
- (void) statusToNormal;

// 正在死亡
- (void) statusToDeading;

// 已经死亡
- (void) statusToDead;

// 正在死亡 或 已经死亡 时需要做的事，主要释放关联关系的
- (void) clearSpriteData;

// 触摸开始 TOperateType 为当前操作类型
- (void) spriteTouchBegan:(UITouch *)touch operateType:(TOperateType)operateType;

// 触摸移动
- (void) spriteTouchMoved:(UITouch *)touch operateType:(TOperateType)operateType;

// 触摸结束
- (void) spriteTouchEnded:(UITouch *)touch operateType:(TOperateType)operateType;

// 添加一个操作按钮
- (CCMenuItemImage*) addButton:(NSString*)normal selected:(NSString*)selected disabled:(NSString*)disabled sel:(SEL)sel pos:(CGPoint)pos;

- (CCAnimation*) getAnimate:(NSString*)name;

- (void) showImformation;

@end
