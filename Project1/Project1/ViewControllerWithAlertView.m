//
//  ViewControllerWithAlertView.m
//  Project1
//
//  Created by Ian Davis on 11/25/11.
//  Copyright (c) 2011 Hackers @ Berkeley. All rights reserved.
//

#import "ViewControllerWithAlertView.h"

#define kCancelButtonTitle @"Done"
#define kRepeatButtonTitle @"Repeat"

#define kButtonHeight 40
#define kButtonWidth  80

@interface ViewControllerWithAlertView ()
- (void)buttonPressed;
- (void)showAlertViewWithMessage:(NSString *)message;
@end

@implementation ViewControllerWithAlertView

- (void)loadView {
    [super loadView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect]; // autoreleased
    
    [button setTitle:@"Press Me!" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect buttonFrame = (CGRect){
        roundf((self.view.frame.size.width - kButtonWidth)/2.0),
        roundf((self.view.frame.size.height - kButtonHeight)/2.0),
        kButtonWidth,
        kButtonHeight
    };
    [button setFrame:buttonFrame];
    
    [self.view addSubview:button];
    
}

- (void)buttonPressed {
    [self showAlertViewWithMessage:@"Hello World!"];
}

- (void)showAlertViewWithMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Button Pressed" message:@"Hello World!" delegate:self cancelButtonTitle:kCancelButtonTitle otherButtonTitles:kRepeatButtonTitle, nil];
    
    [alert show];
    [alert release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:kCancelButtonTitle]) {
        // do nothing, it will cancel automatically
    } else if ([buttonTitle isEqualToString:kRepeatButtonTitle]) {
        [self showAlertViewWithMessage:@"Hello Again World!"];
    }
}

@end
