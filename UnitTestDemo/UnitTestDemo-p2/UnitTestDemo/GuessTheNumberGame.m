//
//  GuessTheNumberGame.m
//  UnitTestDemo
//
//  Created by ben on 10/5/13.
//  Copyright (c) 2013 Fickle Bits. All rights reserved.
//

#import "GuessTheNumberGame.h"

@interface GuessTheNumberGame () {
    NSInteger _answer;
}

@end

@implementation GuessTheNumberGame

- (id)init {
    return [self initWithMax:10];
}

- (id)initWithMax:(NSInteger)max {
    return [self initWithMax:max numberGenerator:[RandomNumberGenerator new]];
}

- (id)initWithMax:(NSInteger)max numberGenerator:(id<NumberGenerator>)numberGenerator {
    self = [super init];
    if (self) {
        _minimumNumber = 1;
        _maximumNumber = max;
        _answer = [numberGenerator randomBetween:_minimumNumber and:_maximumNumber];
    }
    return self;
    
}

- (GuessResult)guess:(NSInteger)number {
    _numberOfGuesses += 1;
    if (number == _answer) {
        return GuessCorrect;
    } else {
        return GuessIncorrect;
    }
}

@end
