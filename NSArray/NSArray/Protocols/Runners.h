//
//  Runners.h
//  NSArray
//
//  Created by Daniel Belokursky on 11.02.22.
//

#ifndef Runners_h
#define Runners_h

@protocol Runners <NSObject>

@property (nonatomic, assign) NSUInteger speedOfRunner;
@property (nonatomic, assign) NSUInteger maxDistance;
-(void)run;
@optional
-(void)longRun;

@end

#endif /* Runners_h */
