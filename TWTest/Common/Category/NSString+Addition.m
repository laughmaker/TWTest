//
//  NSString+Addition.m
//  XMMuseum
//
//  Created by 何振东 on 14/8/4.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "NSString+Addition.h"

@implementation NSString (Addition)

- (CGFloat)heightForConstraintSize:(CGSize)constrainSize font:(UIFont *)font
{
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGRect rect = [self boundingRectWithSize:constrainSize
                                    options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                 attributes:attributes
                                    context:nil];
    return rect.size.height;
}

+ (NSString *)timestampFromTimeDuration:(NSTimeInterval)duration
{
    NSInteger hour = duration / (60 * 60);
    NSInteger min = (duration - 60 * 60 * hour)/60;
    NSInteger sec = duration - 60 * 60 * hour - min * 60;
    
    NSString *h = nil;
    if (hour >= 10) {
        h = [NSString stringWithFormat:@"%ld", (long)hour];
    }
    else {
        h = [NSString stringWithFormat:@"0%ld", (long)hour];
    }
    
    NSString *m = nil;
    if (min >= 10) {
        m = [NSString stringWithFormat:@"%ld", (long)min];
    }
    else {
        m = [NSString stringWithFormat:@"0%ld", (long)min];
    }
    
    NSString *s = nil;
    if (sec >= 10) {
        s = [NSString stringWithFormat:@"%ld", (long)sec];
    }
    else {
        s = [NSString stringWithFormat:@"0%ld", (long)sec];
    }
    
    return [NSString stringWithFormat:@"%@:%@", m, s];
    
    return [NSString stringWithFormat:@"%@:%@:%@", h, m, s];
}

- (BOOL)containString:(NSString *)str
{
    if ([self rangeOfString:str].length > 0) {
        return YES;
    }
    
    return NO;
}

- (NSString *)encodeStringWithUTF8
{
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingISOLatin1);
    const char *c =  [self cStringUsingEncoding:encoding];
    NSString *str = [NSString stringWithCString:c encoding:NSUTF8StringEncoding];
    
    return str;
}


@end
