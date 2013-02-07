//
//  ATAnimInfo.m
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 2. 8..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import "ATAnimInfo.h"

@implementation ATAnimInfo

+ (id)sharedManager {
    static ATAnimInfo *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        self.aniInfoList = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
