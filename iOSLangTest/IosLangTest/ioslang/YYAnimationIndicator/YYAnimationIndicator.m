
#import "YYAnimationIndicator.h"

@implementation YYAnimationIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _isAnimating = NO;
        angle = 0;
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15,10, frame.size.width-30,frame.size.height-30)];
        imageView.image = LOCAL_IMAGE(@"loading");
        [self addSubview:imageView];
        
//        //设置动画帧
//        NSMutableArray  *imgArray = [NSMutableArray array];
//        for (int i=0; i<24; i++) {
//            NSString  *name = [NSString stringWithFormat:@"load%d",i+1];
//            UIImage *image = [UIImage imageNamed:name];
//            [imgArray addObject:image];
//        }
//        imageView.animationImages= imgArray;
        
        
        Infolabel = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height-20, frame.size.width, 20)];
        Infolabel.backgroundColor = [UIColor clearColor];
        Infolabel.textAlignment = NSTextAlignmentCenter;
        Infolabel.textColor = [UIColor grayColor];
//        Infolabel.textColor = [UIColor colorWithRed:84.0/255 green:86./255 blue:212./255 alpha:1];
//        Infolabel.font = [UIFont fontWithName:@"ChalkboardSE-Bold" size:12.0f];
        Infolabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:Infolabel];
        self.hidden = YES;
    }
    return self;
}


#pragma mark 第二种实现方式
- (void)startTurnAround
{
    
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.01 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            imageView.transform = endAngle;
        } completion:^(BOOL finished) {
            angle += 6;
            if (_isAnimating) {
                [self startTurnAround];
            }
        }];
    });
   
    
}



- (void)startAnimation
{
    _isAnimating = YES;
    self.hidden = NO;
    [self doAnimation];
}

-(void)doAnimation{
    
    Infolabel.text = _loadtext;
    [self startTurnAround];
//    //设置动画总时间
//    imageView.animationDuration=0.6;
//    //设置重复次数,0表示不重复
//    imageView.animationRepeatCount=0;
//    //开始动画
//    [imageView startAnimating];
}

- (void)stopAnimationWithLoadText:(NSString *)text withType:(BOOL)type;
{
    _isAnimating = NO;
    Infolabel.text = text;
    if(type){
        
        [UIView animateWithDuration:0.3f animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
//            [imageView stopAnimating];
            self.hidden = YES;
//            self.alpha = 1;
        }];
    }else{
//        [imageView stopAnimating];
        [imageView setImage:[UIImage imageNamed:@"loading.png"]];
    }
    
}


-(void)setLoadText:(NSString *)text;
{
    if(text){
        _loadtext = text;
    }
}

@end
