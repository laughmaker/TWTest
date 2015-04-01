//
//  UIView+Animation.m
//  StringDemo
//
//  Created by 何 振东 on 12-10-11.
//  Copyright (c) 2012年 wsk. All rights reserved.
//

#import "UIView+TWAnimation.h"


#define kTransitionTime 0.55
#define kFlipTime       0.85

/**
 *  direction取值:kCATransitionFromTop  kCATransitionFromBottom
 *               kCATransitionFromLeft kCATransitionFromRight
 */

@implementation UIView (TWAnimation)

- (NSString *)directionStringForTransitionDirection:(TWTransitionDirection)direction
{
    switch (direction) {
        case 0:
            return kCATransitionFromTop;
            break;
        case 1:
            return kCATransitionFromBottom;
            break;
        case 2:
            return kCATransitionFromLeft;
            break;
        case 3:
            return kCATransitionFromRight;
            break;
    }
}

- (void)tw_revealAninationWithDirection:(TWTransitionDirection)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setType:kCATransitionReveal];
    [animation setSubtype:[self directionStringForTransitionDirection:direction]];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [self.layer addAnimation:animation forKey:nil];
}

- (void)tw_revealAnination
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setType:kCATransitionFade];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)tw_rotateAndScaleDownUpAnimation
{
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 2];
	rotationAnimation.duration = 0.750f;
	rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	scaleAnimation.toValue = [NSNumber numberWithFloat:0.0];
	scaleAnimation.duration = 0.75f;
	scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
	animationGroup.duration = 0.75f;
	animationGroup.autoreverses = YES;
	animationGroup.repeatCount = 1;//HUGE_VALF;
	[animationGroup setAnimations:[NSArray arrayWithObjects:rotationAnimation, scaleAnimation, nil]];
    
	[self.layer addAnimation:animationGroup forKey:@"animationGroup"];
}


- (void)tw_fadeAnimationWithDirection:(TWTransitionDirection)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kFlipTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"oglFlip"];
    [animation setSubtype:[self directionStringForTransitionDirection:direction]];
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)tw_pushAnimationWithDirection:(TWTransitionDirection)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:kCATransitionPush];
    [animation setSubtype:[self directionStringForTransitionDirection:direction]];
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)tw_curlAnimationWithDirection:(TWTransitionDirection)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"pageCurl"];
    [animation setSubtype:[self directionStringForTransitionDirection:direction]];
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)tw_uncurlAnimationWithDirection:(TWTransitionDirection)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"pageUnCurl"];
    [animation setSubtype:[self directionStringForTransitionDirection:direction]];
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)tw_rotateAndScaleEffectsAnimation
{
    [UIView animateWithDuration:0.75
                     animations:^
     {
         self.transform = CGAffineTransformMakeScale(0.001, 0.001);
         
         CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
         animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0.70, 0.40, 0.80) ];//旋转形成一道闪电。
         //animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0.0, 1.0, 0.0) ];//y轴居中对折番。
         //animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 1.0, 0.0, 0.0) ];//沿X轴对折翻转。
         //animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0.50, -0.50, 0.50) ];
         //animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0.1, 0.2, 0.2) ];
         
         animation.duration = 0.45;
         animation.repeatCount = 1;
         [self.layer addAnimation:animation forKey:nil];
     }
                     completion:^(BOOL finished)
     {
         [UIView animateWithDuration:0.75 animations:^{
              self.transform = CGAffineTransformMakeScale(1.0, 1.0);
          }];
     }];
}


- (void)tw_moveAnimationWithDirection:(TWTransitionDirection)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:kCATransitionMoveIn];
    [animation setSubtype:[self directionStringForTransitionDirection:direction]];
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)tw_cubeAnimationWithDirection:(TWTransitionDirection)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"cube"];
    [animation setSubtype:[self directionStringForTransitionDirection:direction]];
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)tw_rippleAnimation
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"rippleEffect"];
    [animation setSubtype:kCATransitionFromRight];
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)tw_cameraEffectAnimation:(BOOL)open
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:open ? @"cameraIrisHollowOpen" : @"cameraIrisHollowClose"];
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)tw_suckEffectAnimation
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"suckEffect"];
    [animation setSubtype:kCATransitionFromRight];
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)tw_bounceInAnimation
{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.0001];
    [self setAlpha:0.8];
	[self setTransform:CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1)];
	[UIView commitAnimations];
}

- (void)tw_bounceOutAnimation
{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.73];
//    [UIView setAnimationDelay:0.2];
    [self setAlpha:1.0];
	[self setTransform:CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)];
	[UIView commitAnimations];
}

- (void)tw_bounceAnimation
{
    CGRect rect = self.bounds;
    CGPoint center = self.center;
    [self setCenter:CGPointMake(160, 240)];
    [self setFrame:CGRectZero];
    
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.75];
    [self setAlpha:1.0];
    [self setBounds:rect];
    [self setCenter:center];
	[UIView commitAnimations];
}

@end
