//
//  CEO.m
//  Notifications
//
//  Created by Daniel Belokursky on 15.02.22.
//

#import "CEO.h"
#import "Government.h"
@implementation CEO
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(checkNotification:) name:GovernmentTaxLevelDidChangeNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(checkNotification:) name:GovernmentAveragePriceDidChangeNotification object:nil];
        
        //UIApplicationDidEnterBackgroundNotification
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)checkNotification:(NSNotification *)notification {
    NSLog(@"Notification info: %@", notification);
}
@end
