//
//  ATAnimInfo.h
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 2. 8..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kScaleType  @"scale"

@interface ATAnimInfo : NSObject

@property (nonatomic, strong) NSMutableArray *aniInfoList;

+ (id)sharedManager;

@end
