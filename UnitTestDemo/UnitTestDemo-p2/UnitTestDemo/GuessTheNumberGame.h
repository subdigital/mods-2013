//
//  GuessTheNumberGame.h
//  UnitTestDemo
//
//  Created by ben on 10/5/13.
//  Copyright (c) 2013 Fickle Bits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RandomNumberGenerator.h"

typedef NS_ENUM(NSInteger, GuessResult) {
    GuessCorrect = 0,
    GuessIncorrect
};

@interface GuessTheNumberGame : NSObject

@property (nonatomic, readonly) NSInteger numberOfGuesses;
@property (nonatomic, readonly) NSInteger minimumNumber;
@property (nonatomic, readonly) NSInteger maximumNumber;

- (id)initWithMax:(NSInteger)max;
- (id)initWithMax:(NSInteger)max numberGenerator:(id<NumberGenerator>)numberGenerator;

- (GuessResult)guess:(NSInteger)number;

@end
