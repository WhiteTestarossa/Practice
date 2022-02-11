//
//  Ghost.h
//  NSArray
//
//  Created by Daniel Belokursky on 11.02.22.
//

#import <Foundation/Foundation.h>
#import "Jumpers.h"
#import "Runners.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ghost : NSObject <Jumpers, Runners>

- (instancetype)initWith:(NSUInteger)speedOfJump mDJ:(NSUInteger)maxDistanceJump sOR:(NSUInteger)speedOfRunner mD:(NSUInteger)maxDistance;

@property (nonatomic, assign) NSUInteger speedOfJump;
@property (nonatomic, assign) NSUInteger maxDistanceOfJump;
@property (nonatomic, assign) NSUInteger speedOfRunner;
@property (nonatomic, assign) NSUInteger maxDistance;

-(void)jump;
-(void)highJump;
-(void)run;
-(void)longRun;

@end

NS_ASSUME_NONNULL_END
