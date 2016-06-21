//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by David Park on 6/15/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer

-(instancetype)init {
    
    self = [self initWithName:@""];
    
    return self;
}

-(instancetype)initWithName:(NSString *)name {
    
    self = [super init];
    
    if(self) {
        
        _name = name;
        _cardsInHand = [NSMutableArray new];
        _handscore = 0;
        _wins = 0;
        _losses = 0;
        _aceInHand = NO;
        _blackjack = NO;
        _stayed = NO;
        _busted = NO;
    
    }
    
    return self;
}

-(void)resetForNewGame {
    
    [self.cardsInHand removeAllObjects];
    self.handscore = 0;
    self.aceInHand = NO;
    self.stayed = NO;
    self.blackjack = NO;
    self.busted = NO;
    
}

-(void)acceptCard:(FISCard *)card {
    
    [self.cardsInHand addObject:card];
    
    for (FISCard *theCard in self.cardsInHand) {
        if ([theCard.rank isEqualToString:@"A"]) {
            self.aceInHand = YES;
        }
    }
    
    NSUInteger rollingSum = 0;
    for (FISCard *theCard in self.cardsInHand) {
        rollingSum += theCard.cardValue;
    }
    
    self.handscore = rollingSum;
    
    if (self.aceInHand && self.handscore <= 11){
        self.handscore += 10;
    }
    
    if (self.handscore == 21 && self.cardsInHand.count == 2) {
        self.blackjack = YES;
    }
    
    if (self.handscore > 21) {
        self.busted = YES;
    }
    
    
}

-(BOOL)shouldHit {
    
    if (self.handscore >= 17) {
        self.stayed = YES;
        return NO;
    }
    return YES;
}

-(NSString *)description {
    NSMutableString *customPrintout = [NSMutableString stringWithString:@"FISBlackjackPlayer:\n"];
    
    NSMutableArray *cardsInHandLabel = [[NSMutableArray alloc] init];
    for (FISCard *card in self.cardsInHand) {
        [cardsInHandLabel addObject:card.cardLabel];
    }
    
    [customPrintout appendFormat:@"   name: %@\n   cards: %@\n   handscore: %lu\n   ace in hand: %d\n   stayed: %d\n   blackjack: %d\n   busted : %d\n   wins: %lu\n   losses:%lu", self.name, cardsInHandLabel, self.handscore, self.aceInHand, self.stayed, self.blackjack, self.busted, self.wins, self.losses];
    
    
    
    
    return customPrintout;
}

@end
