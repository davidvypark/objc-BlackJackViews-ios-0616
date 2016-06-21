//
//  FISCardDeck.h
//  OOP-Cards-Model
//
//  Created by David Park on 6/15/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISCardDeck : NSObject

@property (strong, nonatomic)NSMutableArray *remainingCards;
@property (strong, nonatomic)NSMutableArray *dealtCards;


-(instancetype)init;

-(FISCard *)drawNextCard;

-(void)resetDeck;

-(void)gatherDealtCards;

-(void)shuffleRemainingCards;

@end
