//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by David Park on 6/15/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

-(instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        _deck = [[FISCardDeck alloc] init];
        _house = [[FISBlackjackPlayer alloc] initWithName:@"House"];
        _player = [[FISBlackjackPlayer alloc] initWithName:@"Player"];
    }
    
    return self;
}

-(void)playBlackjack {
    
    [self.deck resetDeck];
    [self dealNewRound];
    
    NSUInteger turn = 1;
    while (turn < 4){
        
        [self processPlayerTurn];
        if (self.player.busted) {
            break;
        }
        
        [self processHouseTurn];
        if (self.house.busted) {
            break;
        }
        
        turn++;
    }

    [self incrementWinsAndLossesForHouseWins:[self houseWins]];
    
    NSLog(@"%@", self.house.description);
    NSLog(@"%@", self.player.description);
    
    
}

-(void)dealNewRound {
    
    [self dealCardToPlayer];
    [self dealCardToHouse];
    [self dealCardToPlayer];
    [self dealCardToHouse];
    
}

-(void)dealCardToPlayer {
    
    [self.player acceptCard:[self.deck drawNextCard]];
    
}

-(void)dealCardToHouse {
    
    [self.house acceptCard:[self.deck drawNextCard]];
    
}

-(void)processPlayerTurn {
    
    if(self.player.shouldHit && !(self.player.stayed) && !(self.player.busted)) {
        [self dealCardToPlayer];
    }
}

-(void)processHouseTurn {
    
    if(self.house.shouldHit && !(self.house.stayed) && !(self.house.busted)) {
        [self dealCardToHouse];
    }
}

-(BOOL)houseWins {
    
    if(self.house.blackjack) {
        if(self.player.blackjack ) {
            return NO;
        } else {
            return YES;
        }
        
    } else if (self.player.busted) {
        return YES;
    
    } else if (self.player.handscore <= self.house.handscore) {
        if (self.house.busted) {
            return NO;
        } else {
            return YES;
        }
    }
    
    return NO;
}

-(void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins {
    
    if(houseWins) {
        self.house.wins += 1;
        self.player.losses += 1;
    
    } else {
        self.house.losses += 1;
        self.player.wins += 1;
    }
    
}

@end
