//
//  LangUtil.h
//  IosLangTest
//
//  Created by jessie on 2018/3/16.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LangUtil : NSObject
+ (BOOL)objectHasSetter:(NSObject *)object propertyName:(NSString *)propertyName;
+ (BOOL)objectHasGetter:(NSObject *)object propertyName:(NSString *)propertyName;
+(NSDictionary *)parseResponse:(NSString *)responseStr;
@end
