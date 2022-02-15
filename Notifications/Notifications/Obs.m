//
//  Obs.m
//  Notifications
//
//  Created by Daniel Belokursky on 15.02.22.
//

#import "Obs.h"
#import "Government.h"
@implementation Obs

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"Andy";
        [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(checkNotification:) name:GovernmentSalaryDidChangeNotification object:nil];
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
