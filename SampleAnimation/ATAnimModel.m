//
//  ATAnimModel.m
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 2. 8..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import "ATAnimModel.h"

@implementation ATAnimModel

- (id) init
{
    if ((self = [super init]))
    {
        self.aniDic = [NSMutableDictionary dictionary];
    }
    
    return self;
}

@end
