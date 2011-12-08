//
//  ViewControllerWithAlertView.m
//  Project1
//
//  Created by Ian Davis on 11/25/11.
//  Copyright (c) 2011 Hackers @ Berkeley. All rights reserved.
//

#import "ViewController.h"

#define kCancelButtonTitle @"Done"
#define kRepeatButtonTitle @"Repeat"

#define kButtonHeight 40
#define kButtonWidth  80

#define kTextFieldHeight    30
#define kTextFieldWidth     300

@interface ViewController ()
- (void)buttonPressed;
- (void)showAlertViewWithMessage:(NSString *)message;

@property (nonatomic, retain) NSString *alertString;

@end

@implementation ViewController {
    NSString *_alertString;
}

@synthesize alertString=_alertString;

- (void)loadView {
    [super loadView];
    
    [self setAlertString: @"Hello World!"];
    
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
    
    UITextField *textField = [[UITextField alloc] init];
    [textField setPlaceholder:@"Enter Alert Message Here"];
    CGRect textFieldFrame = (CGRect){
        roundf((self.view.frame.size.width - kTextFieldWidth)/2.0),
        CGRectGetMinY(buttonFrame) - kTextFieldHeight,
        kTextFieldWidth,
        kTextFieldHeight
    };
    [textField setFrame:textFieldFrame];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:textField];
    [textField setDelegate:self];
    [textField release];
    
}

- (void)buttonPressed {
    [self showAlertViewWithMessage:_alertString];
}

- (void)showAlertViewWithMessage:(NSString *)theMessage {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Button Pressed" message:theMessage delegate:self cancelButtonTitle:kCancelButtonTitle otherButtonTitles:kRepeatButtonTitle, nil];
    
    [alert show];
    [alert release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:kCancelButtonTitle]) {
        // do nothing, it will cancel automatically
    } else if ([buttonTitle isEqualToString:kRepeatButtonTitle]) {
        [self showAlertViewWithMessage:[[alertView message] stringByAppendingString:@" Again!"]];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"HUH");
    [self setAlertString:[textField text]];
    [textField resignFirstResponder];
    [self showAlertViewWithMessage:_alertString];
    
    return YES;
}

@end
