//
//  EffectView.m
//  LocationNotification
//
//  Created by changchen on 2016/11/11.
//  Copyright © 2016年 changchen. All rights reserved.
//

#import "EffectView.h"

@implementation EffectView


-(instancetype)init
{
    self=[super init];
    if (self) {
        [self setFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))];
        [self setBackgroundColor:[UIColor lightGrayColor]];
        [self setLiZiEffect];
        
    }
    return self;
}

-(void)setLiZiEffect
{
    //创建layer
    CAEmitterLayer* emittLayer=[CAEmitterLayer layer];
    emittLayer.emitterPosition=CGPointMake(CGRectGetWidth(self.frame)/2, 0);
    emittLayer.emitterShape=kCAEmitterLayerRectangle;
    emittLayer.emitterSize=self.bounds.size;
    [self.layer addSublayer:emittLayer];
    
    //创建粒子
    CAEmitterCell* emittCell=[CAEmitterCell emitterCell];
    emittCell.contents=(__bridge id _Nullable)([[UIImage imageNamed:@"huaji2.jpg"] CGImage]);
    emittCell.birthRate=1; //每秒释放粒子
    emittCell.lifetime=3.5;
    emittCell.color=[[UIColor whiteColor] CGColor];
    emittCell.redRange=0;
    emittCell.alphaRange=.5;
    emittCell.velocity=9.8;
    emittCell.velocityRange = 350; // 加速范围
    emittCell.emissionRange = (CGFloat)M_PI_2; // 下落是旋转的角度
    emittCell.emissionLongitude = (CGFloat)-M_PI; //
    emittCell.yAcceleration = 70; // 发射速度
    emittCell.xAcceleration = 0;
    emittCell.scale = 0.33;
    emittCell.scaleRange = 2;
    emittCell.scaleSpeed = -0.25;
    emittCell.alphaRange = 0.5;
    emittCell.alphaSpeed = -0.15;
    
    emittLayer.emitterCells=@[emittCell];
    
}


@end
