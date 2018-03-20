//
//  BaseLangModel.m
//  IosLangTest
//
//  Created by jessie on 2018/3/16.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "BaseLangModel.h"

@implementation BaseLangModel
-(void)setValue:(id)value forKey:(NSString *)key{
    if([LangUtil objectHasSetter:self propertyName:key]){
        [super setValue:value forKey:key];
    }
}
@end
