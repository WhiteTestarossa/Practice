//
//  main.m
//  NSString
//
//  Created by Daniel Belokursky on 9.02.22.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin accumsan bibendum sapien vitae aliquam. Mauris id justo dictum, bibendum sem nec, efficitur felis. Phasellus justo diam, congue at dolor placerat, lacinia malesuada purus. Sed ac vehicula odio, porttitor commodo diam. Suspendisse posuere tincidunt magna, ut pretium erat dignissim nec. Duis nec felis a lacus aliquet semper. Curabitur neque tellus, fringilla eu mi vitae, bibendum convallis turpis. Sed nec mi at dolor tristique accumsan. Vestibulum accumsan eleifend nulla non vehicula. Duis sit amet lorem lorem. Aenean viverra enim eget fermentum gravida. In et laoreet ante. Vivamus molestie hendrerit pretium. Suspendisse leo est, accumsan dictum commodo eget, varius et metus. Sed facilisis nibh ac hendrerit fringilla. Praesent ac sem tellus.";
        
        
        NSRange lastWordRange = [text rangeOfString:@"elit"];
//        NSLog(@"location = %lu, lenght = %lu",(unsigned long)lastWordRange.location, lastWordRange.length);
        NSString *str1 = [text substringToIndex:(lastWordRange.location + lastWordRange.length + 1)];
//        NSLog(@"%@",str1);
        NSString *str2 = [text substringToIndex:[text length] / 2];
//        NSLog(@"%@",str2);
        NSString *str3 = [text substringFromIndex:[text length] / 2];
//        NSLog(@"%@",str3);
        NSArray *arr = [text componentsSeparatedByString:@"."];
        NSMutableArray *mutableArray = [arr mutableCopy];
        for (int i = 0; i < mutableArray.count; i++) {
            if ([mutableArray[i] isEqualToString:@""]) {
                [mutableArray removeObjectAtIndex:i];
            }
        }
//        for (NSString *str in mutableArray) {
//            NSLog(@"%@", str);
//        }
        NSMutableArray *mutableArray2 = [NSMutableArray array];
        for (NSString *str in mutableArray) {
            if ([str rangeOfString:@"Sed"].location != NSNotFound) {
                [mutableArray2 addObject:str];
            }
        }
//        for (NSString *str in mutableArray2) {
//            NSLog(@"%@", str);
//        }
        NSArray *temp;
        NSMutableArray *mutableArray3 = [NSMutableArray array];
        NSMutableString *mutableString = [NSMutableString string];
        for (NSString *str in mutableArray2) {
            temp = [str componentsSeparatedByString:@" "];
            for (NSString *str2 in [temp reverseObjectEnumerator]) {
                [mutableString appendFormat:@" %@",str2];
            }
            [mutableArray3 addObject:[mutableString copy]];
            [mutableString deleteCharactersInRange:NSMakeRange(0, mutableString.length)];
        }
//        for (NSString *str in mutableArray3) {
//            NSLog(@"%@", str);
//        }
    }
    return 0;
}
