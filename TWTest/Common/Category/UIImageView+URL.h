//
//  UIImageView+URL.h
//  XMThinMe
//
//  Created by 何振东 on 14/12/5.
//  Copyright (c) 2014年 寻觅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (URL)
- (void)setImageWithURLRequest:(NSURLRequest *)urlRequest success:(void (^)(UIImage *))success;

@end
