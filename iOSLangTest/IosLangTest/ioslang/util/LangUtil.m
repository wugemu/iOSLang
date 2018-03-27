//
//  LangUtil.m
//  IosLangTest
//
//  Created by jessie on 2018/3/16.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "LangUtil.h"

@implementation LangUtil
+ (BOOL)objectHasSetter:(NSObject *)object propertyName:(NSString *)propertyName
{
    NSString *setterString = [NSString stringWithFormat:@"set%@%@:",
                              [[propertyName substringToIndex:1] capitalizedString],
                              [propertyName substringFromIndex:1]];
    return [object respondsToSelector:NSSelectorFromString(setterString)];
}

+ (BOOL)objectHasGetter:(NSObject *)object propertyName:(NSString *)propertyName
{
    return [object respondsToSelector:NSSelectorFromString(propertyName)];
}

/*
 解析服务端是否返回合法结果
 */
+(NSDictionary *)parseResponse:(NSString *)responseStr{
    
    NSData *data;
    if ([responseStr isKindOfClass:[NSDictionary class]]) {
        data = [NSJSONSerialization dataWithJSONObject:responseStr options:NSJSONWritingPrettyPrinted error:nil];
    }else{
        data = [responseStr dataUsingEncoding:NSUTF8StringEncoding];
    }
    if (IsNilOrNull(data)) {
        return nil;
    }
    NSError *error = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    return dictionary;
}

/*
 显示吐司
 */
+(void)showToastUseMBHub:(UIView *)view showText:(NSString *)text{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    //    hud.labelText = text;
    hud.detailsLabelText = text;
    hud.margin = 10.f;
    hud.yOffset = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.5];
    
}
@end
