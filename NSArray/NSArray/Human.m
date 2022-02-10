//
//  Human.m
//  NSArray
//
//  Created by Daniel Belokursky on 10.02.22.
//

#import "Human.h"

@implementation Human

- (instancetype)initWithName:(NSString *)name height:(NSUInteger)height weight:(NSUInteger)weight gender:(NSString *)gender
{
    self = [super init];
    if (self) {
        self.name = name;
        self.height = height;
        self.weight = weight;
        self.gender = gender;
    }
    return self;
}
- (void)move {
    NSLog(@"Human stalling");
}
- (NSString *)printName {
    return self.name;
}
@end
