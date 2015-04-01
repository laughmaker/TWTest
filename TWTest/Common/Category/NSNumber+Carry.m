//
//  NSNumber+Carry.m
//  XMMuseum
//
//  Created by 何振东 on 14-7-3.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "NSNumber+Carry.h"

@implementation NSNumber (Carry)

- (NSString *)toHex
{
    long tmpid = [self longValue];
    NSString *nLetterValue;
    NSString *str = @"";
    long long int ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig = tmpid%16;
        tmpid = tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue = @"A";break;
            case 11:
                nLetterValue = @"B";break;
            case 12:
                nLetterValue = @"C";break;
            case 13:
                nLetterValue = @"D";break;
            case 14:
                nLetterValue = @"E";break;
            case 15:
                nLetterValue = @"F";break;
            default:nLetterValue = [[NSString alloc] initWithFormat:@"%lli", ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break; 
        }  
    }

    switch (str.length) {
        case 1:
            str = [@"000" stringByAppendingString:str];
            break;
        case 2:
            str = [@"00" stringByAppendingString:str];
            break;
        case 3:
            str = [@"0" stringByAppendingString:str];
            break;
    }

    return [str lowercaseString];
}

@end
