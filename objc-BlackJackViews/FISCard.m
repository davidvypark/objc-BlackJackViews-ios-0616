//
//  FISCard.m
//  OOP-Cards-Model
//
//  Created by David Park on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCard.h"


@interface FISCard()

@property (strong, nonatomic, readwrite)NSString *suit;
@property (strong, nonatomic, readwrite)NSString *rank;
@property (strong, nonatomic, readwrite)NSString *cardLabel;
@property (nonatomic, readwrite)NSUInteger cardValue;

@end

@implementation FISCard

-(instancetype)init {
    
    self = [self initWithSuit:@"!" rank:@"N"];
    
    return self;
}


-(instancetype)initWithSuit:(NSString *)suit rank:(NSString *)rank {
    
    self = [super init];
    
    if (self) {
        
        NSArray *ranksArray = @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
        
        _suit = suit;
        _rank = rank;
        _cardLabel = [NSString stringWithFormat:@"%@%@", suit, rank];
        
        if ([ranksArray indexOfObject:rank] > 8) {
            _cardValue = 10;
        } else {
            _cardValue = [ranksArray indexOfObject:rank] + 1;
        }
    }
    
    return self;
}

+(NSArray *)validSuits {
    
    return @[@"♠" ,@"♥", @"♣", @"♦"];
}

+(NSArray *)validRanks {
    
    return @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

- (NSString *)description {
    
    return (self.cardLabel);
}


@end
