//
//  TableDataSource.m
//  TWApp
//
//  Created by line0 on 13-7-8.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import "OTableDataSource.h"

@interface OTableDataSource ()
@property (copy, nonatomic) NSString            *cellIdentifier;
@property (copy, nonatomic) CellConfigureBlock  cellConfigureBlock;

@end

@implementation OTableDataSource

- (id)initWithCellIdentifier:(NSString *)cellIdentifier cellconfigureBlock:(CellConfigureBlock)cellConfigureBlock
{
    self = [super init];
    if (self)
    {
        self.cellIdentifier     = cellIdentifier;
        self.cellConfigureBlock = [cellConfigureBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.tableData[indexPath.row];
}


#pragma mark - TableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    id item = [self itemAtIndexPath:indexPath];
    self.cellConfigureBlock(cell, item, indexPath);
    return cell;
}

@end
