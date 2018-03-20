//
//  ViewControllPresenter.m
//  IosLangTest
//
//  Created by jessie on 2018/3/15.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "ViewControllPresenter.h"

@implementation ViewControllPresenter
-(void)initData{
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    [LangHttp requestPost:@"http://www.mihui365.com/Farm_Mobile/sysAction!queryVerNew.action" withParameters:params withProtocol:self withTag:10];
}
- (void)success:(NSDictionary *)dic tag:(int)tag{
    [self.model setValue:dic[@"message"] forKey:@"name"];
}
- (void)empty:(int)tag{
    
}
- (void)error:(int)tag{
    
}
@end
