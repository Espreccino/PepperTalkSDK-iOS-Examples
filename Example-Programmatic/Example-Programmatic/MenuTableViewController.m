//
//  MenuTableViewController.m
//  Example-Programmatic
//
//  Created by HIMANSHU RETAREKAR on 30/01/15.
//  Copyright (c) 2015 Espreccino. All rights reserved.
//

#import "MenuTableViewController.h"
#import <PepperTalk/PepperTalkSDK.h>

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController {
    
    NSString *_otherPartyUsername;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _otherPartyUsername = @"b@b.com";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
            //Please note that the chat session will be presented only if login went throught successfully.
            [[PepperTalk sharedInstance] presentChatSessionWithParticipant:_otherPartyUsername sessionOptons:nil presentingViewController:self];
        }
            break;
        case 1:
        {
            //Please note that a valid chat session will returned only if login went throught successfully.
            PTChatSessionController *chatSessionView = [[PepperTalk sharedInstance] chatSessionWithParticipant:_otherPartyUsername sessionOptons:nil error:NULL];
            if(chatSessionView) {
                [self.navigationController pushViewController:chatSessionView animated:YES];
            }
        }
            break;
        default:
            break;
    }
}
@end
