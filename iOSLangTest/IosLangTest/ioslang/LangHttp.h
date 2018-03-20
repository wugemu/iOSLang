//
//  LangHttp.h
//  IosLangTest
//
//  Created by jessie on 2018/3/19.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LangHttpProtocol.h"
#import "HttpU.h"
@interface LangHttp : NSObject
+(void)requestPost:(NSString *)urlPath withParameters:(NSDictionary *)parameters withProtocol:(id<LangHttpProtocol>)delegate withTag:(int)tag;
@end
