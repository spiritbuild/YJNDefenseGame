#import "SceneManager.h"

@implementation SceneManager

//旋转进入
+(CCScene*) TransNomal:(CCLayer*)layer {
	CCScene *scene = [CCScene node];
	[scene addChild: layer];
	return scene;
}

//旋转进入
+ (CCTransitionRotoZoom*) TransRotoZoom:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransRotoZoom:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionRotoZoom*) TransRotoZoom:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionRotoZoom transitionWithDuration:t scene:scene];
}

//跳动进入
+ (CCTransitionJumpZoom*) TransJumpZoom:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransJumpZoom:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionJumpZoom*) TransJumpZoom:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionJumpZoom transitionWithDuration:t scene:scene];
}

//从左侧进入
+ (CCTransitionMoveInL*) TransMoveInL:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransMoveInL:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionMoveInL*) TransMoveInL:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionMoveInL transitionWithDuration:t scene:scene];
}

//从右侧进入
+ (CCTransitionMoveInR*) TransMoveInR:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransMoveInR:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionMoveInR*) TransMoveInR:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionMoveInR transitionWithDuration:t scene:scene];
}

//从顶部进入
+ (CCTransitionMoveInT*) TransMoveInT:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransMoveInT:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionMoveInT*) TransMoveInT:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionMoveInT transitionWithDuration:t scene:scene];
}

//从底部进入
+ (CCTransitionMoveInB*) TransMoveInB:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransMoveInB:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionMoveInB*) TransMoveInB:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionMoveInB transitionWithDuration:t scene:scene];
}

//从左侧滑入
+ (CCTransitionSlideInL*) TransSlideInL:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransSlideInL:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionSlideInL*) TransSlideInL:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionSlideInL transitionWithDuration:t scene:scene];
}

//从右侧滑入
+ (CCTransitionSlideInR*) TransSlideInR:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransSlideInR:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionSlideInR*) TransSlideInR:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionSlideInR transitionWithDuration:t scene:scene];
}
//从顶部滑入
+ (CCTransitionSlideInB*) TransSlideInB:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransSlideInB:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionSlideInB*) TransSlideInB:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionSlideInB transitionWithDuration:t scene:scene];
}

//从底部滑入
+ (CCTransitionSlideInT*) TransSlideInT:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransSlideInT:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionSlideInT*) TransSlideInT:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionSlideInT transitionWithDuration:t scene:scene];
}

//交替进入
+ (CCTransitionShrinkGrow*) TransShrinkGrow:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransShrinkGrow:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionShrinkGrow*) TransShrinkGrow:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionShrinkGrow transitionWithDuration:t scene:scene];
}

//x轴翻入（左右）
+ (CCTransitionFlipX*) TransFlipX:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransFlipX:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionFlipX*) TransFlipX:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionFlipX transitionWithDuration:t scene:scene];
}

//y轴翻入（上下）
+ (CCTransitionFlipY*) TransFlipY:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransFlipY:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionFlipY*) TransFlipY:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionFlipY transitionWithDuration:t scene:scene];
}

//左上右下轴翻入
+ (CCTransitionFlipAngular*) TransFlipAngular:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransFlipAngular:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionFlipAngular*) TransFlipAngular:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionFlipAngular transitionWithDuration:t scene:scene];
}

//x轴翻入放大缩小效果（左右）
+ (CCTransitionZoomFlipX*) TransZoomFlipX:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransZoomFlipX:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionZoomFlipX*) TransZoomFlipX:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionZoomFlipX transitionWithDuration:t scene:scene];
}

//y轴翻入放大缩小效果（上下）
+ (CCTransitionZoomFlipY*) TransZoomFlipY:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransZoomFlipY:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionZoomFlipY*) TransZoomFlipY:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionZoomFlipY transitionWithDuration:t scene:scene];
}
//左上右下轴翻入放大缩小效果
+ (CCTransitionZoomFlipAngular*) TransZoomFlipAngular:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransZoomFlipAngular:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionZoomFlipAngular*) TransZoomFlipAngular:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionZoomFlipAngular transitionWithDuration:t scene:scene];
}

//变暗变亮进入
+ (CCTransitionFade*) TransFade:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransFade:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionFade*) TransFade:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionFade transitionWithDuration:t scene:scene];
}

//渐变进入
+ (CCTransitionCrossFade*) TransCrossFade:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransCrossFade:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionCrossFade*) TransCrossFade:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionCrossFade transitionWithDuration:t scene:scene];
}

//小方格消失进入
+ (CCTransitionTurnOffTiles*) TransTurnOffTiles:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransTurnOffTiles:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionTurnOffTiles*) TransTurnOffTiles:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionTurnOffTiles transitionWithDuration:t scene:scene];
}

//竖条切换进入
+ (CCTransitionSplitCols*) TransSplitCols:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransSplitCols:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionSplitCols*) TransSplitCols:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionSplitCols transitionWithDuration:t scene:scene];
}

//横条切换进入
+ (CCTransitionSplitRows*) TransSplitRows:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransSplitRows:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionSplitRows*) TransSplitRows:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionSplitRows transitionWithDuration:t scene:scene];
}

//小方格右上角显示进入
+ (CCTransitionFadeTR*) TransFadeTR:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransFadeTR:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionFadeTR*) TransFadeTR:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionFadeTR transitionWithDuration:t scene:scene];
}

//小方格左下角显示进入
+ (CCTransitionFadeBL*) TransFadeBL:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransFadeBL:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionFadeBL*) TransFadeBL:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionFadeBL transitionWithDuration:t scene:scene];
}

//横条向上显示进入
+ (CCTransitionFadeUp*) TransFadeUp:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransFadeUp:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionFadeUp*) TransFadeUp:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionFadeUp transitionWithDuration:t scene:scene];
}

//横条向下显示进入
+ (CCTransitionFadeDown*) TransFadeDown:(ccTime)t layer:(CCLayer*)layer {
    return [SceneManager TransFadeDown:t scene:[SceneManager TransNomal:layer]];
}

+ (CCTransitionFadeDown*) TransFadeDown:(ccTime)t scene:(CCScene*)scene {
    return [CCTransitionFadeDown transitionWithDuration:t scene:scene];
}

@end
