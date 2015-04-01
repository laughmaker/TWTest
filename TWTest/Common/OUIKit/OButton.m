//
//  TWButton.m
//  TWAppNew
//
//  Created by line0 on 13-8-28.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "OButton.h"

@implementation OButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = kClearColor;
//        self.showsTouchWhenHighlighted = YES;
        self.titleLabel.font = kB_MiddleFont;
    }
    return self;
}

- (void)setNormalColor:(UIColor *)nColor highlightedColor:(UIColor *)hColor
{
    
}


@end
