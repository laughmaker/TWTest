//
//  TWTextField.m
//  TWApp
//
//  Created by line0 on 13-7-6.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "OTextField.h"

@implementation OTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self defaultInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self defaultInit];
    }
    return self;
}

- (void)defaultInit
{
    self.layer.cornerRadius = 4;
    self.clipsToBounds = YES;
    self.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.2].CGColor;
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    self.layer.borderWidth = 1;
    self.font = kN_MiddleFont;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    if (self.leftView) {
        return CGRectInset(bounds, 35, 2.5);
    }
    
	return CGRectInset(bounds, 5, 2.5);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    if (self.leftView) {
        return CGRectInset(bounds, 35, 2.5);
    }

	return CGRectInset(bounds, 5, 2.5);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    if (self.leftView) {
        return CGRectInset(bounds, 35, 2.5);
    }

	return CGRectInset(bounds, 5, 2.5);
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
	return CGRectInset(CGRectMake(0, 0, 30, self.height), 3, 3);
}


@end
