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
    int targetValue;
    int score;
}
- (IBAction)showAlert:(id)sender;
- (IBAction)sliderMoved:(id)sender;
@property (strong, readwrite, nonatomic) IBOutlet UISlider *slider;
@property (strong, readwrite, nonatomic) IBOutlet UILabel *targetLabel;
@end

@implementation ViewController
@synthesize slider;
@synthesize targetLabel;
- (void)updateLabels{
    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue];
}
- (void)startNewRound{
    targetValue = 1 + (arc4random() % 100);
    currentValue = 50;
    self.slider.value = currentValue;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    int difference = abs(currentValue - targetValue);
    int point = 100 - difference;
    score += point;
    NSString *message = [NSString stringWithFormat:@"恭喜高富帅，您的得分是：%d", point];
    [[[UIAlertView alloc]initWithTitle:@"您好，土豪！" message:message delegate:nil cancelButtonTitle:@"朕已知晓，爱卿辛苦了" otherButtonTitles:nil, nil]show];
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)sliderMoved:(UISlider*)sender {
    currentValue = (int)lroundf(sender.value);
}
@end
