//
//  ATModelSettingViewController.m
//  SampleAnimation
//
//  Created by nicechm on 13. 2. 11..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import "ATModelSettingViewController.h"

@interface ATModelSettingViewController ()

@end

@implementation ATModelSettingViewController

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

- (IBAction)CloseClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismiss modelSettingViewController");
    }];
}
@end
