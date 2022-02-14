//
//  PatientDelegate.h
//  Delegation
//
//  Created by Daniel Belokursky on 12.02.22.
//

#ifndef PatientDelegate_h
#define PatientDelegate_h
@class Patient;
@protocol PatientDelegate
    
-(void)patientNeedHealing: (Patient *)patient;
    
@end
#endif /* PatientDelegate_h */
