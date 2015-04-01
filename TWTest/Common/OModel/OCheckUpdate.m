//
//  XMCheckUpdate.m
//  XMMuseum
//
//  Created by 何振东 on 14/10/31.
//  Copyright (c) 2014年 XM. All rights reserved.
//

#import "OCheckUpdate.h"


//此链接为苹果官方查询App的接口。
#define kAPPURL     @"http://itunes.apple.com/lookup?id="

@interface OCheckUpdate ()
@property (copy, nonatomic) NSString *updateUrl;
@property (assign, nonatomic) BOOL hasNew;

@end

@implementation OCheckUpdate

+ (id)sharedInstance
{
    static OCheckUpdate *checkUpdate = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        checkUpdate = [[OCheckUpdate alloc] init];
    });
    return checkUpdate;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)checkUpdateCompletion:(void (^)(BOOL hasNew))completion
{
    mWeakSelf;
    NSString *url = [NSString stringWithFormat:@"%@%@", kAPPURL, kAppId];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        if (error) {
            self.hasNew = NO;
            if (completion) {
                completion(NO);
            }
            return ;
        }
        NSString *localVersion = [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"];
        NSString *appName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
        NSDictionary *remoteInfo = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSString *latestVersion = [remoteInfo[@"results"] firstObject][@"version"];
        NSString *releaseNotes = [remoteInfo[@"results"] firstObject][@"releaseNotes"];
        weakSelf.updateUrl = [remoteInfo[@"results"] firstObject][@"trackViewUrl"];
        NSString *title = [NSString stringWithFormat:@"%@ %@", appName, latestVersion];
        if ([latestVersion compare:localVersion] == NSOrderedDescending) {
            [weakSelf bk_performBlock:^(id obj) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:releaseNotes delegate:self cancelButtonTitle:@"忽略" otherButtonTitles:@"更新", nil];
                [alertView show];
            } onQueue:dispatch_get_main_queue() afterDelay:0];
            self.hasNew = YES;
            if ((completion)) {
                completion(YES);
            }
        }
        else {
            if (completion) {
                completion(NO);
            }
            self.hasNew = NO;
        }
    }];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.updateUrl]];
    }
}


@end
