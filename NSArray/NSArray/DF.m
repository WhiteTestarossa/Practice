//
//  DF.m
//  NSArray
//
//  Created by Daniel Belokursky on 10.02.22.
//

#import "DF.h"

@implementation DF

-(instancetype)initWithName:(NSString *)name height:(NSUInteger)height weight:(NSUInteger)weight gender:(NSString *)gender license:(NSString *)license identification:(BOOL)identification {
    self = [super init];
    if (self) {
        self.name = name;
        self.height = height;
        self.weight = weight;
        self.gender = gender;
        self.license = license;
        self.identification = identification;
    }
    return self;
}

- (void)move {
    [super move];
    NSLog(@"DF Watching..");
}
@end
