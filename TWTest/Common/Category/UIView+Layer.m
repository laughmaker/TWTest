//
//  UIView+Corner.m
//  XMMuseum
//
//  Created by 何振东 on 14-6-28.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "UIView+Layer.h"

@implementation UIView (Layer)

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.clipsToBounds = YES;
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

- (void)setBoderColor:(UIColor *)color width:(CGFloat)width
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

@end
