//
//  LangHttp.m
//  IosLangTest
//
//  Created by jessie on 2018/3/19.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "LangHttp.h"

@implementation LangHttp
+(void)requestPost:(NSString *)urlPath withParameters:(NSDictionary *)parameters withProtocol:delegate withTag:(int)tag{
    [delegate startAnimating];
    [HttpU requestPost:urlPath withParameters:parameters  completedBlock:^(id responseObject) {
        [delegate stopAnimating];
        NSDictionary *dic=[LangUtil parseResponse:responseObject];
        if (dic!=nil&&[dic isKindOfClass:[NSDictionary class]]) {
            if(delegate!=nil&&[delegate respondsToSelector:@selector(success:tag:)]){
                [delegate success:dic tag:tag];
            }
        }else{
            if(delegate!=nil&&[delegate respondsToSelector:@selector(empty:)]){
                [delegate empty:tag];
            }
        }
    } failureBlock:^(NSError *error) {
        [delegate stopAnimating];
        if(delegate!=nil&&[delegate respondsToSelector:@selector(error:)]){
            [delegate error:tag];
        }
    }];
}
@end
