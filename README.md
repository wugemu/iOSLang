# iOSLang 框架V1.0
方便iOS开发者快速搭建项目框架
# 目的
开发过程中，经常View与Data混杂在一起，项目复杂化，代码量增加时，逻辑难以阅读，影响迭代开发；iOSLang目的是将View层与Data层进行分离，当Data数据发生改变时，框架能够触发事件操作View，开发者能够将更多的精力用在业务逻辑处理，提高开发效率，代码逻辑清晰。同时整合常用开发包到iOSLang框架中，方便iOS开发者快速搭建项目框架。
# 原理
运用KVO模式，对数据源进行监控，当数据源发生变化时，触发事件修改View。
# 弊端
KVO使用时遇到的坑；
# 已整合开发包
SDWebImage(图片加载库，支持gif图)，AFNetworking(目前流行的网络请求库)，json处理；
# 已整合的方法
View属性处理(UIViewExt.h)，图片属性处理（UIImage+scale.h,UIImage+fixOrientation），颜色属性处理（UIColor+Hex.h）。
# 模块及任务
一个ViewController，一个Presenter， 一个Model。

ViewController 负责设置布局，View显示，事件处理，初始化Presenter。

Presenter 负责创建Model实例，控制Model字段间接控制View，网络数据请求，网络请求结果处理，业务逻辑处理。

ViewModel 负责ViewController中的View数据源。

# 常见问题处理：

问题1.Error Domain=NSCocoaErrorDomain Code=3840 "JSON text did not start with array or object and option to allow fragments not set." UserInfo={NSDebugDescription=JSON text did not start with array or object and option to allow fragments not set.}

解决：manager.responseSerializer=[AFHTTPResponseSerializer serializer];

问题2.网络请求返回Unicode编码(16进制)

解决：NSString *responseStr = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];

# 使用方法
1.Build Setting的Prefix Header属性引用ioslang.pch文件

2.创建Model继承BaseLangModel

3.创建Presenter继承BaseLangPresenter

重写方法：

-(void)initModel//数据初始化或网络请求

-(void)success:(NSDictionary *)dic tag:(int)tag//网络请求成功回调

-(void)empty:(int)tag//网络请求为空或数据异常回调

-(void)error:(int)tag//网络请求错误回调

4.创建ViewController继承BaseLangVC

重写方法：

-(void)initView //View布局

-(void)initPresenter//初始化Presenter

-(void)initData//初始化页面数据

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context

# 已整合的View
一.网络状态监听

1.开启监听，在AppDelegate的- (void)applicationDidBecomeActive:(UIApplication *)application方法中调用startLisNetStatue方法；

[LangUtil startLisNetStatue:self.window];

2.关闭监听，在AppDelegate的- (void)applicationWillTerminate:(UIApplication *)application方法中调用stopLisNetStatue方法；

[LangUtil stopLisNetStatue];

二 .自定义标题

1.ViewController的initView方法中添加自定义标题

[self addTitle:@"测试" withBackBtn:YES withRightBtn:nil];

标题样式自行修改

三.自定义网络加载等待动画

1.ViewController的initView方法中初始化网络加载动画

[self initLoading];//初始化网络加载动画

动画可自行修改


# 类说明：
# BaseLangModel
方法名				说明

-(void)setValue:forKey:		为某个字段设值

# BaseLangPresenter
方法名						说明

-(instancetype)initWithDelegate: class:		初始化方法

# BaseLangVC
方法名						说明

-(void)setObserModel:		为model的某个Key设置监听

-(void)setObserModelForAllKey 　为model的所有Key设置监听

-(void)setObserModelForTag	为model的tag设置监听，使用tag标示通知UI刷新（推荐）

# 后续。。。
