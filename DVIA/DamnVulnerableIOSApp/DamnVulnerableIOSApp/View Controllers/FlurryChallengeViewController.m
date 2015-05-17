//
//  FlurryChallengeViewController.m
//  DamnVulnerableIOSApp
//
//  Created by Egor Tolstoy on 11.05.15.
//  Copyright (c) 2015 HighAltitudeHacks.com. All rights reserved.
//

#import "FlurryChallengeViewController.h"
#import "UIViewController+ECSlidingViewController.h"

static NSString *FlurryApiKey = @"ZMSFBDBYFQ8XHQBRP2VY";

@interface FlurryChallengeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *apiKeyTextField;

@end

@implementation FlurryChallengeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = kNavigationTintColor;
    [self.slidingViewController.topViewController.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (void)showSuccessAlert {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Congrats! You've found the Flurry API Key!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)showFailureAlert {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Failure" message:@"Well, your answer is not right." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (IBAction)testResultButton:(id)sender {
    NSString *keyword = FlurryApiKey;
    NSString *userInput = self.apiKeyTextField.text;
    if ([keyword isEqualToString:userInput]) {
        [self showSuccessAlert];
    } else {
        [self showFailureAlert];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
