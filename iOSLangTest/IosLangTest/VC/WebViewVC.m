//
//  WebViewVC.m
//  IosLangTest
//
//  Created by jessie on 2018/4/2.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "WebViewVC.h"
#import "BaseLangPresenter.h"
#import "BaseLangModel.h"
@interface WebViewVC ()

@end

@implementation WebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initPresenter{
    presenter=[[BaseLangPresenter alloc] initWithDelegate:self class:[BaseLangModel class]];
}

-(void)initData{
    [self loadUrl:self.url];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
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
