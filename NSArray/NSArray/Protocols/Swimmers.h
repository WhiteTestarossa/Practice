//
//  Swimmers.h
//  NSArray
//
//  Created by Daniel Belokursky on 11.02.22.
//

#ifndef Swimmers_h
#define Swimmers_h

@protocol Swimmers <NSObject>

@property (nonatomic, assign) NSUInteger swimSpeed;
@property (nonatomic, assign) NSUInteger swimDistance;
-(void)swim;
@optional
-(void)deepSwim

@end

#endif /* Swimmers_h */
