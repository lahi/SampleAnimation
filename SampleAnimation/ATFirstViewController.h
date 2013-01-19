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

@property (retain, nonatomic) IBOutlet UIButton *aniFirstBtn;
@property (retain, nonatomic) IBOutlet UIButton *aniSecondBtn;
@property (retain, nonatomic) IBOutlet UIButton *aniThirdBtn;


@property (retain, nonatomic) IBOutlet UIButton *settingFirstBtn;
@property (retain, nonatomic) IBOutlet UIButton *settingSecontBtn;
@property (retain, nonatomic) IBOutlet UIButton *settingThirdBtn;

@property (nonatomic, retain) IBOutlet ATSampleImageView *sImageView;

@end
