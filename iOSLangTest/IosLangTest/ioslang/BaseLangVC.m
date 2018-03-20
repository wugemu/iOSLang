//
//  BaseLangVC.m
//  IosLangTest
//
//  Created by jessie on 2018/3/15.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "BaseLangVC.h"

@interface BaseLangVC ()

@end

@implementation BaseLangVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    [self initData];
}

//单个设置观察 Model中的属性
-(void)setObserModel:(NSString *)key{
    if(OkeyList==nil){
        OkeyList=[[NSMutableArray alloc] init];
    }
    if(presenter!=nil&&presenter.model!=nil){
        [presenter.model addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew context:nil];
        [OkeyList addObject:key];
    }
}
//设置观察 Model中的全部属性
-(void)setObserModelForAllKey{
    if(OkeyList==nil){
        OkeyList=[[NSMutableArray alloc] init];
    }
    if(presenter!=nil&&presenter.model!=nil){
        unsigned int outCount, i;
        
        objc_property_t *properties = class_copyPropertyList([presenter.model class], &outCount);
        
        for (i = 0; i < outCount; i++) {
            
            objc_property_t property = properties[i];
            
            NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            
            [presenter.model addObserver:self forKeyPath:propertyName options:NSKeyValueObservingOptionNew context:nil];
            [OkeyList addObject:propertyName];
        }
    }
}

- (void)dealloc {
    if(presenter!=nil&&presenter.model!=nil&&OkeyList!=nil){
        for (int i=0; i<OkeyList.count; i++) {
            [presenter.model removeObserver:self forKeyPath:OkeyList[i]];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
