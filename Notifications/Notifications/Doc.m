//
//  Doc.m
//  Notifications
//
//  Created by Daniel Belokursky on 15.02.22.
//

#import "Doc.h"
#import "Government.h"
@implementation Doc
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(checkNotification:) name:GovernmentSalaryDidChangeNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(checkNotification:) name:GovernmentAveragePriceDidChangeNotification object:nil];
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
