//
//  ATTransitionViewController.h
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 2. 11..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATTransitionViewController : UIViewController <UIGestureRecognizerDelegate, UITextFieldDelegate>{
    
    int _currBtnTag;
}

@property (nonatomic) CGPoint currImgPoint;
@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;

@property (strong, nonatomic) IBOutlet UIView *touchView;
@property (strong, nonatomic) IBOutlet UILabel *startPointLabel;
@property (strong, nonatomic) IBOutlet UILabel *endPointLabel;
@property (strong, nonatomic) IBOutlet UITextField *durationField;

- (IBAction)cancelClicked:(id)sender;
- (IBAction)pointClicked:(id)sender;
- (IBAction)addClicked:(id)sender;
@end
