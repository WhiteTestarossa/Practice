//
//  main.m
//  NSDictionary
//
//  Created by Daniel Belokursky on 11.02.22.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *a = [[Student alloc] initWithName:@"a" and:@"a1"];
        Student *b = [[Student alloc] initWithName:@"b" and:@"b2"];
        Student *c = [[Student alloc] initWithName:@"c" and:@"c3"];
        Student *d = [[Student alloc] initWithName:@"d" and:@"d4"];
        Student *f = [[Student alloc] initWithName:@"f" and:@"f5"];
        
        NSArray *stdArray = [NSArray arrayWithObjects:a,d,f,b,c, nil];
        NSMutableArray *keysArray = [NSMutableArray array];
        
        for (Student *std in stdArray) {
            [keysArray addObject: [std nameWithLastName]];
        }
        
        for (NSString *key in keysArray) {
            NSLog(@"%@", key);
        }
        
        NSDictionary *jrnl = [NSDictionary dictionaryWithObjects:stdArray forKeys:keysArray];
        
//        for (NSString *key in [jrnl allKeys]) {
//            id std = [jrnl valueForKey:key];
//            NSLog(@"Key: %@, Value: %@",key, std);
//        }
        
        NSArray *sortedKeys = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
        
        for (NSString *key in sortedKeys) {
            Student *obj = [jrnl valueForKey:key];
            NSLog(@"%@",obj);
        }
        
    }
    return 0;
}
