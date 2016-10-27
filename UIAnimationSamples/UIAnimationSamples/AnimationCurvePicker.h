//
//  AnimationCurvePicker.h
//  UIAnimationSamples
//
//  Created by MacMini on 10/27/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationCurvePicker : UIView

@property(nonatomic, weak) IBOutlet UITableView *animationlist;
+ (id) newAnimationCurvePicker:(id)pickDelegate;

@end
