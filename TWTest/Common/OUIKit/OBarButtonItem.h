//
//  TWBarButtonItem.h
//  MyQR
//
//  Created by line0 on 13-12-28.
//  Copyright (c) 2013年 ThreeWater. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  顶部导航栏的按钮控件，由于iOS7和之前的系统，导航栏样式差别很大，继承本类，则可统一外观样式。
 */

@interface OBarButtonItem : UIBarButtonItem
@property (strong, nonatomic) UIButton *btn;

- (id)initWithSize:(CGSize)size title:(NSString *)title;
- (id)initWithSize:(CGSize)size image:(UIImage *)image;


@end
