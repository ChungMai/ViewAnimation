//
//  ViewController.h
//  UIAnimationSamples
//
//  Created by MacMini on 10/27/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Animation.h"

@interface ViewController : UIViewController
@property (nonatomic,weak) IBOutlet UIButton *movingButton;

- (IBAction) btnMoveTo:(id)sender;
- (IBAction) btnDowUnder:(id)sender;
- (IBAction)btnZoom:(id)sender;
- (IBAction) btnHUD:(id)sender;

@end

