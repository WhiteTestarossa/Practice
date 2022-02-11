//
//  Dumm.h
//  NSArray
//
//  Created by Daniel Belokursky on 11.02.22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dumm : NSObject

@property (nonatomic, strong) NSString *name;
- (instancetype)initWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
