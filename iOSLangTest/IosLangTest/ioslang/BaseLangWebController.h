//
//  BaseLangWebController.h
//  IosLangTest
//
//  Created by jessie on 2018/4/2.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseLangVC.h"

@interface BaseLangWebController : BaseLangVC
@property(nonatomic,strong)NSString *url;
-(void)loadUrl:(NSString *)url;
@end
