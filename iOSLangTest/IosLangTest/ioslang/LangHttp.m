//
//  LangHttp.m
//  IosLangTest
//
//  Created by jessie on 2018/3/19.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "LangHttp.h"

@implementation LangHttp
+(void)requestPost:(NSString *)urlPath withParameters:(NSDictionary *)parameters withProtocol:delegate success:(void(^)(NSDictionary *dic))base_success empty:(void(^)(void))base_empty error:(void(^)(void))base_error{
    [delegate startAnimating];
    [HttpU requestPost:urlPath withParameters:parameters  completedBlock:^(id responseObject) {
        [delegate stopAnimating];
        NSDictionary *dic=[LangUtil parseResponse:responseObject];
        if (dic!=nil&&[dic isKindOfClass:[NSDictionary class]]) {
            base_success(dic);
        }else{
            base_empty();
        }
    } failureBlock:^(NSError *error) {
        [delegate stopAnimating];
        base_error();
    }];
}
@end
