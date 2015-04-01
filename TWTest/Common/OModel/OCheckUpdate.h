//
//  XMCheckUpdate.h
//  XMMuseum
//
//  Created by 何振东 on 14/10/31.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

////此APP id为程序申请时得到。更改相应的id查询App的信息
//#define kAPPID @"593499239"

@interface OCheckUpdate : NSObject <UIAlertViewDelegate>
@property (copy, nonatomic, readonly) NSString *updateUrl;
@property (assign, nonatomic, readonly) BOOL hasNew;

+ (id)sharedInstance;
- (void)checkUpdateCompletion:(void (^)(BOOL hasNew))completion;

@end
