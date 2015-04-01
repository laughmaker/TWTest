//
//  UISearchBar+Subviews.m
//  TWSearchBar
//
//  Created by line0 on 13-10-25.
//  Copyright (c) 2013年 threeWater. All rights reserved.
//

#import "UISearchBar+Subviews.h"

@implementation UISearchBar (Subviews)

- (UITextField *)textField
{
    for (UIView *v in self.subviews)
    {
        if ([v isKindOfClass:NSClassFromString(@"UISearchBarTextField")])
        {
            for (CALayer *layer in v.layer.sublayers)
            {
                layer.hidden = YES;
            }
            return (UITextField *)v;
        }

        for (UIView *vv in v.subviews)
        {
            if ([vv isKindOfClass:NSClassFromString(@"UISearchBarTextField")])
            {
                return (UITextField *)vv;
            }
        }
    }

    return nil;
}

- (void)setTextField:(UITextField *)_textField{}

- (UIImageView *)backgroundImgView
{
    for (UIView *v in self.subviews)
    {
        if ([v isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
        {
            return (UIImageView *)v;
        }

        for (UIView *vv in v.subviews)
        {
            if ([vv isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
            {
                return (UIImageView *)vv;
            }
        }
    }

    return nil;
}

- (void)setBackgroundImgView:(UIImageView *)backgroundImgView{}

- (UIButton *)cancelButton
{
    for (UIView *v in self.subviews)
    {
        if ([v isKindOfClass:NSClassFromString(@"UINavigationButton")])
        {
            return (UIButton *)v;
        }

        for (UIView *vv in v.subviews)
        {
            if ([vv isKindOfClass:NSClassFromString(@"UINavigationButton")])
            {
                return (UIButton *)vv;
            }
        }
    }
    return nil;
}

- (void)setCancelButton:(UIButton *)cancelButton{}

@end
