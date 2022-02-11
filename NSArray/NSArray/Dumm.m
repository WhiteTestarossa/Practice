//
//  Dumm.m
//  NSArray
//
//  Created by Daniel Belokursky on 11.02.22.
//

#import "Dumm.h"

@implementation Dumm

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}
@end
