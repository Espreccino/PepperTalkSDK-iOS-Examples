//
//  ViewController.m
//  Example-Programmatic
//
//  Created by HIMANSHU RETAREKAR on 30/01/15.
//  Copyright (c) 2015 Espreccino. All rights reserved.
//

#import "ViewController.h"
#import <PepperTalk/PepperTalkSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *myUsername = @"a@a.com";
    [[PepperTalk sharedInstance] setLoggedInUserWithUsername:myUsername fullName:@"My Username" profilePicture:nil completion:^(NSError *loginError) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
