//
//  main.m
//  Notifications
//
//  Created by Daniel Belokursky on 14.02.22.
//

#import <Foundation/Foundation.h>
#import "Government.h"
#import "Obs.h"
#import "Doc.h"
#import "CEO.h"
#import "OldGuy.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Government *gov = [[Government alloc] init];
        Doc *doc = [[Doc alloc] init];
        CEO *ceo = [[CEO alloc] init];
        OldGuy *oldGuy = [[OldGuy alloc] init];
        
        
        gov.salary = 1;
        gov.averagePrice = 1;
        gov.pension = 1;
        gov.taxLevel = 1;
        
    }
    return 0;
}
