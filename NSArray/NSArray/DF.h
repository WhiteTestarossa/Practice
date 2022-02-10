//
//  DF.h
//  NSArray
//
//  Created by Daniel Belokursky on 10.02.22.
//

#import "Human.h"

NS_ASSUME_NONNULL_BEGIN

@interface DF : Human
@property (nonatomic, strong) NSString *license;
@property (nonatomic, assign) BOOL identification;

-(instancetype)initWithName:(NSString *)name height:(NSUInteger)height weight:(NSUInteger)weight gender:(NSString *)gender license:(NSString *)license identification:(BOOL)identification;
@end

NS_ASSUME_NONNULL_END
