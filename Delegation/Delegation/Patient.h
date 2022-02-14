//
//  Patient.h
//  Delegation
//
//  Created by Daniel Belokursky on 12.02.22.
//

#import <Foundation/Foundation.h>
#import "PatientDelegate.h"
NS_ASSUME_NONNULL_BEGIN
@class Doc;

typedef enum {
    head,
    stomach,
    back,
    eyse
} bodyPart;

@interface Patient : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) float temp;
@property (nonatomic, assign) BOOL headache;
@property (nonatomic, weak) id <PatientDelegate> delegate;
@property (nonatomic, assign) bodyPart bodyPart;

-(instancetype)initWithTemp: (float) t andHeadache: (BOOL) h andBodyPart: (bodyPart)b andName: (NSString *)name;
-(BOOL)becomeWorse;
-(void)takePill: (NSString *)pill;
-(void)selfHelp;

@end

NS_ASSUME_NONNULL_END
