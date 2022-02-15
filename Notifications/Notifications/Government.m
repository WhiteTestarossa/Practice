//
//  Government.m
//  Notifications
//
//  Created by Daniel Belokursky on 15.02.22.
//

#import "Government.h"

NSString *const GovernmentTaxLevelDidChangeNotification = @"GovernmentTaxLevelDidChangeNotification";
NSString *const GovernmentSalaryDidChangeNotification = @"GovernmentSalaryDidChangeNotification";
NSString *const GovernmentPensionDidChangeNotification = @"GovernmentPensionDidChangeNotification";
NSString *const GovernmentAveragePriceDidChangeNotification = @"GovernmentAveragePriceDidChangeNotification";



@implementation Government

- (instancetype)init
{
    self = [super init];
    if (self) {
        _salary = 0;
        _taxLevel = 0;
        _pension = 0;
        _averagePrice = 0;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Salary: %f TaxLevel: %f Pension: %f AveragePrive: %f", self.salary, self.taxLevel, self.pension, self.averagePrice];
}

- (void)setSalary:(float)salary {
    _salary = salary;
    
    NSNotification *notification = [[NSNotification alloc] initWithName:GovernmentSalaryDidChangeNotification object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)setTaxLevel:(float)taxLevel {
    _taxLevel = taxLevel;
    
    NSNotification *notification = [[NSNotification alloc] initWithName:GovernmentTaxLevelDidChangeNotification object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)setPension:(float)pension {
    _pension = pension;
    
    NSNotification *notification = [[NSNotification alloc] initWithName:GovernmentPensionDidChangeNotification object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)setAveragePrice:(float)averagePrice {
    _averagePrice = averagePrice;
    
    NSNotification *notification = [[NSNotification alloc] initWithName:GovernmentAveragePriceDidChangeNotification object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end
