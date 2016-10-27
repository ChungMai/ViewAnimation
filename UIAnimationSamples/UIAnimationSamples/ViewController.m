//
//  ViewController.m
//  UIAnimationSamples
//
//  Created by MacMini on 10/27/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "ViewController.h"
#import "AnimationCurvePicker.h"
#import "FakeHUD.h"

@interface ViewController (){
    NSMutableArray *curvesList;
    int	selectedCurveIndex;
    UIView *pickerView;
}

@end

@implementation ViewController

static int curveValues[] = {
    UIViewAnimationOptionCurveEaseInOut,
    UIViewAnimationOptionCurveEaseIn,
    UIViewAnimationOptionCurveEaseOut,
    UIViewAnimationOptionCurveLinear
};

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    curvesList = [[NSMutableArray alloc] initWithObjects:@"EaseInOut",@"EaseIn",@"EaseOut",@"Linear", nil];
    selectedCurveIndex = 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)btnMoveTo:(id)sender{
    UIButton *button = (UIButton *)sender;
    [self.movingButton moveTo:CGPointMake(button.frame.origin.x , button.frame.origin.y - 80) duration:1 option:0];
}

- (IBAction) btnDowUnder:(id)sender{
     UIButton *button = (UIButton *)sender;
    [button downUnder:1 option:0];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [curvesList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [curvesList objectAtIndex:indexPath.row];
    
    if (indexPath.row == selectedCurveIndex)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Select the Animation Curve to be used";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"Curves will not affect total duration but instant speed and acceleration";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    if(selectedCurveIndex != indexPath.row){
        NSIndexPath *indexChange = [NSIndexPath indexPathForRow:selectedCurveIndex inSection:indexPath.row];
        cell = [tableView cellForRowAtIndexPath:indexChange];
        selectedCurveIndex = indexPath.row;
    }
    else{
        [pickerView removeWithZoomOutAnimation:1 option:curveValues[indexPath.row]];
        pickerView = nil;
    }
}

- (IBAction)btnZoom:(id)sender{
    UIButton *button = (UIButton *)sender;
    pickerView = [AnimationCurvePicker newAnimationCurvePicker:self];
    pickerView.center = button.center;
    [self.view addSubviewWithZoomInAnimation:pickerView duration:1.0 option:curveValues[selectedCurveIndex]];
    
}

- (IBAction) btnHUD:(id)sender
{
    FakeHUD *theSubView = [FakeHUD newFakeHUD];
    [self.view addSubviewWithFadeAnimation:theSubView duration:1.0 option:curveValues[selectedCurveIndex]];
}
@end
