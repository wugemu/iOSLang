//
//  ViewControllPresenter.m
//  IosLangTest
//
//  Created by jessie on 2018/3/15.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "ViewControllPresenter.h"
@interface ViewControllPresenter ()
{
    NSMutableArray *array;
}
@end
@implementation ViewControllPresenter
-(void)initData{
    array=[[NSMutableArray alloc] init];
    [array addObject:@"111111"];
    [self.model setValue:array forKey:@"array"];
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    [LangHttp requestPost:@"http://www.mihui365.com/Farm_Mobile/sysAction!queryVerNew.action" withParameters:params withProtocol:self withTag:10];
}
- (void)success:(NSDictionary *)dic tag:(int)tag{
    [self.model setValue:dic[@"message"] forKey:@"name"];
    [array addObject:@"22222"];
    [self.model setValue:array forKey:@"array"];
}
- (void)empty:(int)tag{
    
}
- (void)error:(int)tag{
    
}
@end
