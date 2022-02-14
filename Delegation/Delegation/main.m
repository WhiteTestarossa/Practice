//
//  main.m
//  Delegation
//
//  Created by Daniel Belokursky on 12.02.22.
//

#import <Foundation/Foundation.h>
#import "Patient.h"
#import "Doc.h"
#import "Dummy.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Patient *a = [[Patient alloc] initWithTemp:36.6 andHeadache:NO andBodyPart: head andName:@"Max"];
        Patient *b = [[Patient alloc] initWithTemp:38.5 andHeadache:NO andBodyPart: eyse andName:@"Joe"];
        Patient *c = [[Patient alloc] initWithTemp:38.5 andHeadache:YES andBodyPart: back andName:@"Benji"];
        Patient *d = [[Patient alloc] initWithTemp:37.5 andHeadache:YES andBodyPart: stomach andName:@"Ray"];
        Doc *doc = [[Doc alloc] init];
        Dummy *dummy = [[Dummy alloc] init];
        
        NSArray *dudes = [NSArray arrayWithObjects:a,b,c,d, nil];
        
        for (Patient *dude in dudes) {
            if (arc4random() % 2) {
                dude.delegate = doc;
            } else {
                dude.delegate = dummy;
            }
            if ([dude becomeWorse]) {
                [dude selfHelp];
            }
        }
        
        [doc checkJournal];
    }
    return 0;
}
