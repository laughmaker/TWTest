//
//  NSArray+WIFI.m
//  XMThinMe
//
//  Created by 何振东 on 14/11/20.
//  Copyright (c) 2014年 寻觅. All rights reserved.
//

#import "NSArray+WIFI.h"

@implementation NSArray (WIFI)

+ (id)fetchSSIDInfo
{
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) { break; }
    }
    return info;
}

@end
