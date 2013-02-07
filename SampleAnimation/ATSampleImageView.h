//
//  ATSampleImage.h
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 1. 19..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ATSampleImageDelegate <NSObject>
- (void) imageViewTapEnded;

- (void) imageViewLongPressStarted;
- (void) imageViewLongPressEnded;

@end

@interface ATSampleImageView : UIImageView <UIGestureRecognizerDelegate>


@property (unsafe_unretained) id <ATSampleImageDelegate> delegate;

- (void)addGestures;

- (void)resetAnimationProperties;

- (void)playShowImage;
- (void)playAnimationWithModel :(ATAnimModel *) model;

@end
