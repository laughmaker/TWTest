//
//  TableDelegate.m
//  TWApp
//
//  Created by line0 on 13-7-8.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "OTableDelegate.h"
#import "OConfig.h"
#import "UIView+Positioning.h"

@implementation OTableDelegate

- (id)init
{
    self = [super init];
    if (self){
//        self.tableItems = [NSMutableArray array];
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellHeight){
       return self.cellHeight(indexPath);
    }

    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectCell){
        id item = self.tableData[indexPath.row];
        self.selectCell(indexPath, item);
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.width, 1)];
    view.backgroundColor = kClearColor;
    return view;
}


@end
