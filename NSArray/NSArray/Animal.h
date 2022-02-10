//
//  Animal.h
//  NSArray
//
//  Created by Daniel Belokursky on 10.02.22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject
@property (nonatomic, strong) NSString *name;
-(instancetype)initWithName:(NSString *)name;
-(void)move;
-(NSString *)printName;
@end

NS_ASSUME_NONNULL_END
