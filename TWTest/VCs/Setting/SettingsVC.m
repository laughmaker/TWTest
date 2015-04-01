//
//  SettingVC.m
//  TWTest
//
//  Created by 何振东 on 15/3/31.
//  Copyright (c) 2015年 TW. All rights reserved.
//

#import "SettingsVC.h"
#import "OURLRequest.h"

@interface SettingsVC ()

@end

@implementation SettingsVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"settings";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //下载示例
//    NSString *imagePath = @"http://pic4.nipic.com/20090922/3390849_082619386284_2.jpg";
//    [[OURLRequest request] downloadFile:imagePath toPath:kDocuments completionHandler:^(NSString *aFilePath, NSError *error) {
//        UIImage *image = [UIImage imageWithContentsOfFile:aFilePath];
//        UIImageView *imgView  = [[UIImageView alloc] initWithFrame:self.view.bounds];
//        imgView.backgroundColor = [UIColor brownColor];
//        imgView.image = image;
//        [self.view addSubview:imgView];
//
//    } progress:^(CGFloat per) {
//        NSLog(@"per:%lf", per);
//    }];
    
    // POST请求示例，返回传递的参数
    NSDictionary *params = @{@"name":@"hzdddddd", @"gender":@(1), @"nickname":@"wskrdfeai"};
//    NSString *urlPath = @"http://api.3water3.com/user/say";
//    [OURLRequest post:urlPath params:params completionHandler:^(id data, NSError *error) {
//        NSLog(@"data:%@", data);
//    }];
    
    /// 上传示例
    NSString *uploadUrl = @"http://120.24.84.249/index.php";
    NSString *path = [[NSBundle mainBundle] pathForResource:@"a" ofType:@"mp4"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    [[OURLRequest request] uploadFile:data filename:@"fffd.mp4" fileType:OFileTypeMP4 params:params toPath:uploadUrl completionHandler:^(id data, NSError *error)
    {
        NSLog(@"end:%@", [NSDate date]);
        
        NSLog(@"data:%@", data);
    }
                             progress:^(CGFloat per)
    {
        NSLog(@"per:%f", per);

        if (per == 1.0) {
            NSLog(@"eee:%@", [NSDate date]);
        }
    }];
    
    // 普通不带进度条的上传
//    [OURLRequest uploadFile:data filename:@"facfffe3333333.mp4" fileType:OFileTypeMP4 params:params toPath:uploadUrl completionHandler:^(id data, NSError *error)
//    {
//        NSLog(@"data:%@", data);
//    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
