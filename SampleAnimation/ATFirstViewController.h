//
//  ATFirstViewController.h
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 1. 19..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATSampleImageView.h"

@interface ATFirstViewController : UIViewController <ATSampleImageDelegate>
{
    ATSampleImageView *_sImageView;
}

@property (strong) IBOutlet UIButton *aniFirstBtn;
@property (strong) IBOutlet UIButton *aniSecondBtn;
@property (strong) IBOutlet UIButton *aniThirdBtn;


@property (strong) IBOutlet UIButton *settingFirstBtn;
@property (strong) IBOutlet UIButton *settingSecontBtn;
@property (strong) IBOutlet UIButton *settingThirdBtn;

@property (strong) IBOutlet ATSampleImageView *sImageView;

@end
