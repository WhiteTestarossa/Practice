//
//  Ghost.m
//  NSArray
//
//  Created by Daniel Belokursky on 11.02.22.
//

#import "Ghost.h"

@implementation Ghost

- (instancetype)initWith:(NSUInteger)speedOfJump mDJ:(NSUInteger)maxDistanceJump sOR:(NSUInteger)speedOfRunner mD:(NSUInteger)maxDistance
{
    self = [super init];
    if (self) {
        self.speedOfJump = speedOfJump;
        self.maxDistanceOfJump = maxDistanceJump;
        self.speedOfRunner = speedOfRunner;
        self.maxDistance = maxDistance;
    }
    return self;
}


- (void)jump {
    NSLog(@"%@ Jumping",self.className);
}

- (void)run {
    NSLog(@"%@ Running",self.className);
}

@end
