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
- (void)startAnimating
{
    if(self.delegate!=nil&&[self.delegate respondsToSelector:@selector(startAnimating)]){
        [self.delegate startAnimating];
    }
}

- (void)stopAnimating
{
    if(self.delegate!=nil&&[self.delegate respondsToSelector:@selector(stopAnimating)]){
         [self.delegate stopAnimating];
    }
}
@end
