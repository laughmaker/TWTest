//
//  UIView+Corner.h
//  XMMuseum
//
//  Created by 何振东 on 14-6-28.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layer)
@property (assign, nonatomic) CGFloat cornerRadius;

- (void)setBoderColor:(UIColor *)color width:(CGFloat)width;

@end
