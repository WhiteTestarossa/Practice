//
//  Human.h
//  NSArray
//
//  Created by Daniel Belokursky on 10.02.22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Human : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSUInteger height;
@property (nonatomic, assign) NSUInteger weight;
@property (nonatomic, strong) NSString *gender;

- (void)move;
-(instancetype)initWithName:(NSString *)name height:(NSUInteger)height weight:(NSUInteger)weight gender:(NSString *)gender;
-(NSString *)printName;
@end

NS_ASSUME_NONNULL_END
