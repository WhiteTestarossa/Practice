//
//  Deck.h
//  Match
//
//  Created by Daniel Belokursky on 28.01.22.
//

#import <Foundation/Foundation.h>
#import "Card.h"
NS_ASSUME_NONNULL_BEGIN

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;
@end

NS_ASSUME_NONNULL_END
