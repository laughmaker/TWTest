//
//  NSNumber+Carry.h
//  XMMuseum
//
//  Created by 何振东 on 14-7-3.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Carry)
/**
 *  将十进制数转十六进制
 *
 *  @return 返回转换后的十六进制数
 */
- (NSString *)toHex;

@end
