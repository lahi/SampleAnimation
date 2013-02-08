//
//  ATAlphaViewController.h
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 2. 8..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATAlphaViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *alphaLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UISlider *alphaSlide;
@property (weak, nonatomic) IBOutlet UITextField *durationField;


- (IBAction)cancelClicked:(id)sender;
- (IBAction)addClicked:(id)sender;

- (IBAction)alphaChanged:(id)sender;

@end
