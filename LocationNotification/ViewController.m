//
//  ViewController.m
//  LocationNotification
//
//  Created by changchen on 2016/11/2.
//  Copyright © 2016年 changchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    NSLog(@"12");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"123");
    });
    NSLog(@"1234");
    
    NSLog(@"test123");
    
    UIImageView* imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [imgView setImage:[UIImage imageNamed:@"huaji2.jpg"]];
    [imgView setBackgroundColor:[UIColor clearColor]];
    
    
    
    EffectView* view=[[EffectView alloc]init];
    [self.view addSubview:view];
    
    [self.view addSubview:imgView];

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
