//
//  AnimationCurvePicker.m
//  UIAnimationSamples
//
//  Created by MacMini on 10/27/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "AnimationCurvePicker.h"

@implementation AnimationCurvePicker

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (id) newAnimationCurvePicker:(id)pickDelegate{
    UINib *nib = [UINib nibWithNibName:@"AnimationCurvePicker" bundle:nil];
    NSArray *nibArray = [nib instantiateWithOwner:self options:nil];
    AnimationCurvePicker *me = [nibArray objectAtIndex: 0];;
    me.animationlist.dataSource = pickDelegate;
    me.animationlist.delegate = pickDelegate;
    return me;
}

@end
