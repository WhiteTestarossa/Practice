//
//  Dummy.m
//  Delegation
//
//  Created by Daniel Belokursky on 12.02.22.
//

#import "Dummy.h"
#import "Patient.h"
@implementation Dummy

- (void)patientNeedHealing:(Patient *) patient {
    if (patient.temp >= 38 && patient.headache == NO) {
        NSLog(@"SLEEP");
    } else if (patient.temp >= 38 && patient.headache == YES) {
        NSLog(@"ANTIBIOTIC");
    } else {
        NSLog(@"NAAAHH, JUST CHILL BRO");
    }
}
@end
