//
//  LangUtil.h
//  IosLangTest
//
//  Created by jessie on 2018/3/16.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "AFNetworkReachabilityManager.h"
#import <WebKit/WebKit.h>

@interface LangUtil : NSObject
+ (BOOL)objectHasSetter:(NSObject *)object propertyName:(NSString *)propertyName;
+ (BOOL)objectHasGetter:(NSObject *)object propertyName:(NSString *)propertyName;
+(NSDictionary *)parseResponse:(NSString *)responseStr;
+(void)showToastUseMBHub:(UIView *)view showText:(NSString *)text;
+(void)startLisNetStatue:(UIView *)view;
+(void)stopLisNetStatue;
//清除wkwebView缓存
+ (void)deleteWebCache;
+(NSString*)getVersionCode;
+(BOOL)isEmpty:(NSString *)str;
//获取url中的key的值
+(NSString *)getUrlParam:(NSString *)url key:(NSString *)key;
@end
