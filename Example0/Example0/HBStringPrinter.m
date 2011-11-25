//
//  HBStringPrinter.m
//  Example0
//
//  Created by Ian Davis on 11/25/11.
//  Copyright (c) 2011 Hackers @ Berkeley. All rights reserved.
//

#import "HBStringPrinter.h"

@implementation HBStringPrinter {
    NSString *_stringToPrint;
}

@synthesize stringToPrint=_stringToPrint;

- (HBStringPrinter *)init {
    if (self != [super init]) return nil;
    
    [self setStringToPrint:@"DEFAULT_STRING"];
    
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
