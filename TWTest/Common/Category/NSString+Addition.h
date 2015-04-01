//
//  NSString+Addition.h
//  XMMuseum
//
//  Created by 何振东 on 14/8/4.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)
- (CGFloat)heightForConstraintSize:(CGSize)constrainSize font:(UIFont *)font;
+ (NSString *)timestampFromTimeDuration:(NSTimeInterval)duration;
- (BOOL)containString:(NSString *)str;
- (NSString *)encodeStringWithUTF8;

@end
