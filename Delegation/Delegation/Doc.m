//
//  Doc.m
//  Delegation
//
//  Created by Daniel Belokursky on 12.02.22.
//

#import "Doc.h"
#import "Patient.h"
@implementation Doc
- (instancetype)init
{
    self = [super init];
    if (self) {
        _journal = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)patientNeedHealing:(Patient *) patient {
    if (patient.temp >= 38 && patient.headache == NO) {
        NSString *pill = @"ASPIRIN";
        [patient takePill:pill];
    } else if (patient.temp <= 38 && patient.headache == YES) {
        NSString *pill = @"IBUPROFEN";
        [patient takePill: pill];
    } else if (patient.temp >= 38 && patient.headache == YES) {
        NSString *pill = @"PARACETAMOL + IBUPROFEN";
        [patient takePill: pill];
    } else {
        NSString *pill = @"PARACETAMOL";
        [patient takePill: pill];
    }
    
    NSString *problemPart = [self searchProblem:patient]; //???????
    [self.journal setObject: problemPart forKey:patient.name];
}

- (NSString *)searchProblem:(Patient *)patient {
    switch (patient.bodyPart) {
        case head:
            return @"Head";
        case stomach:
            return @"Stomach";
        case back:
            return @"Back";
        case eyse:
            return @"Eyes";
            break;
        default:
            break;
    }
}

- (void)checkJournal {
    for (NSString *key in self.journal.allKeys) {
        NSLog(@"name: %@ problem: %@",key, [self.journal objectForKey:key]);
    }
}

@end
