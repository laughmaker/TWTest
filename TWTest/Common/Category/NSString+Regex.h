//
//  NSString+Regex.h
//  XMMuseum
//
//  Created by 何振东 on 14/9/3.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regex)
- (BOOL)isValidateEmail;//邮箱符合性验证。
- (BOOL)isNumber;//全是数字。
- (BOOL)isEnglishWords;//验证英文字母。
- (BOOL)isValidatePassword;//验证密码：6—16位，只能包含字符、数字和 下划线。
- (BOOL)isChineseWords;//验证是否为汉字。
- (BOOL)isInternetUrl;//验证是否为网络链接。

//正确格式为：XXXX-XXXXXXX，XXXX-XXXXXXXX，XXX-XXXXXXX，XXX-XXXXXXXX，XXXXXXX，XXXXXXXX
- (BOOL)isPhoneNumber;//验证是否为电话号码。
- (BOOL)isElevenDigitNum;
- (BOOL)isIdentifyCardNumber;//验证15或18位身份证。

@end
