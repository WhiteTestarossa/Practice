//
//  Patient.m
//  Delegation
//
//  Created by Daniel Belokursky on 12.02.22.
//

#import "Patient.h"

@implementation Patient

- (instancetype)initWithTemp:(float)t andHeadache:(BOOL)h andBodyPart:(bodyPart)b andName:(NSString *)name {
    
    self = [super init];
    if (self) {
        _temp = t;
        _headache = h;
        _bodyPart = b;
        _name = name;
    }
    
    return self;
}

- (void)selfHelp {
    [self.delegate patientNeedHealing:self];
}

- (BOOL)becomeWorse {
    return YES;
}
- (void)takePill: (NSString *)pill {
    NSLog(@"TAKE RECOMMENDED PILL: %@", pill);
}
@end
