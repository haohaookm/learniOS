//
//  ViewController.m
//  CrazyDrag
//
//  Created by Tracy on 15/9/20.
//  Copyright © 2015年 Tracy. All rights reserved.
//

#import "ViewController.h"
#import "AboutViewController.h"

@interface ViewController (){
    int currentValue;
    int targetValue;
    int score;
    int round;
}
- (IBAction)showAlert:(id)sender;
- (IBAction)sliderMoved:(id)sender;
- (IBAction)startOver:(id)sender;

@end

@implementation ViewController
@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;
@synthesize roundLabel;
- (void)updateLabels{
    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",round];
}
- (void)startNewRound{
    targetValue = 1 + (arc4random() % 100);
    currentValue = 50;
    round += 1;
    self.slider.value = currentValue;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)startNewGame{
    score = 0;
    round = 0;
    [self startNewRound];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    int difference = abs(currentValue - targetValue);
    int point = 100 - difference;
    score += point;
    NSString *title;
    if (difference == 0) {
        title = @"土豪你太牛逼了！";
        score += 100;
    }
    else if (difference < 5){
        title = @"土豪太棒了，差一点！";
        if (difference == 1) {
            score += 50;
        }
    }
    else if (difference < 10){
        title = @"好吧，勉强算个土豪。";
    }
    else{
        title = @"不是土豪少来装";
    }
    NSString *message = [NSString stringWithFormat:@"恭喜高富帅，您的得分是：%d", point];
    [[[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:@"朕已知晓，爱卿辛苦了" otherButtonTitles:nil, nil]show];

}

- (IBAction)sliderMoved:(UISlider*)sender {
    currentValue = (int)lroundf(sender.value);
}

- (IBAction)startOver:(id)sender {
    [self startNewGame];
    [self updateLabels];
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)showInfo:(id)sender {
    AboutViewController *controller = [[AboutViewController alloc]initWithNibName:@"AboutViewController" bundle:nil];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}
@end
