//
//  UIView+KB_Animation.h
//  KBAnimationKit
//
//  Created by 樊远东 on 4/22/16.
//  Copyright © 2016 樊远东. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, KBAnimationOptions) {
    KBAnimationOptionsLinear      = 1 << 0, //无缓动效果
    KBAnimationOptionsQuadratic   = 1 << 1, //二次方的缓动
    KBAnimationOptionsCubic       = 1 << 2, //三次方的缓动
    KBAnimationOptionsQuartic     = 1 << 3, //四次方的缓动
    KBAnimationOptionsQuintic     = 1 << 4, //五次方的缓动
    KBAnimationOptionsSinusoidal  = 1 << 5, //正弦曲线的缓动
    KBAnimationOptionsExponential = 1 << 6, //指数曲线的缓动
    KBAnimationOptionsCircular    = 1 << 7, //圆形曲线的缓动
    KBAnimationOptionsElastic     = 1 << 8, //指数衰减的正弦曲线缓动
    KBAnimationOptionsBack        = 1 << 9, //超过范围的三次方缓动
    KBAnimationOptionsBounce      = 1 << 10,//指数衰减的反弹缓动

    KBAnimationOptionsEaseIn      = 1 << 11,//从0开始加速的运动
    KBAnimationOptionsEaseOut     = 1 << 12,//减速到0的运动
    KBAnimationOptionsEaseInOut   = 1 << 13,//先从0开始加速，再减速到0的运动

    KBAnimationOptionsTransform   = 1 << 14,//平移运动
    KBAnimationOptionsRotation    = 1 << 15,//旋转运动
    KBAnimationOptionsScale       = 1 << 16,//缩放运动
    KBAnimationOptionsFade        = 1 << 17,//渐隐渐现
};

typedef void(^KBAnimationCompletion)(BOOL finished);

@protocol KBAnimationProtocol <NSObject>
@required
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) KBAnimationOptions options;
@optional
@property (nonatomic, assign) NSTimeInterval delay;
@property (nonatomic, copy  ) KBAnimationCompletion completion;
@end

@protocol KBTransformAnimationProtocol <KBAnimationProtocol>
@required
@property (nonatomic, assign) CGPoint fromCenterPoint;
@property (nonatomic, assign) CGPoint toCenterPoint;
@end

@protocol KBRotationAnimationProtocol <KBAnimationProtocol>
@required
@property (nonatomic, assign) CGPoint centerPoint;
@property (nonatomic, assign) CGFloat fromAngle;
@property (nonatomic, assign) CGFloat toAngle;
@end

@protocol KBScaleAnimationProtocol <KBAnimationProtocol>
@required
@property (nonatomic, assign) CGRect fromFrame;
@property (nonatomic, assign) CGRect toFrame;
@end

@protocol KBFadeAnimationProtocol <KBAnimationProtocol>
@required
@property (nonatomic, assign) CGFloat fromAlpha;
@property (nonatomic, assign) CGFloat toAlpha;
@end

@interface UIView (KB_Animation)

- (void)makeAnimation:(id<KBAnimationProtocol>)animation
           completion:(void (^)(BOOL))completion;

@end

