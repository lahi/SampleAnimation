//
//  ATAlphaViewController.m
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 2. 8..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import "ATAlphaViewController.h"

@interface ATAlphaViewController ()

@end

@implementation ATAlphaViewController

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
    [self.imgView setImage:[UIImage imageNamed:[[ATAnimInfo sharedManager] currImgName]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelClicked:(id)sender {
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 NSLog(@"alpha view dismissed");
                             }];
}

- (IBAction)addClicked:(id)sender {
    
    //number check..
    if ([self.durationField.text isFloatNumber])
    {
        ATAnimModel *_alphaModel = [[ATAnimModel alloc] init];
        [_alphaModel.aniDic setValue:[NSNumber numberWithFloat:self.alphaSlide.value] forKey:kAlphaType];
        [_alphaModel setDuration:[self.durationField.text floatValue]];
        [[[ATAnimInfo sharedManager] aniInfoList] addObject:_alphaModel];
        
        [self cancelClicked:nil];
    }
    else
    {
        NSLog(@"number type is wrong");
    }
}

- (IBAction)alphaChanged:(id)sender {
    UISlider *slider = (UISlider *) sender;
    
    [self.alphaLabel setText:[NSString stringWithFormat:@"%.2f", slider.value]];
    [self.imgView setAlpha:slider.value];
}

#pragma mark - text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
