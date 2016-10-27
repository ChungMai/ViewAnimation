//
//  ViewController.m
//  UIAnimationSamples
//
//  Created by MacMini on 10/27/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)btnMoveTo:(id)sender{
    UIButton *button = (UIButton *)sender;
    [self.movingButton moveTo:CGPointMake(button.frame.origin.x + button.frame.size.width/2 , button.frame.origin.y - 20) duration:1 option:0];
}

- (IBAction) btnDowUnder:(id)sender{
     UIButton *button = (UIButton *)sender;
    [button downUnder:1 option:0];
}

@end
