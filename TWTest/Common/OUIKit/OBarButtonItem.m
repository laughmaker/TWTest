//
//  TWBarButtonItem.m
//  MyQR
//
//  Created by line0 on 13-12-28.
//  Copyright (c) 2013年 ThreeWater. All rights reserved.
//

#import "OBarButtonItem.h"

@implementation OBarButtonItem

- (id)initWithSize:(CGSize)size image:(UIImage *)image
{
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.bounds = CGRectMake(0, 0, size.width, size.height);
    [self.btn setImage:image forState:UIControlStateNormal];
//    [self.btn setTitleColor:kBlackColor forState:UIControlStateNormal];
//    self.btn.titleLabel.font = kB_MiddleFont;
    self.btn.showsTouchWhenHighlighted = YES;
    
    self = [super initWithCustomView:self.btn];

    return self;
}

- (id)initWithSize:(CGSize)size title:(NSString *)title
{
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.bounds = CGRectMake(0, 0, size.width, size.height);
    [self.btn setTitle:title forState:UIControlStateNormal];
//    [self.btn setTitleColor:kBlackColor forState:UIControlStateNormal];
    self.btn.titleLabel.font = [UIFont systemFontOfSize:15];
    self.btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.btn.showsTouchWhenHighlighted = YES;
//    self.btn.backgroundColor = kClearColor;
    
    self = [super initWithCustomView:self.btn];
    
    return self;
}

@end
