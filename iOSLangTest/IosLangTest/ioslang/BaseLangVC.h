//
//  BaseLangVC.h
//  IosLangTest
//
//  Created by jessie on 2018/3/15.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  <objc/runtime.h>
#import "BaseLangPresenter.h"
#import "YYAnimationIndicator.h"

@interface BaseLangVC : UIViewController <LangVCProtocol>
{
    BaseLangPresenter *presenter;
    NSMutableArray *OkeyList;
}
/*!
 @property
 @abstract 网络指示器
 */
@property (strong, nonatomic) YYAnimationIndicator *loadingView;
-(void)initLoading;
-(void)setObserModel:(NSString *)key;
-(void)setObserModelForAllKey;
-(void)setObserModelForTag;
-(void)addTitle:(NSString *)titleStr withBackBtn:(Boolean)isHave withRightBtn:(UIButton *)rightBtn;
@end
