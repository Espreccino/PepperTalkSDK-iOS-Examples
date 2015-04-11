//
//  MenuTableViewController.m
//  Example-Programmatic
//
//  Created by HIMANSHU RETAREKAR on 30/01/15.
//  Copyright (c) 2015 Espreccino. All rights reserved.
//

#import "MenuTableViewController.h"
#import <PepperTalk/PepperTalkSDK.h>

#define LOGGED_IN_USERNAME_KEY @"LOGGED_IN_USERNAME"
#define TARGET_USERNAME_KEY @"TARGET_USERNAME"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController {
    
    NSString *_loggedInUserName;
    NSString *_targetUsername;
    NSDictionary *_usernamesDict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _usernamesDict = @{@"user1@example.com":@"User 1",
                       @"user2@example.com":@"User 2"};
    
    
    NSUserDefaults *sud = [NSUserDefaults standardUserDefaults];
    _loggedInUserName = [sud stringForKey:LOGGED_IN_USERNAME_KEY];
    _targetUsername = [sud stringForKey:TARGET_USERNAME_KEY];
    if(!_loggedInUserName || !_targetUsername) {
        
        [self showLoggedInUserSelection];
    } else {
        [self loginToPepperTalkWithSelecterUser];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showLoggedInUserSelection {
    
    NSArray *allUsersFullNamesArr = [_usernamesDict allValues];
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select User To Login" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:allUsersFullNamesArr[0],allUsersFullNamesArr[1], nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSArray *allUsersArr = [_usernamesDict allKeys];
    if(buttonIndex == 0) {
        _loggedInUserName = allUsersArr[0];
        _targetUsername = allUsersArr[1];
    } else {
        _loggedInUserName = allUsersArr[1];
        _targetUsername = allUsersArr[0];
    }
    
    NSUserDefaults *sud = [NSUserDefaults standardUserDefaults];
    [sud setObject:_loggedInUserName forKey:LOGGED_IN_USERNAME_KEY];
    [sud setObject:_targetUsername forKey:TARGET_USERNAME_KEY];
    [sud synchronize];
    
    [self loginToPepperTalkWithSelecterUser];
}

- (void) loginToPepperTalkWithSelecterUser {
    
    NSError *loginErr = [[PepperTalk sharedInstance] initialiseWithUsername:_loggedInUserName fullName:[_usernamesDict objectForKey:_loggedInUserName] profilePicture:nil completion:^(NSError *completionErr) {
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StandardTextTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Present Chat Window Modally";
            break;
        case 1:
            cell.textLabel.text = @"Push Chat Window Horizontally";
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
            //Please note that the chat session will be presented only if initilisation went through successfully.
            dispatch_async(dispatch_get_main_queue(), ^{
                [[PepperTalk sharedInstance] presentChatSessionWithParticipant:_targetUsername topicId:@"Some topic id" topicTitle:@"Some topic title" presentingViewController:self];
            });
        }
            break;
        case 1:
        {
            //Please note that a valid chat session will returned only if login went throught successfully.
            UIViewController *chatSessionView = [[PepperTalk sharedInstance] chatSessionWithParticipant:_targetUsername topicId:@"Some topic id" topicTitle:@"Some topic title" error:NULL];
            if(chatSessionView) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.navigationController pushViewController:chatSessionView animated:YES];
                });
            }
        }
            break;
        default:
            break;
    }
}
@end
