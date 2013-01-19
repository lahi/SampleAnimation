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
{
    id <ATSampleImageDelegate> _delegate;
}

@property (nonatomic, assign) id delegate;

- (void)addGestures;

- (void)playShowImage;

@end
