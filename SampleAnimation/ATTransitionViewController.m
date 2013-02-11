//
//  ATTransitionViewController.m
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 2. 11..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import "ATTransitionViewController.h"

#define kStartBtnTag 10
#define kEndBtnTag 11

@interface ATTransitionViewController ()

@end

@implementation ATTransitionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _currBtnTag = -1;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Do any additional setup after loading the view.
    self.endPoint = self.startPoint = self.currImgPoint;
    
    [self.startPointLabel setText:[NSString stringWithFormat:@"( %.0f, %.0f )", self.startPoint.x, self.startPoint.y]];
    [self.endPointLabel setText:[NSString stringWithFormat:@"( %.0f, %.0f )", self.endPoint.x, self.endPoint.y]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchViewtapped:)];
    tap.numberOfTapsRequired = 1;
    [tap setDelegate:self];
    
    [self.touchView addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - touch methods
- (void) touchViewtapped :(UITapGestureRecognizer *) recognizer
{
    //NSLog(@"rec :%@", recognizer);
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            // Called on start of gesture, do work here
            NSLog(@"Tap:: UIGestureRecognizerStateStart");
            break;
            
        case UIGestureRecognizerStateChanged:
            // Do repeated work here (repeats continuously) while finger is down
            NSLog(@"Tap:: UIGestureRecognizerStateChanged");
            break;
            
        case UIGestureRecognizerStateEnded:
            // Do end work here when finger is lifted
            NSLog(@"Tap:: UIGestureRecognizerStateEnded");
            
            switch (_currBtnTag) {
                case kStartBtnTag:
                    
                    self.startPoint = [recognizer locationInView:[recognizer.view superview]];
                    [self.startPointLabel setText:[NSString stringWithFormat:@"( %.0f, %.0f )", self.startPoint.x, self.startPoint.y]];
                    break;
                case kEndBtnTag:
                    
                    self.endPoint = [recognizer locationInView:[recognizer.view superview]];
                    [self.endPointLabel setText:[NSString stringWithFormat:@"( %.0f, %.0f )", self.endPoint.x, self.endPoint.y]];
                    break;
                default:
                    break;
            }
            
            _currBtnTag = -1;
            self.touchView.hidden = YES;
            
            break;
            
        case UIGestureRecognizerStateCancelled:
            break;
            
        case UIGestureRecognizerStateFailed:
            break;
            
        default:
            break;
    }
}

#pragma mark - action methods

- (IBAction)cancelClicked:(id)sender {
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 NSLog(@"transition view dismissed");
                             }];
}

- (IBAction)pointClicked:(id)sender {
    _currBtnTag = [(UIButton *)sender tag];
    
    self.touchView.hidden = NO;
    [self.durationField resignFirstResponder];
}

- (IBAction)addClicked:(id)sender {
    ATAnimModel *_alphaModel = [[ATAnimModel alloc] init];
    
    NSMutableDictionary *_startPointDic = [NSMutableDictionary dictionary];
    [_startPointDic setValue:[NSNumber numberWithFloat:self.startPoint.x] forKey:@"x"];
    [_startPointDic setValue:[NSNumber numberWithFloat:self.startPoint.y] forKey:@"y"];
    [_alphaModel.aniDic setValue:_startPointDic forKey:kTransitionTypeStart];
    
    NSMutableDictionary *_endPointDic = [NSMutableDictionary dictionary];
    [_endPointDic setValue:[NSNumber numberWithFloat:self.endPoint.x] forKey:@"x"];
    [_endPointDic setValue:[NSNumber numberWithFloat:self.endPoint.y] forKey:@"y"];
    [_alphaModel.aniDic setValue:_endPointDic forKey:kTransitionTypeEnd];
    
    [_alphaModel setDuration:[self.durationField.text floatValue]];
    [[[ATAnimInfo sharedManager] aniInfoList] addObject:_alphaModel];
    
    [self cancelClicked:nil];
}

#pragma mark - text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
