//
//  NSArray+WIFI.h
//  XMThinMe
//
//  Created by 何振东 on 14/11/20.
//  Copyright (c) 2014年 寻觅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/CaptiveNetwork.h>

@interface NSArray (WIFI)

+ (id)fetchSSIDInfo;

@end
