//
//  HttpU.m
//  IosLangTest
//
//  Created by jessie on 2018/3/19.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "HttpU.h"

@implementation HttpU
+(void)requestPost:(NSString *)urlPath withParameters:(NSDictionary *)parameters completedBlock:(void(^)(id responseObject))completedBlock failureBlock:(void(^)(NSError *error))failureBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedClient];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];//设置相应内容类型
    manager.requestSerializer.timeoutInterval = 10.f;//设置超时时长
    manager.requestSerializer.HTTPShouldHandleCookies = YES;
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    version = [version stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    NSMutableDictionary * mutPara = [[NSMutableDictionary alloc] init];
    [mutPara addEntriesFromDictionary:parameters];
    [mutPara setObject:version forKey:@"versionIos"];
    
    NSLog(@"=请求地址=%@",urlPath);
    NSLog(@"=请求参数=%@",mutPara);
    
    [manager POST:urlPath parameters:mutPara success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString *responseStr = [responseObject jsonEncodedKeyValueString];
        NSLog(@"请求返回数据===%@",responseStr);
        completedBlock(responseStr);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"请求失败的原因%@",error);
        failureBlock(error);
        
    }];
}

@end
