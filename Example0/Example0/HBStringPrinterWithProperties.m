//
//  HBStringPrinterWithProperties.m
//  Example0
//
//  Created by Ian Davis on 12/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HBStringPrinterWithProperties.h"

@implementation HBStringPrinterWithProperties

@synthesize stringToPrint=_stringToPrint;

+ (NSString *)defaultString {
    return @"HBStringPrinterWithProperties";
}

- (HBStringPrinterWithProperties *)init {
    if (self != [super init]) return nil;
    
    [self setStringToPrint:[HBStringPrinterWithProperties defaultString]];
    
    return self;
}

- (void)dealloc {
    
    [_stringToPrint release];
    [super dealloc];
}

- (void)printString {
    NSLog(@"%@", _stringToPrint);
}

@end
