//
//  BaseLangPresenter.h
//  IosLangTest
//
//  Created by jessie on 2018/3/15.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LangPresenterProtocol.h"
#import "LangVCProtocol.h"
#import "LangHttpProtocol.h"
#import "BaseLangModel.h"
#import "LangHttp.h"

@interface BaseLangPresenter : NSObject<LangPresenterProtocol,LangHttpProtocol>

@property(nonatomic,strong)id<LangVCProtocol> delegate;
@property(nonatomic,strong)BaseLangModel *model;

-(instancetype)initWithDelegate:(id<LangVCProtocol>)delegate class:(Class)class;
@end
