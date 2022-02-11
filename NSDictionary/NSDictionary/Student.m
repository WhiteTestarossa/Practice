//
//  Student.m
//  NSDictionary
//
//  Created by Daniel Belokursky on 11.02.22.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name and:(NSString *)lastName {
    
    self = [super init];
    if (self) {
        self.name = name;
        self.lastName = lastName;
    }
    return self;
}

- (void)greeting {
    NSLog(@"Hello!");
}

-(NSString *)description {
    NSString *description = [NSString stringWithFormat:@"Name: %@, LastName: %@",self.name,self.lastName];
    return description;
}

-(NSString *)nameWithLastName {
    NSString *str = [NSString stringWithFormat:@"%@ %@",self.name,self.lastName];
    return str;
}

@end
