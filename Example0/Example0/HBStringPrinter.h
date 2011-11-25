//
//  HBStringPrinter.h
//  Example0
//
//  Created by Ian Davis on 11/25/11.
//  Copyright (c) 2011 Hackers @ Berkeley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBStringPrinter : NSObject

@property (nonatomic, retain) NSString *stringToPrint;

//The code below replicates the property above
/*
- (void)setStringToPrint: (NSString *)stringToPrint;
- (NSString *)stringToPrint;
*/

- (void)printString;

@end
