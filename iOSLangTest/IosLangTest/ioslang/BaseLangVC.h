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

@interface BaseLangVC : UIViewController <LangVCProtocol>
{
    BaseLangPresenter *presenter;
    NSMutableArray *OkeyList;
}
-(void)setObserModel:(NSString *)key;
-(void)setObserModelForAllKey;
@end
