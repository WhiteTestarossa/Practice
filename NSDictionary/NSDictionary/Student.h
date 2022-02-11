//
//  Student.h
//  NSDictionary
//
//  Created by Daniel Belokursky on 11.02.22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *lastName;

-(instancetype)initWithName:(NSString *)name and:(NSString *)lastName;
-(void)greeting;
-(NSString *)nameWithLastName;
@end

NS_ASSUME_NONNULL_END
