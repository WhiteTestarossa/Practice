//
//  Animal.m
//  NSArray
//
//  Created by Daniel Belokursky on 10.02.22.
//

#import "Animal.h"


@implementation Animal

- (instancetype)initWithName:(NSString *)name {
    {
        self = [super init];
        if (self) {
            self.name = name;
        }
        return self;
    }
}
- (void)move{
    NSLog(@"Animal walking");
}
- (NSString *)printName {
    return self.name;
}

//Protocol stuff
- (void)jump {
    NSLog(@"%@ Jumping", self.name);
}
-(void)highJump{
    NSLog(@"%@ Jumping High",self.name);
}

@end
