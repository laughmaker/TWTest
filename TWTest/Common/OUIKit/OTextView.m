//
//  TWTextView.m
//  TWAppNew
//
//  Created by line0 on 13-8-28.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "OTextView.h"

@interface OTextView () <UITextViewDelegate>
@property (strong, nonatomic) UILabel *placeholderLbl;

@end

@implementation OTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.cornerRadius = 4;
        self.clipsToBounds = YES;
        self.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.2].CGColor;
        self.layer.borderWidth = 1;
        self.delegate = self;
        self.textColor = kBlackColor;
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
        [self setFont:kN_MiddleFont];
        self.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
        self.linkTextAttributes = @{NSForegroundColorAttributeName:[UIColor blueColor], NSUnderlineColorAttributeName: [UIColor redColor]};

        self.placeholderLbl = [[UILabel alloc] initWithFrame:CGRectMake(5, 6, self.width, self.height)];
        self.placeholderLbl.numberOfLines = 0;
        self.placeholderLbl.font = self.font;
        self.placeholderLbl.enabled = NO;
        self.placeholderLbl.textColor = [UIColor colorWithRed:0.562 green:0.563 blue:0.586 alpha:0.050];
        [self addSubview:self.placeholderLbl];
    }
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.placeholderLbl.text = placeholder;
    [self.placeholderLbl sizeToFit];
}

-(void)textViewDidChange:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        self.placeholderLbl.hidden = NO;
    }
    else {
        self.placeholderLbl.hidden = YES;
    }
}


@end
