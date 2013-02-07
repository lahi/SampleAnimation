//
//  ATFirstViewController.m
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 1. 19..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import "ATFirstViewController.h"

@interface ATFirstViewController ()
- (void)initSampleImageView;

- (void) hideAniMenuBtn;
- (void) hideSettingMenuBtn;

- (void)setVisibleAnimationMenuBtn;
- (void)showSettingMenuBtn;
@end

@implementation ATFirstViewController
@synthesize sImageView = _sImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    [self initSampleImageView];
    
    // hide menu btns
    [self hideAniMenuBtn];
    [self hideSettingMenuBtn];
    
    // Show imageview animation
    [_sImageView playShowImage];
    
    /// Hello World by cho
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - view methods

- (void) showAniMenuBtn
{
    [UIView animateWithDuration:.1f
                     animations:^{
                         _aniFirstBtn.hidden = NO;
                         [_aniFirstBtn setFrame:CGRectMake(_aniFirstBtn.frame.origin.x - 3, _aniFirstBtn.frame.origin.y - 3, _aniFirstBtn.frame.size.width + 6, _aniFirstBtn.frame.size.height + 6)];
                         
                     } completion:^(BOOL finished) {
    [UIView animateWithDuration:.1f
                     animations:^{
                         _aniSecondBtn.hidden = NO;
                         
                         [_aniFirstBtn setFrame:CGRectMake(_aniFirstBtn.frame.origin.x + 3, _aniFirstBtn.frame.origin.y + 3, _aniFirstBtn.frame.size.width - 6, _aniFirstBtn.frame.size.height - 6)];
                         
                         [_aniSecondBtn setFrame:CGRectMake(_aniSecondBtn.frame.origin.x - 3, _aniSecondBtn.frame.origin.y - 3, _aniSecondBtn.frame.size.width + 6, _aniSecondBtn.frame.size.height + 6)];
                         
                     } completion:^(BOOL finished) {
                         
     [UIView animateWithDuration:.1f
                      animations:^{
                          _aniThirdBtn.hidden = NO;
                          
                          [_aniSecondBtn setFrame:CGRectMake(_aniSecondBtn.frame.origin.x + 3, _aniSecondBtn.frame.origin.y + 3, _aniSecondBtn.frame.size.width - 6, _aniSecondBtn.frame.size.height - 6)];
                          
                          [_aniThirdBtn setFrame:CGRectMake(_aniThirdBtn.frame.origin.x - 3, _aniThirdBtn.frame.origin.y - 3, _aniThirdBtn.frame.size.width + 6, _aniThirdBtn.frame.size.height + 6)];
                      } completion:^(BOOL finished) {
                          [_aniThirdBtn setFrame:CGRectMake(_aniThirdBtn.frame.origin.x + 3, _aniThirdBtn.frame.origin.y + 3, _aniThirdBtn.frame.size.width - 6, _aniThirdBtn.frame.size.height - 6)];
                      }];
                        
                     }];
                     }];
}

- (void) hideAniMenuBtn
{
    _aniFirstBtn.hidden = YES;
    _aniSecondBtn.hidden = YES;
    _aniThirdBtn.hidden = YES;
}

- (void) showSettingMenuBtn
{
    [UIView animateWithDuration:.1f
                     animations:^{
                         _settingFirstBtn.hidden = NO;
                         [_settingFirstBtn setFrame:CGRectMake(_settingFirstBtn.frame.origin.x - 3, _settingFirstBtn.frame.origin.y - 3, _settingFirstBtn.frame.size.width + 6, _settingFirstBtn.frame.size.height + 6)];
                         
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:.1f
                                          animations:^{
                                              _settingSecontBtn.hidden = NO;
                                              
                                              [_settingFirstBtn setFrame:CGRectMake(_settingFirstBtn.frame.origin.x + 3, _settingFirstBtn.frame.origin.y + 3, _settingFirstBtn.frame.size.width - 6, _settingFirstBtn.frame.size.height - 6)];
                                              
                                              [_settingSecontBtn setFrame:CGRectMake(_settingSecontBtn.frame.origin.x - 3, _settingSecontBtn.frame.origin.y - 3, _settingSecontBtn.frame.size.width + 6, _settingSecontBtn.frame.size.height + 6)];
                                              
                                          } completion:^(BOOL finished) {
                                              
                                              [UIView animateWithDuration:.1f
                                                               animations:^{
                                                                   _settingThirdBtn.hidden = NO;
                                                                   
                                                                   [_settingSecontBtn setFrame:CGRectMake(_settingSecontBtn.frame.origin.x + 3, _settingSecontBtn.frame.origin.y + 3, _settingSecontBtn.frame.size.width - 6, _settingSecontBtn.frame.size.height - 6)];
                                                                   
                                                                   [_settingThirdBtn setFrame:CGRectMake(_settingThirdBtn.frame.origin.x - 3, _settingThirdBtn.frame.origin.y - 3, _settingThirdBtn.frame.size.width + 6, _settingThirdBtn.frame.size.height + 6)];
                                                               } completion:^(BOOL finished) {
                                                                   [_settingThirdBtn setFrame:CGRectMake(_settingThirdBtn.frame.origin.x + 3, _settingThirdBtn.frame.origin.y + 3, _settingThirdBtn.frame.size.width - 6, _settingThirdBtn.frame.size.height - 6)];
                                                               }];
                                              
                                          }];
                     }];
}

- (void) hideSettingMenuBtn
{
    _settingFirstBtn.hidden = YES;
    _settingSecontBtn.hidden = YES;
    _settingThirdBtn.hidden = YES;
}

#pragma mark - sample image view methods

- (void)initSampleImageView
{
    _sImageView.delegate = self;
    [_sImageView addGestures];
}

- (void) setVisibleAnimationMenuBtn
{
    // setting 메뉴나 animation menu가 보여진 경우에는 hidden
    if (_settingFirstBtn.hidden == NO || _aniFirstBtn.hidden == NO)
    {
        [self hideAniMenuBtn];
        [self hideSettingMenuBtn];
    }
    else // 다 안보여졌을 경우에는 animation menu button show
    {
        [self showAniMenuBtn];
    }
}

#pragma mark - sample image view delegate methods

- (void)imageViewTapEnded
{
    [self setVisibleAnimationMenuBtn];
}

- (void)imageViewLongPressStarted
{
    [self showSettingMenuBtn];
}

- (void)imageViewLongPressEnded
{
    
}

@end
