//
//  ATScaleViewController.h
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 2. 8..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATScaleViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *durationField;
@property (weak, nonatomic) IBOutlet UITextField *scaleField;

- (IBAction)addClicked:(id)sender;
- (IBAction)closeClicked:(id)sender;

@end
