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
@end

/**
 *  @brief KBAnimationEngine
 */
@interface KBAnimationEngine : NSObject
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) NSMutableArray *animationViews;

@end


/**
 *  @brief UIView+KB_Animation
 */
@implementation UIView (KB_Animation)

- (void)makeAnimation:(id<KBAnimationProtocol>)animation
           completion:(void (^)(BOOL))completion {
    
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


@end


