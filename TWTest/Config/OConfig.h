//
//  Config.h
//  TWTest
//
//  Created by 何振东 on 15/3/31.
//  Copyright (c) 2015年 TW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  AppConfig接口 定义APP中的相关配置
 *  包含社交网络帐号、用户简单个人信息、程序界面中的常用字体、字号、颜色等的通用定义等。
 */

/// 程序中用到的第三方帐号的相关Key和SecretKey


/// 用户相关信息存储字典key
static NSString *const kUser_UIDKey        = @"User_UIDKey";
static NSString *const kUser_NameKey       = @"User_NameKey";
static NSString *const kUser_NicknameKey   = @"User_NicknameKey";
static NSString *const kUser_PasswordKey   = @"User_PasswordKey";
static NSString *const kUser_HadLoginKey   = @"User_HadLoginKey";

/// 存储是否接受推送通知、是否有声音提示、是否震动提示，值为bool类型，程序第一次安装时，初始化为YES


/// 程序相关常数 App Id、下载地址、评价地址等
static NSString *const kAppId = @"899155970";

#define kAppUrl     [NSString stringWithFormat:@"https://itunes.apple.com/us/app/ling-hao-xian/id%@?ls=1&mt=8", kAppId]
#define kRateUrl    [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",kAppId]


/// 程序全局通知
static NSString *const kReLoginNotification  = @"ReLoginNotification";


/// 占位图片
#define kPlaceholderImage_square    [UIImage imageNamed:@"placeholder_square"]
#define kPlaceholderImage_rectangle [UIImage imageNamed:@"placeholder_rectangle"]

/// 常用三级加粗字体字号
#define kB_LargeFont   [UIFont boldSystemFontOfSize:20]
#define kB_MiddleFont  [UIFont boldSystemFontOfSize:18]
#define kB_SmallFont   [UIFont boldSystemFontOfSize:15]
/// 常用三级正常字体字号
#define kN_LargeFont   [UIFont systemFontOfSize:17]
#define kN_MiddleFont  [UIFont systemFontOfSize:15]
#define kN_SmallFont   [UIFont systemFontOfSize:12]
/// 内容部分正常显示颜色和突出显示颜色
#define kNormalColor      [UIColor colorWithRed:57/255.0 green:32/255.0 blue:0/255.0   alpha:1]
#define kHighlightColor   [UIColor colorWithRed:0/255.0 green:191/255.0 blue:225/255.0 alpha:1]
/// 几个常用色彩
#define kClearColor             [UIColor clearColor]
#define kWhiteColor             [UIColor whiteColor]
#define kBlackColor             [UIColor blackColor]


