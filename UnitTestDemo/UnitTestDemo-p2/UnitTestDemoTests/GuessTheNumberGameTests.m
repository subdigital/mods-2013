//
//  GuessTheNumberGameTests.m
//  UnitTestDemo
//
//  Created by ben on 10/5/13.
//  Copyright (c) 2013 Fickle Bits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GuessTheNumberGame.h"
#import "OCMock.h"

@interface GuessTheNumberGameTests : XCTestCase

@property (nonatomic, strong) GuessTheNumberGame *game;

@end

@implementation GuessTheNumberGameTests

- (void)setUp {
    [super setUp];
    
    self.game = [[GuessTheNumberGame alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCanCreateGame {
    XCTAssertNotNil(self.game, @"game should not be nil");
}

- (void)testGameKeepsTrackOfGuesses {
    [self.game guess:4];
    [self.game guess:5];
    
    XCTAssertEqual(self.game.numberOfGuesses, 2, @"Game should have counted 2 guesses");
}

- (void)testGuessSignifiesWhenItIsIncorrect {
    XCTAssertEqual([self.game guess:-1], GuessIncorrect, @"Guess should have returned incorrect guess");
}

- (void)testGameHasAMinimumNumber {
    XCTAssertEqual(self.game.minimumNumber, 1, @"Min number should have been 1");
}

- (void)testGameHasADefaultMaximumOf10 {
    XCTAssertEqual(self.game.maximumNumber, 10, @"Max should default to 10");
}

- (void)testGameCanBeInitializedWithAMaxNumber {
    self.game = [[GuessTheNumberGame alloc] initWithMax:12];
    XCTAssertEqual(self.game.maximumNumber, 12, @"Max should have been 12");
}

@end
