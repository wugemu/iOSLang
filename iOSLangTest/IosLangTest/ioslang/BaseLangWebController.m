//
//  BaseLangWebController.m
//  IosLangTest
//
//  Created by jessie on 2018/4/2.
//  Copyright © 2018年 langzu. All rights reserved.
//

#import "BaseLangWebController.h"

@interface BaseLangWebController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
{
    WKWebView  *langweb;
    NSString  *cookieValue;
}
@end

@implementation BaseLangWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)initView{
    //清除网页缓存
    [LangUtil deleteWebCache];
    [self initLoading];
    [self addTitle:[LangUtil getUrlParam:self.url key:@"title"] withBackBtn:YES withRightBtn:nil];
    
    WKWebViewConfiguration* configuration = [[WKWebViewConfiguration alloc] init];
    // 设置偏好设置
    configuration.preferences = [[WKPreferences alloc] init];
    // 默认为0
    configuration.preferences.minimumFontSize = 10;
    // 默认认为YES
    configuration.preferences.javaScriptEnabled = YES;
    // 在iOS上默认为NO，表示不能自动通过窗口打开
    configuration.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    // 通过JS与webview内容交互
    configuration.userContentController = [[WKUserContentController alloc] init];
    cookieValue = @"";//设置cookie
    NSString *cookie = [NSString stringWithFormat:@"document.cookie = '%@;path=/';",cookieValue];
    WKUserScript * cookieScript = [[WKUserScript alloc]
                                   initWithSource: cookie
                                   injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    [configuration.userContentController addUserScript:cookieScript];
    [configuration.userContentController addScriptMessageHandler:self name:@"Native"];
    
    langweb = [[WKWebView alloc] initWithFrame:CGRectMake(0, BEGIN_Y, SCREEN_WIDTH, SCREEN_HEIGHT-BEGIN_Y) configuration:configuration];
    langweb.navigationDelegate = self;
    langweb.UIDelegate = self;
    [self.view addSubview:langweb];
    
}

-(void)loadUrl:(NSString *)url{
    if([LangUtil isEmpty:self.url]){
        return;
    }
    NSArray * urlArr = [self.url componentsSeparatedByString:@"?"];
    if (urlArr.count>1) {
        self.url = [NSString stringWithFormat:@"%@&versionIos=%@",self.url,[LangUtil getVersionCode]];
    } else {
        self.url = [NSString stringWithFormat:@"%@?versionIos=%@",self.url,[LangUtil getVersionCode]];
    }
    self.url = [self.url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    [req addValue:cookieValue forHTTPHeaderField:@"Cookie"];
    [langweb loadRequest:req];
    [self startAnimating];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation;
{
    
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation;
{
    
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation;
{
    [self stopAnimating];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation;
{
    [self stopAnimating];
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    UIAlertView  *alertView = [[UIAlertView alloc] initWithTitle:nil message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
    completionHandler();
}
/**
 *  在发送请求之前，决定是否跳转
 *
 *  @param wbView          实现该代理的webview
 *  @param navigationAction 当前navigation
 *  @param decisionHandler  是否调转block
 */
- (void)webView:(WKWebView *)wbView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    //允许跳转
    
    if([self.url isEqualToString:navigationAction.request.URL.absoluteString]){
        decisionHandler(WKNavigationActionPolicyAllow);
        return;
    }
    BaseLangWebController *vc=[[self class] new];
    vc.url=navigationAction.request.URL.absoluteString;
    [self.navigationController pushViewController:vc animated:YES];
    decisionHandler(WKNavigationActionPolicyCancel);
    return;
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
