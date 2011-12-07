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

- (void)printString;

@end
