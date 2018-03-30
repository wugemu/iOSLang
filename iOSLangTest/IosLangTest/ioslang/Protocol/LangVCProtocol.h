//
//  LangVCProtocol.h
//  IosLangTest
//
//  Created by jessie on 2018/3/16.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LangVCProtocol <NSObject>

- (void)initView;
- (void)initPresenter;
- (void)initData;
- (void)startAnimating;
- (void)stopAnimating;
@end
