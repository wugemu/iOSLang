//
//  ViewController.m
//  IosLangTest
//
//  Created by jessie on 2018/3/14.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "ViewController.h"
#import "MainCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UILabel *label;
    UIImageView *imgView;
    UITableView *mTable;
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
    
    mTable = [[UITableView alloc] initWithFrame:CGRectMake(0, imgView.bottom, 300, 100) style:UITableViewStylePlain];
    mTable.delegate = self;
    mTable.dataSource = self;
    mTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    mTable.showsVerticalScrollIndicator = NO;
    mTable.scrollEnabled = YES;
    [self.view addSubview:mTable];
    
}

-(void)initData{
    presenter=[[ViewControllPresenter alloc] initWithDelegate:self class:[MainModel class]];
    //注册model观察者
    [self setObserModelForAllKey];
    [presenter initData];
}

#pragma mark------tableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[(MainModel*)presenter.model array] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"MainCell";
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.nameLab.text=[(MainModel*)presenter.model array][indexPath.row];
    return cell;
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    //model改变 改变View
    if([keyPath isEqualToString:@"name"]){
        label.text=[(MainModel*)presenter.model name];
        [imgView setPicImageStr:@"http://img.zcool.cn/community/01b0d857b1a34d0000012e7e87f5eb.gif" size:imgView.size];
        [LangUtil showToastUseMBHub:self.view showText:@"测试"];
    }else if([keyPath isEqualToString:@"array"]){
        [mTable reloadData];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
