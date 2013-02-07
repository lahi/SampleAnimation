//
//  ATValidate.m
//  SampleAnimation
//
//  Created by SOOYOUNG BYUN on 13. 2. 8..
//  Copyright (c) 2013년 SOOYOUNG BYUN. All rights reserved.
//

#import "ATValidate+NSString.h"

@implementation NSString (ATValidate)

- (BOOL) isIntNumber
{
    BOOL valid = NO;

    NSCharacterSet *intNumber = [NSCharacterSet decimalDigitCharacterSet];
    
    NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:self];
    if ([self length] > 0 ) {
        valid = [intNumber isSupersetOfSet:stringSet];
    }
    return valid;
}

- (BOOL) isFloatNumber
{
    BOOL valid = NO;
    
    NSCharacterSet *floatNumber = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    
    NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:self];
    if ([self length] > 0 ) {
        valid = [floatNumber isSupersetOfSet:stringSet];
    }
    
    return valid;
}

@end
