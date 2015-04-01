//
//  TableDataSource.h
//  TWApp
//
//  Created by line0 on 13-7-8.
//  Copyright (c) 2013年 makeLaugh. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "OCell.h"

/**
 *  UITableView的数据源代理，本类设计的作用是为了给TableView的主类减负，让TableView的控制器类只专注于做逻辑管理，而把一些繁复的工作交给本类来完成。
    本类配合OTableViwDelegate和OCell，将TableView的dataSource和delegate两个代理分离，将本来需要在一个类里实现的任务，分解到三个类里，成功的让TableView的控制器的变得简单易理解和管理。
    以下定义了一个配置cell的block:
 
        typedef void (^CellConfigureBlock) (OCell *cell, id cellData)
 
    在这里，返回cell和该data，然后就可以将数据内容配置给cell，刷新显示。
 */

//Cell Block，用于配置Cell
typedef void (^CellConfigureBlock) (OCell *cell, id cellData, NSIndexPath *indexPath);

@interface OTableDataSource : NSObject <UITableViewDataSource>
/// 数据源，由数据模型给定
@property (strong, nonatomic) NSMutableArray                *tableData;
/// cell标志位，在初始化cell时返回。
@property (copy, nonatomic, readonly) NSString              *cellIdentifier;
/// 配置cell的block，详细定义见上，在初始化时返回
@property (copy, nonatomic, readonly) CellConfigureBlock    cellConfigureBlock;

/**
 *  初始化cell方法
 *
 *  @param cellIdentifier     cell标志位, cell复用时使用.
 *  @param cellConfigureBlock 配置cell的具体内容，在cellForRow代理调用时，会调用本block，给相应的cell配置数据
 *
 *  @return 本类生成的对象
 */
- (id)initWithCellIdentifier:(NSString *)cellIdentifier
          cellconfigureBlock:(CellConfigureBlock)cellConfigureBlock;

/**
 *  @param indexPath cell所在的路径位置
 *
 *  @return cell在该位置下的数据内容
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
