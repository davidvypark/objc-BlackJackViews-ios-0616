//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by David Park on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"

@implementation FISCardDeck



-(instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        _remainingCards = [NSMutableArray new];
        _dealtCards = [NSMutableArray new];
        
        [self generateDeck];
    }
    
    return self;
}

-(FISCard *)drawNextCard{
    
    if([self.remainingCards count] == 0) {
        return nil;
        NSLog(@"The Deck is Empty");
    }
    
    FISCard *pickedCard = self.remainingCards[0];
    [self.dealtCards addObject: self.remainingCards[0]];
    [self.remainingCards removeObjectAtIndex:0];

    return pickedCard;
}

-(void)resetDeck {
    
    [self gatherDealtCards];
    [self shuffleRemainingCards];
    
}

-(void)gatherDealtCards {
    
    [self.remainingCards addObjectsFromArray:self.dealtCards];
    [self.dealtCards removeAllObjects];
    

}

-(void)shuffleRemainingCards {
    
    NSMutableArray *tempArray = [self.remainingCards mutableCopy];
    [self.remainingCards removeAllObjects];
    
    while([tempArray count] != 0) {
        NSUInteger randomIndex = arc4random_uniform((int)[tempArray count]);
        [self.remainingCards addObject:tempArray[randomIndex]];
        [tempArray removeObjectAtIndex:randomIndex];
        
    }
    
    
    
}

-(void)generateDeck {
    
    
    
    for (NSString *suit in [FISCard validSuits]) {
        for (NSString *rank in [FISCard validRanks]) {
            
            FISCard *newCard = [[FISCard alloc] initWithSuit:suit rank:rank];
            
            [self.remainingCards addObject:newCard];
        }
    }
    
    
}

- (NSString *)description {
    
    NSMutableString *customString = [NSMutableString stringWithString:@"count:"];
    
    [customString appendFormat:@" %lu\ncards:\n", [self.remainingCards count]];
    
    for (FISCard *card in self.remainingCards) {
        [customString appendFormat:@"  %@", card.description];
    }
    NSLog(@"%@", customString);
    return customString;
}

@end
