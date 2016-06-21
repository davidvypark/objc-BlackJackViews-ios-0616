//
//  FISBlackjackViewController.m
//  objc-BlackJackViews
//
//  Created by David Park on 6/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackViewController.h"

@implementation FISBlackjackViewController

-(void)viewDidLoad {
    
    self.game = [[FISBlackjackGame alloc] init];
    self.game.player = [[FISBlackjackPlayer alloc] init];
    self.game.house = [[FISBlackjackPlayer alloc] init];
    self.houseCardsLabelsArray = [[NSMutableArray alloc] init];
    self.playerCardsLabelsArray = [[NSMutableArray alloc] init];
    
    [self.houseCardsLabelsArray addObjectsFromArray:@[self.houseCard0, self.houseCard1, self.houseCard2, self.houseCard3, self.houseCard4]];
    [self.playerCardsLabelsArray addObjectsFromArray:@[self.playerCard0, self.playerCard1, self.playerCard2, self.playerCard3, self.playerCard4]];
    
    [self newGameHideCardsAndLabels];
}

- (IBAction)dealButton:(id)sender {
    
    [self.game.house resetForNewGame];
    [self.game.player resetForNewGame];
    
    [self.game.deck resetDeck];
    [self.game.deck shuffleRemainingCards];
    [self.game dealNewRound];

    //self.winnerLabel.text = @"Hit or Stay?";
    
    [self updateCardsAndScoreOnTable];
    
    if (self.game.player.blackjack) {
        self.playerBlackjackLabel.hidden = false;               //player wins
        self.didHouseWin = false;
        [self gameOverEnableButtonsUpdateScores];
        self.winnerLabel.hidden = false;
        self.winnerLabel.text = @"You Win!";
    } else if (self.game.house.blackjack) {
        self.houseBlackjackLabel.hidden = false;                //house wins
        self.didHouseWin = true;
        [self gameOverEnableButtonsUpdateScores];
        self.winnerLabel.hidden = false;
        self.winnerLabel.text = @"You Lose!";
    }
    
    self.playerHitButton.enabled = true;
    self.playerStayButton.enabled = true;
    self.dealButton.enabled = false;
    
    self.houseScoreLabel.hidden = false;
    self.playerScoreLabel.hidden = false;
}

- (IBAction)hitButton:(id)sender {
    
    [self.game dealCardToPlayer];
    [self updateCardsAndScoreOnTable];
    
    if (self.game.player.busted) {                              //house wins
        self.playerBustedLabel.hidden = false;
        self.didHouseWin = true;
        [self gameOverEnableButtonsUpdateScores];
        self.winnerLabel.hidden = false;
        self.winnerLabel.text = @"You Lose!";
    }
}

- (IBAction)stayButton:(id)sender {
    
    self.playerStayedLabel.hidden = false;
    self.playerHitButton.enabled = false;
    self.playerStayButton.enabled = false;
    self.winnerLabel.hidden = false;
    
    [self.game processHouseTurn];
    
    [self updateCardsAndScoreOnTable];
    

    
    if (self.game.house.busted) {                                                   //player wins
        self.houseBustedLabel.hidden = false;
        self.didHouseWin = false;
        [self gameOverEnableButtonsUpdateScores];
        self.winnerLabel.text = @"You Win!";
    } else if (self.game.player.handscore <= self.game.house.handscore) {           //house wins
        self.didHouseWin = true;
        [self gameOverEnableButtonsUpdateScores];
        self.winnerLabel.text = @"You Lose!";
    } else {                                                                        //player wins
        self.didHouseWin = false;
        [self gameOverEnableButtonsUpdateScores];
        self.winnerLabel.text = @"You Win!";
    }
}


-(void)updateWinLossLabels {
    
    [self.game incrementWinsAndLossesForHouseWins:self.game.houseWins];
    
}

-(void)updateCardsAndScoreOnTable {
    
    for (NSUInteger i = 0; i < [self.game.house.cardsInHand count]; i++) {
        FISCard *currentCard = self.game.house.cardsInHand[i];
        UILabel *currentLabel = self.houseCardsLabelsArray[i];
        
        currentLabel.text = currentCard.cardLabel;
        currentLabel.hidden = false;

    }
    
    for (NSUInteger i = 0; i < [self.game.player.cardsInHand count]; i++) {
        FISCard *currentCard = self.game.player.cardsInHand[i];
        UILabel *currentLabel = self.playerCardsLabelsArray[i];
        
        currentLabel.text = currentCard.cardLabel;
        currentLabel.hidden = false;
    }
    
    self.houseScoreLabel.text = [NSString stringWithFormat:@"Score: %lu", self.game.house.handscore];
    self.playerScoreLabel.text = [NSString stringWithFormat:@"Score: %lu", self.game.player.handscore];
}

-(void)gameOverEnableButtonsUpdateScores {
    
    self.dealButton.enabled = true;
    self.playerHitButton.enabled = false;
    self.playerStayButton.enabled = false;
    
    [self.game incrementWinsAndLossesForHouseWins:self.didHouseWin];
    
    self.houseWinsCountLabel.text = [NSString stringWithFormat:@"Wins: %lu", self.game.house.wins];
    self.houseLossesCountLabel.text = [NSString stringWithFormat:@"Losses: %lu", self.game.house.losses];
    self.playerWinsCountLabel.text = [NSString stringWithFormat:@"Wins: %lu", self.game.player.wins];
    self.playerLossesCountLabel.text = [NSString stringWithFormat:@"Losses %lu", self.game.player.losses];
    
}

-(void)newGameHideCardsAndLabels {
    
    for(UILabel *label in self.houseCardsLabelsArray) {
        label.hidden = true;
    }
    for(UILabel *label in self.playerCardsLabelsArray) {
        label.hidden = true;
    }
    
    self.houseBustedLabel.hidden = true;
    self.houseStayedLabel.hidden = true;
    self.houseBlackjackLabel.hidden = true;
    self.playerBustedLabel.hidden = true;
    self.playerStayedLabel.hidden = true;
    self.playerBlackjackLabel.hidden = true;
    self.winnerLabel.hidden = true;
    self.houseScoreLabel.hidden = true;
    self.playerScoreLabel.hidden = true;
}




@end
