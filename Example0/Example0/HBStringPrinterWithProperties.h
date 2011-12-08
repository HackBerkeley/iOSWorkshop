//
//  HBStringPrinterWithProperties.h
//  Example0
//
//  Created by Ian Davis on 12/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBStringPrinterWithProperties : NSObject

@property (nonatomic, copy) NSString *stringToPrint;

+ (NSString *) defaultString;



- (void)printString;

@end
