//
//  Dummy.h
//  Delegation
//
//  Created by Daniel Belokursky on 12.02.22.
//

#import <Foundation/Foundation.h>
#import "PatientDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface Dummy : NSObject <PatientDelegate>

@end

NS_ASSUME_NONNULL_END
