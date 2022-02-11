//
//  Jumpers.h
//  NSArray
//
//  Created by Daniel Belokursky on 11.02.22.
//

#ifndef Jumpers_h
#define Jumpers_h

@protocol Jumpers <NSObject>

@property (nonatomic, assign) NSUInteger speedOfJump;
@property (nonatomic, assign) NSUInteger maxDistanceOfJump;
-(void)jump;

@optional
-(void)highJump;    
@end

#endif /* Jumpers_h */
