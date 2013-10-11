//
//  RandomNumberGenerator.h
//  UnitTestDemo
//
//  Created by ben on 10/7/13.
//  Copyright (c) 2013 Fickle Bits. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NumberGenerator <NSObject>

- (NSUInteger)randomBetween:(NSInteger)min and:(NSInteger)max;

@end

@interface RandomNumberGenerator : NSObject <NumberGenerator>

@end
