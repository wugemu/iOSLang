//
//  HttpU.h
//  IosLangTest
//
//  Created by jessie on 2018/3/19.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "NSDictionary+RequestEncoding.h"
@interface HttpU : NSObject
+(void)requestPost:(NSString *)urlPath withParameters:(NSDictionary *)parameters  completedBlock:(void(^)(id responseObject))completedBlock failureBlock:(void(^)(NSError *error))failureBlock;
@end
