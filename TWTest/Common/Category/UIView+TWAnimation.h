//
//  UIView+Animation.h
//  StringDemo
//
//  Created by 何 振东 on 12-10-11.
//  Copyright (c) 2012年 wsk. All rights reserved.
//

typedef enum : NSUInteger {
    kTW_TransitionFromTop = 0,
    kTW_TransitionFromBottom,
    kTW_TransitionFromLeft,
    kTW_TransitionFromRight,
} TWTransitionDirection;


#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

/**
 *  自定义常用动画效果
 */
@interface UIView (TWAnimation)


- (void)tw_revealAninationWithDirection:(TWTransitionDirection)direction;

- (void)tw_revealAnination;

- (void)tw_rotateAndScaleDownUpAnimation;

- (void)tw_fadeAnimationWithDirection:(TWTransitionDirection)direction;

- (void)tw_pushAnimationWithDirection:(TWTransitionDirection)direction;

- (void)tw_curlAnimationWithDirection:(TWTransitionDirection)direction;

- (void)tw_uncurlAnimationWithDirection:(TWTransitionDirection)direction;

- (void)tw_rotateAndScaleEffectsAnimation;

- (void)tw_moveAnimationWithDirection:(TWTransitionDirection)direction;

- (void)tw_cubeAnimationWithDirection:(TWTransitionDirection)direction;

- (void)tw_rippleAnimation;

- (void)tw_cameraEffectAnimation:(BOOL)open;

- (void)tw_suckEffectAnimation;

- (void)tw_bounceInAnimation;

- (void)tw_bounceOutAnimation;

- (void)tw_bounceAnimation;


@end
