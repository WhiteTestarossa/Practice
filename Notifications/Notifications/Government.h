//
//  Government.h
//  Notifications
//
//  Created by Daniel Belokursky on 15.02.22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const GovernmentTaxLevelDidChangeNotification;
extern NSString *const GovernmentSalaryDidChangeNotification;
extern NSString *const GovernmentPensionDidChangeNotification;
extern NSString *const GovernmentAveragePriceDidChangeNotification;

extern NSString *const GovernmentTaxLevelUserInfoKey;
extern NSString *const GovernmentSalaryUserInfoKey;
extern NSString *const GovernmentPensionUserInfoKey;
extern NSString *const GovernmentAveragePriceUserInfoKey;


@interface Government : NSObject

@property (nonatomic, assign) float taxLevel;
@property (nonatomic, assign) float salary;
@property (nonatomic, assign) float pension;
@property (nonatomic, assign) float averagePrice;

@end

NS_ASSUME_NONNULL_END
