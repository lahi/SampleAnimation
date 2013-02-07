//
//  ATSampleImage.m
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 1. 19..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import "ATSampleImageView.h"

@implementation ATSampleImageView
@synthesize delegate = _delegate;

- (void) addGestures
{
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressTapped:)];
    longTap.numberOfTouchesRequired = 1;
    longTap.minimumPressDuration = 1.0f;
    [longTap setDelegate:self];
    self.userInteractionEnabled = YES;
    
    [self addGestureRecognizer:longTap];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewtapped:)];
    tap.numberOfTapsRequired = 1;
    [longTap setDelegate:self];
    
    [self addGestureRecognizer:tap];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - sample animation

- (void)resetAnimationProperties
{
    //reset
    self.alpha = 1.0f;
    self.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
}

- (void)playShowImage
{
    [UIView animateWithDuration:.3f
                     animations:^{
                         self.frame = CGRectMake(self.frame.origin.x - 5, self.frame.origin.y - 5, self.frame.size.width + 10, self.frame.size.height + 10);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:.3f
                                          animations:^{
                                              self.frame = CGRectMake(self.frame.origin.x + 5, self.frame.origin.y + 5, self.frame.size.width - 10, self.frame.size.height - 10);
                                          }];
                     }];
}

- (void) playAnimationWithModel :(ATAnimModel *) model
{
    self.alpha = .98f;
    [UIView animateWithDuration:model.duration
                     animations:^{
#warning 타입.. 좀더 유연하게 바꿔야 함 
                         if ([model.aniType isEqualToString:kScaleType])
                         {
                             self.alpha = 1.0f;
                             self.transform = CGAffineTransformScale(self.transform, model.aniValue, model.aniValue);
                             
                             NSLog(@"sclae :%f", model.aniValue);
                         }
                     }];
}

#pragma mark - gesture methods

- (void) longPressTapped :(UILongPressGestureRecognizer *)recognizer
{
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            // Called on start of gesture, do work here
            NSLog(@"Long :: UIGestureRecognizerStateStart");
            
            if (_delegate && [_delegate respondsToSelector:@selector(imageViewLongPressStarted)])
                [_delegate performSelector:@selector(imageViewLongPressStarted)];
            
            break;
            
        case UIGestureRecognizerStateChanged:
            // Do repeated work here (repeats continuously) while finger is down
            NSLog(@"Long :: UIGestureRecognizerStateChanged");
            break;
            
        case UIGestureRecognizerStateEnded:
            // Do end work here when finger is lifted
            NSLog(@"Long :: UIGestureRecognizerStateEnded");
            
            if (_delegate && [_delegate respondsToSelector:@selector(imageViewLongPressEnded)])
                [_delegate performSelector:@selector(imageViewLongPressEnded)];
            
            break;
            
        case UIGestureRecognizerStateCancelled:
            break;
            
        case UIGestureRecognizerStateFailed:
            break;
            
        default:
            break;
    }
}

- (void) imageViewtapped :(UITapGestureRecognizer *) recognizer
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
            
            if (_delegate && [_delegate respondsToSelector:@selector(imageViewTapEnded)])
                [_delegate performSelector:@selector(imageViewTapEnded)];
            
            break;
            
        case UIGestureRecognizerStateCancelled:
            break;
            
        case UIGestureRecognizerStateFailed:
            break;
            
        default:
            break;
    }
}

#pragma mark - gesture delegate methods

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return YES;
}

@end
