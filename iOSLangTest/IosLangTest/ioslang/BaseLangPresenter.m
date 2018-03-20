//
//  BaseLangPresenter.m
//  IosLangTest
//
//  Created by jessie on 2018/3/15.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "BaseLangPresenter.h"

@implementation BaseLangPresenter
-(instancetype)initWithDelegate:(id<LangVCProtocol>)delegate class:(Class)class{
    self = [super init];
    self.delegate=delegate;
    self.model=[class new];
    return self;
}
@end
