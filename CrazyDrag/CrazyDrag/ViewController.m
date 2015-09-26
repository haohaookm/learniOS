//
//  ViewController.m
//  CrazyDrag
//
//  Created by Tracy on 15/9/20.
//  Copyright © 2015年 Tracy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int currentValue;
}
- (IBAction)showAlert:(id)sender;
- (IBAction)sliderMoved:(id)sender;
@property (strong, readwrite, nonatomic) IBOutlet UISlider *slider;
@end

@implementation ViewController
@synthesize slider;
- (void)viewDidLoad {
    [super viewDidLoad];
    currentValue = self.slider.value;//初始化currentValue的值
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    NSString *message = [NSString stringWithFormat:@"滑动条的当前数值是：%d", currentValue];
    [[[UIAlertView alloc]initWithTitle:@"您好，苍老师！" message:message delegate:nil cancelButtonTitle:@"我来帮转一次，你懂的" otherButtonTitles:nil, nil]show];
}

- (IBAction)sliderMoved:(UISlider*)sender {
    currentValue = (int)lroundf(sender.value);
}
@end
