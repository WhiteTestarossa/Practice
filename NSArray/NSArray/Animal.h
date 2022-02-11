//
//  Animal.h
//  NSArray
//
//  Created by Daniel Belokursky on 10.02.22.
//

#import <Foundation/Foundation.h>
#import "Jumpers.h"

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject <Jumpers>
@property (nonatomic, strong) NSString *name;
-(instancetype)initWithName:(NSString *)name;
-(void)move;
-(NSString *)printName;

//Protocol stuff
@property (nonatomic, assign) NSUInteger speedOfJump;
@property (nonatomic, assign) NSUInteger maxDistanceOfJump;
-(void)jump;
-(void)highJump;

@end

NS_ASSUME_NONNULL_END
