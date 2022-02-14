//
//  Doc.h
//  Delegation
//
//  Created by Daniel Belokursky on 12.02.22.
//

#import <Foundation/Foundation.h>
#import "PatientDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface Doc : NSObject <PatientDelegate>

@property (nonatomic, strong) NSMutableDictionary *journal;
-(instancetype)init;
-(void)checkJournal;
-(NSString *)searchProblem: (Patient *)patient;
@end

NS_ASSUME_NONNULL_END
