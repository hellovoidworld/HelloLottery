//
//  HVWLuckyWheel.m
//  LotteryLuckyWheel
//
//  Created by hellovoidworld on 15/1/16.
//  Copyright (c) 2015年 hellovoidworld. All rights reserved.
//

#import "HVWLuckyWheel.h"
#import "HVWLuckyWheelButton.h"

@interface HVWLuckyWheel()

/** 幸运轮 */
@property (weak, nonatomic) IBOutlet UIImageView *luckyWheel;

/** 被选中的星座按钮 */
@property(nonatomic, strong) UIButton *selectedLuckyWheelButton;

/** 刷新定时器 */
@property(nonatomic, strong) CADisplayLink *displayLink;

/** 开始选号按钮 */
@property (weak, nonatomic) IBOutlet UIButton *startChooseButton;

/**  开始选号 */
- (IBAction)startChoose;

@end

@implementation HVWLuckyWheel

/** 自定义创建方法 */
+ (instancetype) hvwLuckyWheel {
    return [[[NSBundle mainBundle] loadNibNamed:@"HVWLuckyWheel" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    // 设置背景色为透明
    self.backgroundColor = nil;
    
    // 由于按钮是要作为“转盘”控件的子控件，所以为了能够传递点击事件，要先开启“转盘”(UIImageView)的交互功能
    self.luckyWheel.userInteractionEnabled = YES;
    
    // 添加12个星座按钮
    for (int i=0; i<12; i++) {
        
        // 添加按钮
        HVWLuckyWheelButton *button = [[HVWLuckyWheelButton alloc] init];
//        button.backgroundColor = [UIColor redColor];
        
        // 设置按钮尺寸
        button.bounds = CGRectMake(0, 0, 68, 143);
        // 设置按钮锚点，用于分布环形12个按钮
        button.layer.anchorPoint = CGPointMake(0.5, 1);
        // 暂时把所有按钮都放在12点位置
        button.layer.position = CGPointMake(self.center.x, self.center.y);
        
        
        // 取得星座图片总图
        UIImage *sumImage = [UIImage imageNamed:@"LuckyAstrology"];
        UIImage *sumImageSelected = [UIImage imageNamed:@"LuckyAstrologyPressed"];
        
        // 使用CoreGraphic分割图片，得到独立的星座小图
        // 这里图片的大小是提供给CGImageCreateWithImageInRect裁剪图片用的，所以要把单位从pt转换成px
        // 根据屏幕的分辨率来判别系统是否使用了@2x图片
        CGFloat conImageWidth = sumImage.size.width / 12 * [UIScreen mainScreen].scale;
        CGFloat conImageHeight = sumImage.size.height * [UIScreen mainScreen].scale;
        CGFloat conImageX = i * conImageWidth;
        CGFloat conImageY = 0;
        
        // CGImage是用像素px来测量的，不是点pt，所以不能自动识别普通图片和@2x图片
        UIImage *conImage = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(sumImage.CGImage, CGRectMake(conImageX, conImageY, conImageWidth, conImageHeight))];
        
        UIImage *conImageSelected = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(sumImageSelected.CGImage, CGRectMake(conImageX, conImageY, conImageWidth, conImageHeight))];
        
        // 设置按钮图片
        [button setImage:conImage forState:UIControlStateNormal];
        [button setImage:conImageSelected forState:UIControlStateSelected];
        [button setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        // 按钮点击事件
        [button addTarget:self action:@selector(conButtonClicked:) forControlEvents:UIControlEventTouchDown];
        
        // 环形分布12个星座按钮，围绕着锚点旋转
        button.transform = CGAffineTransformMakeRotation(M_PI/6 * i);
        
        // 默认选中第一个按钮
        if (0 == i) {
            [self conButtonClicked:button];
        }
        
        [self.luckyWheel addSubview:button];
    }
}

/** 星座按钮点击事件 */
- (void) conButtonClicked:(UIButton *) button {
    self.selectedLuckyWheelButton.selected = NO;
    button.selected = YES;
    self.selectedLuckyWheelButton = button;
}

/** 开始转盘旋转 */
- (void) startRotate {
    if (self.displayLink) return;
    
    // 创建循环刷新事件
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(luckyWheelRotate)];
    self.displayLink = link;
    
    // 加入到主循环
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

/** 停止转盘旋转 */
- (void) stopRotate {
    [self.displayLink invalidate];
    self.displayLink = nil;
}

/** 转盘旋转实现方法 */
- (void) luckyWheelRotate {
    self.luckyWheel.transform = CGAffineTransformRotate(self.luckyWheel.transform, M_PI_4 / 100);
}

/**  开始选号 
 * 因为点击“开始选号”之后仅播放动画，不用设计交互操作，所以可以用CALayer动画来完成
 */
- (IBAction)startChoose {
    // 禁止再次点击
    self.startChooseButton.userInteractionEnabled = NO;
    
    // 先停止原来的轮盘转动
    [self stopRotate];

    // 停止轮盘的交互功能
    self.luckyWheel.userInteractionEnabled = NO;
    
    CABasicAnimation *anim = [[CABasicAnimation alloc] init];
    anim.keyPath = @"transform.rotation";

    // 使用反余弦函数和矩阵换算计算出转盘现在的旋转角度
    CGFloat wheelRoate = acosf(self.luckyWheel.transform.a);
    if (self.luckyWheel.transform.b < 0) {    // 超出180°的情况
        wheelRoate = M_PI * 2 - wheelRoate;
    }
    
    // 狂转3周，回到原来的位置
    anim.toValue = @(wheelRoate + M_PI * 2 * 3);
    anim.duration = 2.0;
    
    // 设置代理
    anim.delegate = self;
    
    //使用慢进慢出的动画节奏
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.luckyWheel.layer addAnimation:anim forKey:nil];
}

/**  CALayer动画停止之后 */
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    // 恢复轮盘的交互功能
    self.luckyWheel.userInteractionEnabled = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 稍后恢复轮盘自动转动
        [self startRotate];
        
        // 恢复“开始选号”按钮点击
        self.startChooseButton.userInteractionEnabled = YES;
    });
}
@end
