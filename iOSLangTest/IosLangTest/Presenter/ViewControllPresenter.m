//
//  ViewControllPresenter.m
//  IosLangTest
//
//  Created by jessie on 2018/3/15.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "ViewControllPresenter.h"
#import "MainModel.h"
@interface ViewControllPresenter ()
{
    NSMutableArray *array;
    MainModel *mainmodel;
}
@end
@implementation ViewControllPresenter
-(void)initModel{
    array=[[NSMutableArray alloc] init];
    [array addObject:@"111111"];
    mainmodel=((MainModel*)self.model);
    mainmodel.array=array;
    mainmodel.tag=1;
    NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    [LangHttp requestPost:@"http://192.168.1.1/Farm_Mobile/sysAction!queryVerNew.action" withParameters:params withProtocol:self withTag:10];
}
- (void)success:(NSDictionary *)dic tag:(int)tag{
    mainmodel.name=dic[@"message"];
    [array addObject:@"22222"];
    mainmodel.array=array;
    mainmodel.tag=2;
}
- (void)empty:(int)tag{
    
}
- (void)error:(int)tag{
    mainmodel.tag=3;
}
@end
