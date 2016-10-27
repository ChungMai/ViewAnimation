//
//  UIView+Animation.m
//  UIAnimationSamples
//
//  Created by MacMini on 10/27/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

- (void) moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option{
    [UIView animateWithDuration:secs delay:0.0 options:option
                     animations:^{
                         self.frame = CGRectMake(destination.x,destination.y, self.frame.size.width, self.frame.size.height);
                     }
                     completion:nil];
}

-(void)downUnder:(float)secs option:(UIViewAnimationOptions)option{
    [UIView animateWithDuration:secs
                          delay:0.0
                        options:option
                     animations:^{
                         self.transform = CGAffineTransformRotate(self.transform, M_PI);
                     }
                     completion:nil];
}

- (void) addSubviewWithZoomInAnimation:(UIView*)view duration:(float)secs option:(UIViewAnimationOptions)option{
    CGAffineTransform trans = CGAffineTransformScale(view.transform, 0.01, 0.01);
    view.transform = trans;
    [self addSubview:view];
    
    [UIView animateWithDuration:secs delay:0.0 options:option animations:^{
        view.transform = CGAffineTransformScale(view.transform, 100, 100);
    } completion:nil];
}

- (void) removeWithZoomOutAnimation:(float)secs option:(UIViewAnimationOptions)option
{
    [UIView animateWithDuration:secs delay:0.0 options:option
                     animations:^{
                         self.transform = CGAffineTransformScale(self.transform, 0.01, 0.01);
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview]; 
                     }];
}
@end
