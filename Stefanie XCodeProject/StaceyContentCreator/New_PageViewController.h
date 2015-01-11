//
//  New_PageViewController.h
//  StaceyContentCreator
//
//  Created by Johannes Dürr on 11.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import "ViewController.h"

@interface New_PageViewController : ViewController
@property (weak) IBOutlet NSTextField *titleTextField;
@property (unsafe_unretained) IBOutlet NSTextView *contentTextView;

- (IBAction)saveButtonPushed:(id)sender;
- (IBAction)cancelButtonPushed:(id)sender;
@end
