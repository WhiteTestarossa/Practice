//
//  Card.m
//  Match
//
//  Created by Daniel Belokursky on 28.01.22.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards {
    
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}
@end
