//
//  OURLRequest.m
//  TWTest
//
//  Created by 何振东 on 15/3/31.
//  Copyright (c) 2015年 TW. All rights reserved.
//

#import "OURLRequest.h"
#import "BlocksKit.h"

@interface OURLRequest ()<NSURLSessionDataDelegate, NSURLSessionTaskDelegate>
/// 下载成功后代理
@property (copy, nonatomic) void (^downloadComptionHandler) (NSString *aFilePath, NSError *error);

/// 上传下载进度
@property (copy, nonatomic) void (^progress) (CGFloat per);

@end

@implementation OURLRequest

+ (instancetype)request
{
    return [[OURLRequest alloc] init];
}

+ (void)post:(NSString *)urlPath params:(NSDictionary *)params completionHandler:(void (^)(id data, NSError *error))completionHandler
{
    [[self class] post:urlPath params:params tag:-1 completionHandler:^(id data, NSError *error, NSInteger tag) {
        if (completionHandler) {
            [self bk_performBlock:^{
                completionHandler(data, error);
            } onQueue:dispatch_get_main_queue() afterDelay:0];
        }
    }];
}

+ (void)post:(NSString *)urlPath params:(NSDictionary *)params tag:(NSUInteger)tag completionHandler:(void (^)(id data, NSError *error, NSInteger tag))completionHandler
{
    NSURLRequest *request = [[self class] requestForPath:urlPath withParams:params];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        id responseObject = nil;
        NSError *err = nil;
        if (data) {
             responseObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
        }
        if (completionHandler) {
            [self bk_performBlock:^{
                completionHandler(responseObject, error, tag);
            } onQueue:dispatch_get_main_queue() afterDelay:0];
        }
    }];
    [task resume];
}

+ (void)downloadFile:(NSString *)fileUrl toPath:(NSString *)path completionHandler:(void (^)(NSString *aFilePath, NSError *error))completionHandler
{
    NSURL *url = [NSURL URLWithString:fileUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:600];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error)
    {
        [self bk_performBlock:^{
            if (location) {
                NSData *data = [NSData dataWithContentsOfURL:location];
                NSString *filePath = [NSString stringWithFormat:@"%@/%@", kDocuments, url.lastPathComponent];
                [data writeToFile:filePath atomically:YES];
                if (completionHandler) {
                    completionHandler(filePath, error);
                }
            } else {
                if (completionHandler) {
                    completionHandler(nil, error);
                }
            }
        } onQueue:dispatch_get_main_queue() afterDelay:0];
    }];
    [task resume];
}


- (void)downloadFile:(NSString *)fileUrl toPath:(NSString *)path completionHandler:(void (^)(NSString *aFilePath, NSError *error))completionHandler progress:(void (^)(CGFloat per))progress
{
    self.downloadComptionHandler = completionHandler;
    self.progress = progress;
    
    NSURL *url = [NSURL URLWithString:fileUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:600];
    NSURLSessionConfiguration *configure = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configure delegate:self delegateQueue:nil];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];
    [task resume];
}

+ (void)uploadFile:(NSData *)fileData filename:(NSString *)filename fileType:(OFileType)fileType params:(NSDictionary *)params toPath:(NSString *)toPath completionHandler:(void (^)(id data, NSError *error))completionHandler;
{
    mWeakSelf;

    NSURLRequest *request = [[self class] uploadRequestForPath:toPath withPath:params fileType:fileType filename:filename fileData:fileData];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        [[weakSelf class] handleUploadWithData:data error:error compleTionHanlder:completionHandler];
    }];
    [dataTask resume];
}

- (void)uploadFile:(NSData *)fileData filename:(NSString *)filename fileType:(OFileType)fileType params:(NSDictionary *)params toPath:(NSString *)toPath completionHandler:(void (^)(id data, NSError *error))completionHandler progress:(void (^)(CGFloat per))progress;
{
    mWeakSelf;

    self.progress = progress;

    NSURLRequest *request = [[self class] uploadRequestForPath:toPath withPath:params fileType:fileType filename:filename fileData:fileData];
    NSURLSessionConfiguration *configure = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configure delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        [[weakSelf class] handleUploadWithData:data error:error compleTionHanlder:completionHandler];
    }];
    [task resume];
}

+ (void)handleUploadWithData:(NSData *)data error:(NSError *)error compleTionHanlder:(void (^)(id data, NSError *error))completionHandler
{
    mWeakSelf;
    if (completionHandler) {
        [weakSelf bk_performBlock:^{
            if (error) {
                completionHandler(nil, error);
            } else {
                NSError *err = nil;
                id responseObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
                if (err) {
                    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    completionHandler(str, err);
                } else {
                    completionHandler(responseObject, err);
                }
            }
        } onQueue:dispatch_get_main_queue() afterDelay:0];
    }
}

