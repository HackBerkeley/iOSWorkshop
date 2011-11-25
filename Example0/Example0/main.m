//
//  main.m
//  Example0
//
//  Created by Ian Davis on 11/25/11.
//  Copyright (c) 2011 Hackers @ Berkeley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBStringPrinter.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        HBStringPrinter *stringPrinter1 = [[HBStringPrinter alloc] init];
        
        [stringPrinter1 printString];
        
        [stringPrinter1 setStringToPrint:@"Hello, World!"];
        
        [stringPrinter1 printString];
        
        
        
        [stringPrinter1 release];
        
    }
    return 0;
}

