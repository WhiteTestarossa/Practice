//
//  CardMatchingGame.h
//  Match
//
//  Created by Daniel Belokursky on 28.01.22.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
NS_ASSUME_NONNULL_BEGIN

@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@end

NS_ASSUME_NONNULL_END