+ (NSURLRequest *)uploadRequestForPath:(NSString *)toPath  withPath:(NSDictionary *)params fileType:(OFileType)fileType filename:(NSString *)filename fileData:(NSData *)fileData
{
    NSString *bounary = @"AaB03x";
    NSString *endBounary = [[NSString alloc]initWithFormat:@"\r\n--%@--", bounary];
    
    NSMutableString *bodyStr = [[NSMutableString alloc] init];
    
    for (NSString *key in params.allKeys) {
        [bodyStr appendFormat:@"--%@\r\n", bounary];
        [bodyStr appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", key];
        [bodyStr appendFormat:@"%@\r\n", params[key]];
    }
    
    [bodyStr appendFormat:@"--%@\r\n", bounary];
    [bodyStr appendFormat:@"Content-Disposition: form-data; name=\"file\"; filename=\"%@\"\r\n", filename];
    [bodyStr appendFormat:@"Content-Type: %@\r\n\r\n", [[self class] fileType:fileType]];
    
    NSMutableData *bodyData = [NSMutableData data];
    [bodyData appendData:[bodyStr dataUsingEncoding:NSUTF8StringEncoding]];
    [bodyData appendData:fileData];
    [bodyData appendData:[endBounary dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSString *contentType=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@", bounary];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:toPath]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:600];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%zd", [bodyData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:bodyData];
    [request setHTTPMethod:@"POST"];

    return request;
}

+ (void)synchronousRequest:(NSString *)urlPath params:(NSDictionary *)params completionHandler:(void (^)(id data, NSError *error))completionHandler
{
    NSURLRequest *request = [[self class] requestForPath:urlPath withParams:params];
    
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    id responseObject = nil;
    if (data) {
        responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    }
    if (completionHandler) {
        [self bk_performBlock:^{
            completionHandler(responseObject, error);
        } onQueue:dispatch_get_main_queue() afterDelay:0];
    }
}

+ (NSURLRequest *)requestForPath:(NSString *)urlPath withParams:(NSDictionary *)params
{
    NSString *bounary = @"AaB03x";
    NSMutableString *bodyStr = [NSMutableString string];
    
    for (NSString *key in params.allKeys) {
        [bodyStr appendFormat:@"--%@\r\n", bounary];
        [bodyStr appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", key];
        [bodyStr appendFormat:@"%@\r\n", params[key]];
    }
    [bodyStr appendFormat:@"--%@\r\n", bounary];
    
    NSData *bodyData = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlPath];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    NSString *contentType=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@", bounary];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%zd", [bodyData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:bodyData];
    [request setHTTPMethod:@"POST"];
    
    return request;
}

+ (NSString *)fileType:(OFileType)type
{
    NSString *fileType = @"image/png";
    switch (type) {
        case OFileTypeMP4:
            fileType = @"video/mpeg4";
            break;
        case OFileTypePNG:
            fileType = @"image/png";
            break;
        case OFileTypeJPG:
            fileType = @"image/jpg";
            break;
        case OFileTypeGIF:
            fileType = @"image/gif";
            break;
        case OFileTypeJPEG:
            fileType = @"image/jpeg";
            break;
        case OFileTypeOther:
            fileType = @"file/other";
            break;
    }
    return fileType;
}


#pragma mark - dowonload delegate

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    if (self.progress) {
        mWeakSelf;
        [self bk_performBlock:^(id obj) {
            weakSelf.progress((float)totalBytesWritten/totalBytesExpectedToWrite);
        } onQueue:dispatch_get_main_queue() afterDelay:0];
    }
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    if (self.downloadComptionHandler) {
        mWeakSelf;
        [self bk_performBlock:^(id obj) {
            NSURL *url = downloadTask.currentRequest.URL;
            NSData *data = [NSData dataWithContentsOfURL:location];
            NSString *filePath = [NSString stringWithFormat:@"%@/%@", kDocuments, url.lastPathComponent];
            [data writeToFile:filePath atomically:YES];
            if (weakSelf.downloadComptionHandler) {
                weakSelf.downloadComptionHandler(filePath, nil);
            }
        } onQueue:dispatch_get_main_queue() afterDelay:0];
    }
}


#pragma mark - upload delegate

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend
{
    if (self.progress) {
        mWeakSelf;
        [self bk_performBlock:^(id obj) {
            weakSelf.progress((float)totalBytesSent/totalBytesExpectedToSend);
        } onQueue:dispatch_get_main_queue() afterDelay:0];
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    
}




@end
