//
//  ViewController.m
//  IosLangTest
//
//  Created by jessie on 2018/3/14.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILabel *label;
    UIImageView *imgView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)initView{
    label=[[UILabel alloc] init];
    label.frame=CGRectMake(50, 50, 100, 30);
    label.text=@"测试";
    [self.view addSubview:label];
    
    imgView=[[UIImageView alloc] init];
    imgView.frame=CGRectMake(50, label.bottom, 300, 250);
    [self.view addSubview:imgView];
    
}

-(void)initData{
    presenter=[[ViewControllPresenter alloc] initWithDelegate:self class:[MainModel class]];
    //注册model观察者
    [self setObserModelForAllKey];
    [presenter initData];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    //model改变 改变View
    label.text=[(MainModel*)presenter.model name];
    [imgView setPicImageStr:@"http://img.zcool.cn/community/01b0d857b1a34d0000012e7e87f5eb.gif" size:imgView.size];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
