//
//  ATScaleViewController.m
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 2. 8..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import "ATScaleViewController.h"

@interface ATScaleViewController ()

@end

@implementation ATScaleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addClicked:(id)sender {
    //number check..
    if ([self.durationField.text isFloatNumber] && [self.scaleField.text isFloatNumber])
    {
        ATAnimModel *_scaleModel = [[ATAnimModel alloc] init];
        [_scaleModel.aniDic setValue:[NSNumber numberWithFloat:[self.scaleField.text floatValue]] forKey:kScaleType];
        [_scaleModel setDuration:[self.durationField.text floatValue]];
        [[[ATAnimInfo sharedManager] aniInfoList] addObject:_scaleModel];
        
        [self closeClicked:nil];
    }
    else
    {
        NSLog(@"number type is wrong");
    }
}

- (IBAction)closeClicked:(id)sender {
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 NSLog(@"scale view dismissed");
                             }];
}

#pragma mark - text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
