//
//  JMBMasterViewController.m
//  ChatSend
//
//  Created by Ronaldo Campos on 30/01/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "JMBMasterViewController.h"
#import "JMBViewController.h"
#import "JMBAppDelegate.h"

@interface JMBMasterViewController (){
    JMBAppDelegate *myDelegate;
}

@end

@implementation JMBMasterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    myDelegate = [UIApplication sharedApplication].delegate;
    
    myDelegate.imageTexts = [[NSMutableArray alloc] init];
    myDelegate.images = [[NSMutableArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [myDelegate.imageTexts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = myDelegate.imageTexts[indexPath.row];
    
    return cell;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    JMBViewController *myJMBViewController = [segue destinationViewController];
    
    if ([segue.identifier isEqualToString:@"addMessage"]) {
        myJMBViewController.imageIndex = -1;
    }else if ([segue.identifier isEqualToString:@"editMessage"]){
        NSIndexPath *ip = [self.tableView indexPathForSelectedRow];
        myJMBViewController.imageIndex = ip.row;
    }
    
    
}

@end
