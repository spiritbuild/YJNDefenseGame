#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SceneManager : NSObject {
    
}

/** 
 直接切换 
 */
+ (CCScene*) TransNomal:(CCLayer*)layer;

//旋转进入
+ (CCTransitionRotoZoom*) TransRotoZoom:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionRotoZoom*) TransRotoZoom:(ccTime)t scene:(CCScene*)scene;

//跳动进入
+ (CCTransitionJumpZoom*) TransJumpZoom:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionJumpZoom*) TransJumpZoom:(ccTime)t scene:(CCScene*)scene;

//从左侧进入
+ (CCTransitionMoveInL*) TransMoveInL:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionMoveInL*) TransMoveInL:(ccTime)t scene:(CCScene*)scene;

//从右侧进入
+ (CCTransitionMoveInR*) TransMoveInR:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionMoveInR*) TransMoveInR:(ccTime)t scene:(CCScene*)scene;

//从顶部进入
+ (CCTransitionMoveInT*) TransMoveInT:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionMoveInT*) TransMoveInT:(ccTime)t scene:(CCScene*)scene;

//从底部进入
+ (CCTransitionMoveInB*) TransMoveInB:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionMoveInB*) TransMoveInB:(ccTime)t scene:(CCScene*)scene;

//从左侧滑入
+ (CCTransitionSlideInL*) TransSlideInL:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionSlideInL*) TransSlideInL:(ccTime)t scene:(CCScene*)scene;

//从右侧滑入
+ (CCTransitionSlideInR*) TransSlideInR:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionSlideInR*) TransSlideInR:(ccTime)t scene:(CCScene*)scene;

//从顶部滑入
+ (CCTransitionSlideInB*) TransSlideInB:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionSlideInB*) TransSlideInB:(ccTime)t scene:(CCScene*)scene;

//从底部滑入
+ (CCTransitionSlideInT*) TransSlideInT:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionSlideInT*) TransSlideInT:(ccTime)t scene:(CCScene*)scene;

//交替进入
+ (CCTransitionShrinkGrow*) TransShrinkGrow:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionShrinkGrow*) TransShrinkGrow:(ccTime)t scene:(CCScene*)scene;

//x轴翻入（左右）
+ (CCTransitionFlipX*) TransFlipX:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionFlipX*) TransFlipX:(ccTime)t scene:(CCScene*)scene;

//y轴翻入（上下）
+ (CCTransitionFlipY*) TransFlipY:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionFlipY*) TransFlipY:(ccTime)t scene:(CCScene*)scene;

//左上右下轴翻入
+ (CCTransitionFlipAngular*) TransFlipAngular:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionFlipAngular*) TransFlipAngular:(ccTime)t scene:(CCScene*)scene;

//x轴翻入放大缩小效果（左右）
+ (CCTransitionZoomFlipX*) TransZoomFlipX:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionZoomFlipX*) TransZoomFlipX:(ccTime)t scene:(CCScene*)scene;

//y轴翻入放大缩小效果（上下）
+ (CCTransitionZoomFlipY*) TransZoomFlipY:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionZoomFlipY*) TransZoomFlipY:(ccTime)t scene:(CCScene*)scene;

//左上右下轴翻入放大缩小效果
+ (CCTransitionZoomFlipAngular*) TransZoomFlipAngular:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionZoomFlipAngular*) TransZoomFlipAngular:(ccTime)t scene:(CCScene*)scene;

//变暗变亮进入
+ (CCTransitionFade*) TransFade:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionFade*) TransFade:(ccTime)t scene:(CCScene*)scene;

//渐变进入
+ (CCTransitionCrossFade*) TransCrossFade:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionCrossFade*) TransCrossFade:(ccTime)t scene:(CCScene*)scene;

//小方格消失进入
+ (CCTransitionTurnOffTiles*) TransTurnOffTiles:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionTurnOffTiles*) TransTurnOffTiles:(ccTime)t scene:(CCScene*)scene;

//竖条切换进入
+ (CCTransitionSplitCols*) TransSplitCols:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionSplitCols*) TransSplitCols:(ccTime)t scene:(CCScene*)scene;

//横条切换进入
+ (CCTransitionSplitRows*) TransSplitRows:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionSplitRows*) TransSplitRows:(ccTime)t scene:(CCScene*)scene;

//小方格右上角显示进入
+ (CCTransitionFadeTR*) TransFadeTR:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionFadeTR*) TransFadeTR:(ccTime)t scene:(CCScene*)scene;

//小方格左下角显示进入
+ (CCTransitionFadeBL*) TransFadeBL:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionFadeBL*) TransFadeBL:(ccTime)t scene:(CCScene*)scene;

//横条向上显示进入
+ (CCTransitionFadeUp*) TransFadeUp:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionFadeUp*) TransFadeUp:(ccTime)t scene:(CCScene*)scene;

//横条向下显示进入
+ (CCTransitionFadeDown*) TransFadeDown:(ccTime)t layer:(CCLayer*)layer;
+ (CCTransitionFadeDown*) TransFadeDown:(ccTime)t scene:(CCScene*)scene;

@end
