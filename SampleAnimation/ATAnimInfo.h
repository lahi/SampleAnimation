//
//  ATAnimInfo.h
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 2. 8..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kScaleType              @"scale"
#define kAlphaType              @"alpha"
#define kTransitionTypeStart    @"transitionStart"
#define kTransitionTypeEnd      @"transitionEnd"

@interface ATAnimInfo : NSObject

@property (nonatomic, strong) NSMutableArray *aniInfoList;
@property (strong) NSString *currImgName;

+ (id)sharedManager;

@end
