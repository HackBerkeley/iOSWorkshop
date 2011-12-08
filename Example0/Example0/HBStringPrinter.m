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

+ (NSString *)defaultString {
    return @"HBStringPrinter";
}

- (HBStringPrinter *)init {
    if (self != [super init]) return nil;
    
    [self setStringToPrint:[HBStringPrinter defaultString]];
    
    return self;
}

- (void)dealloc {
    
    [_stringToPrint release];
    [super dealloc];
}

- (void)setStringToPrint:(NSString *)stringToPrint {
    [_stringToPrint release];
    _stringToPrint = [stringToPrint copy];
}

- (NSString *)stringToPrint {
    return _stringToPrint;
}

- (void)printString {
    NSLog(@"%@", _stringToPrint);
}

@end
