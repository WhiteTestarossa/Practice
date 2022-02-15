//
//  Obs.h
//  Notifications
//
//  Created by Daniel Belokursky on 15.02.22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Obs : NSObject

@property (nonatomic, strong) NSString *name;

-(void)checkNotification: (NSNotification *)notification;
@end

NS_ASSUME_NONNULL_END
