//
//  TWCell.h
//  TWApp
//
//  Created by line0 on 13-7-8.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  配合OTableDataSource和OTableDelegate两个类，实现tableView的数据源和代理的分离，减轻tableView主控制器的负担，使主控制器类更专注于逻辑控制功能。
    本类定义的所有方法皆为公用方法，默认不作任何处理，需要子类具体化后，重载相应的方法，实现具体的功能。
 */

@interface OCell : UITableViewCell

@property (strong, nonatomic) UIView *seprator;

/// 基类方法，由子类实现具体功能
- (void)configureCellWithCellData:(id)cellData;

/// 默认返回44，子类重载实现具体的高度
+ (CGFloat)cellHeightForCellData:(id)cellData;

@end
