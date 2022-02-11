//
//  main.m
//  NSArray
//
//  Created by Daniel Belokursky on 10.02.22.
//

#import <Foundation/Foundation.h>
#import "Human.h"
#import "Cyclist.h"
#import "Runner.h"
#import "Swimmer.h"
#import "DF.h"
#import "Animal.h"
#import "Dog.h"
#import "Cat.h"
#import "Ghost.h"
#import "Dumm.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Human *human = [[Human alloc] initWithName:@"Sonny" height:189 weight:80 gender:@"M"];
        Cyclist *cyclist = [[Cyclist alloc] initWithName:@"Frank" height:170 weight:65 gender:@"M"];
        Runner *runner = [[Runner alloc] initWithName:@"Marty" height:175 weight:70 gender:@"M"];
        Swimmer *swimmer = [[Swimmer alloc] initWithName:@"Ray" height:180 weight:85 gender:@"M"];
        DF *df = [[DF alloc] initWithName:@"Jean" height:190 weight:75 gender:@"M" license:@"GUN" identification:YES];
        Animal *animal = [[Animal alloc] initWithName:@"Bozo"];
        Dog *dog = [[Dog alloc] initWithName:@"D"];
        Cat *cat = [[Cat alloc] initWithName:@"C"];
        
        NSArray *retards = [NSArray arrayWithObjects:human,cyclist,runner,swimmer,df, nil];
//        for (Human *h in [retards reverseObjectEnumerator]) {
//            if ([h isMemberOfClass: [DF class]]) {
//                DF *obj = (DF *)h;
//                NSLog(@"name: %@, height: %lu, weight:%lu, gender: %@, license: %@, identification: %hhd",obj.name,obj.height,obj.weight,obj.gender,obj.license,obj.identification);
//                [obj move];
//            } else {
//                NSLog(@"name: %@, height: %lu, weight:%lu, gender: %@",h.name,h.height,h.weight,h.gender );
//                [h move];
//            }
//        }
        NSArray *mfk = [NSArray arrayWithObjects:human,cyclist,runner,swimmer,animal,dog,df,cat, nil];
//        for (id item in mfk) {
//            if ([item isKindOfClass:[Human class]]) {
//                NSLog(@"CLASS: HUMAN");
//                if ([item isMemberOfClass:[DF class]]){
//                    NSLog(@"CLASS: DF");
//                    DF *obj = (DF *)item;
//                    NSLog(@"name: %@, height: %lu, weight:%lu, gender: %@, license: %@, identification: %hhd",obj.name,obj.height,obj.weight,obj.gender,obj.license,obj.identification);
//                    [obj move];
//                } else {
//                    Human *h = (Human *)item;
//                    NSLog(@"name: %@, height: %lu, weight:%lu, gender: %@",h.name,h.height,h.weight,h.gender);
//                    [h move];
//                }
//            } else if ([item isKindOfClass:[Animal class]]) {
//                NSLog(@"CLASS: ANIMAL");
//                Animal *a = (Animal *)item;
//                NSLog(@"name: %@",a.name);
//                [a move];
//            }
//        }
        NSArray *anmls = [NSArray arrayWithObjects:animal,cat,dog, nil];
//        for (int i = 0; i < (retards.count > anmls.count ? retards.count : anmls.count); i++) {
//            if (i < anmls.count - 1) {
//                NSLog(@"%@", [[anmls objectAtIndex:i] name]);
//            }
//            if (i < retards.count - 1) {
//                NSLog(@"%@", [retards objectAtIndex:i]);
//            }
//        }
        NSSortDescriptor *desc = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        NSArray *sorted = [mfk sortedArrayUsingDescriptors:@[desc]];
//        for (id item in sorted) {
//            if ([item isKindOfClass:[Human class]]) {
//                NSLog(@"%@",[item name]);
//            } else {
//                NSLog(@"%@",[item name]);
//            }
//        }
        Ghost *ghost = [[Ghost alloc] initWith:100 mDJ:50 sOR:100 mD:50];
        Dumm *d = [[Dumm alloc] initWithName:@"dmf"];
        NSArray *idt = [NSArray arrayWithObjects:human,animal,ghost,d, nil];
        for (id <Jumpers, Runners> object in idt) {
            if ([object conformsToProtocol:@protocol(Jumpers)] && ![object conformsToProtocol:@protocol(Runners)]) {
                [object jump];
                NSLog(@"%lu",object.speedOfJump);
                if ([object respondsToSelector:@selector(highJump)]) {
                    [object highJump];
                    NSLog(@"%lu", object.maxDistanceOfJump);
                }
            }
            if ([object conformsToProtocol:@protocol(Runners)] && ![object conformsToProtocol:@protocol(Jumpers)]) {
                [object run];
                NSLog(@"%lu",object.speedOfRunner);
                if ([object respondsToSelector:@selector(longRun)]) {
                    [object longRun];
                    NSLog(@"%lu", object.maxDistance);
                }
            }
            if ([object conformsToProtocol:@protocol(Runners)] && [object conformsToProtocol:@protocol(Jumpers)]) {
                [object run];
                NSLog(@"maxSpeed: %lu",object.speedOfRunner);
                NSLog(@"maxDeistance: %lu", object.maxDistance);
                [object jump];
                NSLog(@"maxJumpSpeed: %lu",object.speedOfJump);
                NSLog(@"maxJumpDistance: %lu", object.maxDistance);
                
                if ([object respondsToSelector:@selector(longRun)] && [object respondsToSelector:@selector(highJump)]) {
                    [object longRun];
                    [object highJump];
                } else {
                    NSLog(@"GHOST IS BOZO!!!!!!");
                }
            }
            if (![object conformsToProtocol:@protocol(Runners)] && ![object conformsToProtocol:@protocol(Jumpers)]) {
                Dumm *a = (Dumm *) object;
                NSLog(@"%@ = A DUMM?!?!??!", a.name);
            }
        }
        
    }
    return 0;
}
