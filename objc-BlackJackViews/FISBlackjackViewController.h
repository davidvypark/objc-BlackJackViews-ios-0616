//
//  FISBlackjackViewController.h
//  objc-BlackJackViews
//
//  Created by David Park on 6/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISBlackjackGame.h"
#import "FISBlackjackPlayer.h"


@interface FISBlackjackViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (weak, nonatomic) IBOutlet UIButton *dealButton;

@property (weak, nonatomic) IBOutlet UILabel *houseLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseStayedLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseCard0;
@property (weak, nonatomic) IBOutlet UILabel *houseCard1;
@property (weak, nonatomic) IBOutlet UILabel *houseCard2;
@property (weak, nonatomic) IBOutlet UILabel *houseCard3;
@property (weak, nonatomic) IBOutlet UILabel *houseCard4;
@property (weak, nonatomic) IBOutlet UILabel *houseWinsCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseBustedLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseLossesCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseBlackjackLabel;

@property (weak, nonatomic) IBOutlet UILabel *playerLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerStayedLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerScoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *playerHitButton;
@property (weak, nonatomic) IBOutlet UIButton *playerStayButton;
@property (weak, nonatomic) IBOutlet UILabel *playerCard0;
@property (weak, nonatomic) IBOutlet UILabel *playerCard1;
@property (weak, nonatomic) IBOutlet UILabel *playerCard2;
@property (weak, nonatomic) IBOutlet UILabel *playerCard3;
@property (weak, nonatomic) IBOutlet UILabel *playerCard4;
@property (weak, nonatomic) IBOutlet UILabel *playerWinsCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerBustedLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerLossesCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerBlackjackLabel;

@property (strong, nonatomic)FISBlackjackGame *game;
@property (strong, nonatomic)FISBlackjackPlayer *house;
@property (strong, nonatomic)FISBlackjackPlayer *player;

@property (nonatomic)BOOL didHouseWin;

@property (strong, nonatomic)NSMutableArray *houseCardsLabelsArray;
@property (strong, nonatomic)NSMutableArray *playerCardsLabelsArray;


@end
