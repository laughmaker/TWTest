//
//  UISearchBar+Subviews.h
//  TWSearchBar
//
//  Created by line0 on 13-10-25.
//  Copyright (c) 2013年 threeWater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (Subviews)
@property (strong, nonatomic, readonly) UITextField   *textField;
@property (strong, nonatomic, readonly) UIImageView   *backgroundImgView;

//若隐藏取消按钮，则返回nil;
@property (strong, nonatomic, readonly) UIButton      *cancelButton;

@end
