//
//  TWLabel.m
//  TWApp
//
//  Created by line0 on 13-7-6.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "OLabel.h"

@implementation OLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.font = kN_MiddleFont;
        self.textColor = kBlackColor;
    }
    return self;
}


@end
