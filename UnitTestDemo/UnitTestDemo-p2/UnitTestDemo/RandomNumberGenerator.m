//
//  RandomNumberGenerator.m
//  UnitTestDemo
//
//  Created by ben on 10/7/13.
//  Copyright (c) 2013 Fickle Bits. All rights reserved.
//

#import "RandomNumberGenerator.h"

@interface RandomNumberGenerator ()
@end

@implementation RandomNumberGenerator

- (NSUInteger)randomBetween:(NSInteger)min and:(NSInteger)max {
    return (arc4random() * (max - min)) + min;
}

@end
