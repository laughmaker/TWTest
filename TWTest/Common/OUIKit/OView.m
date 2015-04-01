//
//  OView.m
//  XMMuseum
//
//  Created by 何振东 on 14/8/4.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "OView.h"

@implementation OView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.tintColor = kWhiteColor;
        self.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
    }
    return self;
}

- (void)configureViewWithViewData:(id)viewData{}



@end
