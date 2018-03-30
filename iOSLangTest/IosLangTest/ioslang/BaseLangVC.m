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
@synthesize loadingView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    [self initPresenter];
    //注册model观察者
    [self setObserModelForTag];
    [self initData];
    [self initModel];
}
-(void)initLoading{
    loadingView = [[YYAnimationIndicator alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-30, self.view.frame.size.height/2-30, 60, 60)];
    //    [aview setLoadText:@"正在加载..."];
    [self.view addSubview:loadingView];
    [loadingView setHidden:YES];
}
-(void)initModel{
    [presenter initModel];
}

- (void)addTitle:(NSString *)titleStr withBackBtn:(Boolean)isHave withRightBtn:(UIButton *)rightBtn{
    
    UIView * statusView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, BEGIN_Y)];
    statusView.backgroundColor = mainWhiteColor;
    [self.view addSubview:statusView];
    
    if(isHave){
        UIButton *btn_back = [UIButton buttonWithType:UIButtonTypeCustom];
        btn_back.frame = CGRectMake(0, kStatusBarHeight+2, 40, 40);
        [btn_back setContentMode:UIViewContentModeScaleAspectFit];
        [btn_back setImage:[UIImage imageNamed:@"langBack"] forState:UIControlStateNormal];
        [btn_back addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        btn_back.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [statusView addSubview:btn_back];
    }
    
    UILabel *lab_title = [[UILabel alloc] init];
    lab_title.frame = CGRectMake(SCREEN_WIDTH/2-80, kStatusBarHeight+2, 160, 40);
    lab_title.font = [UIFont systemFontOfSize:18];
    lab_title.textColor = mainBlackColor;
    lab_title.textAlignment = NSTextAlignmentCenter;
    lab_title.text = titleStr;
    lab_title.backgroundColor = [UIColor clearColor];
    [statusView addSubview:lab_title];
    
    if (rightBtn != nil) {
        [statusView addSubview:rightBtn];
    }
    
    UILabel * lineLab = [[UILabel alloc]initWithFrame:CGRectMake(0, BEGIN_Y-0.5, SCREEN_WIDTH, 0.5)];
    lineLab.backgroundColor = mainSeparationColor;
    [statusView addSubview:lineLab];
}

-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)startAnimating
{
    if(loadingView!=nil&&![loadingView isAnimating])
    {
        [self.view bringSubviewToFront:loadingView];
        [loadingView startAnimation];
    }
}

- (void)stopAnimating
{
    
    if(loadingView!=nil&&[loadingView isAnimating])
    {
        [loadingView stopAnimationWithLoadText:@"" withType:YES];
    }
    
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
//设置观察 Model中的Tag
-(void)setObserModelForTag{
    if(presenter!=nil&&presenter.model!=nil){
        [presenter.model addObserver:self forKeyPath:@"tag" options:NSKeyValueObservingOptionNew context:nil];
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
