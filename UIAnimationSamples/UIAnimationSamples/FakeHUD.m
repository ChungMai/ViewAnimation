//
//  FakeHUD.m
//  UIAnimationSamples
//
//  Created by Home on 10/27/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "FakeHUD.h"

@implementation FakeHUD

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



+ (id) newFakeHUD
{
    UINib *nib = [UINib nibWithNibName:@"FakeHUD" bundle:nil];
    NSArray *nibArray = [nib instantiateWithOwner:self options:nil];
    FakeHUD *me = [nibArray objectAtIndex: 0];
    return me;
}

- (IBAction)btnStop
{
    // the following method will be defined and explained later: ignore the warning
    [self removeWithSinkAnimation:200];
}
@end
