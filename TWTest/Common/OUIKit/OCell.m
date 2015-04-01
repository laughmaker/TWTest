//
//  TWCell.m
//  TWApp
//
//  Created by line0 on 13-7-8.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "OCell.h"

@implementation OCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.backgroundColor = kClearColor;
        self.contentView.backgroundColor = kClearColor;
        self.seprator = [[UIView alloc] init];
        self.seprator.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
        [self.contentView addSubview:self.seprator];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.seprator.frame = CGRectMake(0, self.contentView.height - 0.5, self.contentView.width, 0.5);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

+ (CGFloat)cellHeightForCellData:(id)cellData
{
    return 44;
}

- (void)configureCellWithCellData:(id)cellData{}

@end
