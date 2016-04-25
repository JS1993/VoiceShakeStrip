//
//  ViewController.m
//  VoiceShakeStrip
//
//  Created by  江苏 on 16/4/25.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *shakeView;

@property(strong,nonatomic)CAReplicatorLayer* repL;

@end

@implementation ViewController

//懒加载复制图层
-(CAReplicatorLayer *)repL{
    if (_repL==nil) {
        _repL=[CAReplicatorLayer layer];
        _repL.frame=self.shakeView.bounds;
        [self.shakeView.layer addSublayer:_repL];
    }
    return _repL;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建并添加到复制图层
    CALayer* layer=[CALayer layer];
    
    layer.backgroundColor=[UIColor redColor].CGColor;
    
    layer.anchorPoint=CGPointMake(0.5, 1);
    
    layer.position=CGPointMake(15, self.shakeView.bounds.size.height);
    
    layer.bounds=CGRectMake(0, 0,30 , 150);
    
    [self.repL addSublayer:layer];
    
    //创建并添加动画
    CABasicAnimation* anim=[CABasicAnimation animation];
    
    anim.keyPath=@"transform.scale.y";
    
    anim.fromValue=@0;
    
    anim.toValue=@0.5;
    
    anim.repeatCount=MAXFLOAT;
    
    anim.autoreverses=YES;
    
    anim.duration=0.5;
    
    [layer addAnimation:anim forKey:nil];
    
    //设置复制图层的属性
    self.repL.instanceDelay=0.1;
    
    self.repL.instanceCount=4;
    
    self.repL.instanceTransform=CATransform3DMakeTranslation(45, 0, 0);
//    之前设置了layer的颜色，就不用再设置了
//    self.repL.instanceColor=[UIColor greenColor].CGColor;
//
//    self.repL.instanceGreenOffset=-0.3;
    
    
}



@end
