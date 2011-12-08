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

#define kButtonHeight 30
#define kButtonWidth  300

#define kTextFieldHeight    30
#define kTextFieldWidth     300

#define kLabelHeight 30
#define kLabelWidth  300

@interface ViewController ()
- (void)buttonPressed;
- (void)showAlertViewWithMessage:(NSString *)message;
- (void)updateLabel;

@property (nonatomic, retain) NSString *alertString;

@end

@implementation ViewController {
    NSString *_alertString;
    
    UIButton *_button;
    UITextField *_textField;
    UILabel *_label;
    
    int _alertCount;
    
}

@synthesize alertString=_alertString;

- (void)dealloc {
    [_alertString release];
    
    [_button release];
    [_textField release];
    [_label release];
    
    [super dealloc];
}

- (void)loadView {
    [super loadView];
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    _alertCount = 0;
    [self setAlertString: @"Hello World!"];
    
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeRoundedRect]; // autoreleased
        [_button setTitle:@"Press Me!" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
        CGRect buttonFrame = (CGRect){
            roundf((self.view.frame.size.width - kButtonWidth)/2.0),
            roundf((self.view.frame.size.height - kButtonHeight)/2.0),
            kButtonWidth,
            kButtonHeight
        };
        [_button setFrame:buttonFrame];
        [self.view addSubview:_button];
    }
    
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        [_textField setPlaceholder:@"Enter Alert Message Here"];
        CGRect textFieldFrame = (CGRect){
            roundf((self.view.frame.size.width - kTextFieldWidth)/2.0),
            CGRectGetMinY(_button.frame) - kTextFieldHeight,
            kTextFieldWidth,
            kTextFieldHeight
        };
        [_textField setFrame:textFieldFrame];
        [_textField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.view addSubview:_textField];
        [_textField setDelegate:self];
    }
    
    if (!_label) {
        _label = [[UILabel alloc] init];
        [self updateLabel];
        [_label setTextAlignment:UITextAlignmentCenter];
        CGRect labelFrame = (CGRect){
            roundf((self.view.frame.size.width - kLabelWidth)/2.0),
            CGRectGetMaxY(_button.frame),
            kLabelWidth,
            kLabelHeight
        };
        [_label setFrame:labelFrame];
        [self.view addSubview:_label];
    }
    
}

- (void)buttonPressed {
    [self showAlertViewWithMessage:_alertString];
}

- (void)showAlertViewWithMessage:(NSString *)theMessage {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Button Pressed" message:theMessage delegate:self cancelButtonTitle:kCancelButtonTitle otherButtonTitles:kRepeatButtonTitle, nil];

    [alert show];
    _alertCount++;
    [self updateLabel];
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

- (void)updateLabel {
    NSString *labelText = [NSString stringWithFormat:@"Shown %d alerts", _alertCount];
    [_label setText:labelText];
}

@end
