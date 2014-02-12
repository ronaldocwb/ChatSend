//
//  JMBViewController.h
//  ChatSend
//
//  Created by Presentation on 1/6/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMBViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (nonatomic) NSInteger imageIndex;

- (IBAction)cameraTapped:(id)sender;
- (IBAction)shareTapped:(id)sender;

@end
