//
//  UIView+KB_Animation.m
//  KBAnimationKit
//
//  Created by 樊远东 on 4/22/16.
//  Copyright © 2016 樊远东. All rights reserved.
//

#import "UIView+KB_Animation.h"

/**
 *  @brief KBAnimationEngineItem
 */
@interface KBAnimationEngineItem : NSObject
@property (nonatomic, weak) UIView *target;
@property (nonatomic, assign) NSTimeInterval currentTime;
@property (nonatomic, strong) NSValue *fromValue;
@property (nonatomic, strong) NSValue *toValue;
@property (nonatomic, assign) NSTimeInterval duration;
@end

/**
 *  @brief KBAnimationEngine
 */
@interface KBAnimationEngine : NSObject
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) NSMutableArray *animationViews;

+ (void)addAnimation:(KBAnimationEngineItem *)animationEngineItem;

@end


/**
 *  @brief UIView+KB_Animation
 */
@implementation UIView (KB_Animation)

- (void)makeAnimation:(id<KBAnimationProtocol>)animation
           completion:(void (^)(BOOL))completion {

    KBAnimationEngineItem *item = nil;
    [KBAnimationEngine addAnimation:item];
}

@end


/**
 *  @brief KBAnimationEngineItem
 */
@implementation KBAnimationEngineItem

@end


/**
 *  @brief KBAnimationEngine
 */
@implementation KBAnimationEngine

+ (instancetype)sharedEngine {
    static dispatch_once_t pred = 0;
    static KBAnimationEngine *_sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[KBAnimationEngine alloc] init];
    });
    return _sharedObject;
}

+ (void)addAnimation:(KBAnimationEngineItem *)animationEngineItem {
    
}

//函数的四个参数分别代表：
//t--- current time（当前时间）；
//b--- beginning value（初始值）；
//c--- change in value（变化量）；
//d---duration（持续时间）
//运算的结果就是当前的运动路程。


- (CGPoint)makeTransformWithCurrentTime:(NSTimeInterval)currentTime
                              fromPoint:(CGPoint)fromPoint
                                toPoint:(CGPoint)toPoint
                               duration:(NSTimeInterval)duration {

    return CGPointZero;
}

- (CGFloat)makeRotationWithCurrentTime:(NSTimeInterval)currentTime
                             fromFrame:(CGFloat)fromAngle
                               toFrame:(CGFloat)toAngle
                              duration:(NSTimeInterval)duration {

    return 0.0;
}

- (CGRect)makeScaleWithCurrentTime:(NSTimeInterval)currentTime
                         fromFrame:(CGRect)fromFrame
                           toFrame:(CGRect)toFrame
                          duration:(NSTimeInterval)duration {

    return CGRectZero;
}

- (CGFloat)makeFadeWithCurrentTime:(NSTimeInterval)currentTime
                         fromAlpha:(CGRect)fromAlpha
                           toAlpha:(CGRect)toAlpha
                          duration:(NSTimeInterval)duration {

    return 0.0;
}

@end


