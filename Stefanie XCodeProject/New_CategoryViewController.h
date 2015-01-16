//
//  New_CategoryViewController.h
//  StaceyContentCreator
//
//  Created by Johannes Dürr on 11.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "New_ContentViewController.h"

@interface New_CategoryViewController : New_ContentViewController

@property (weak) IBOutlet NSTextField *titleTextField;
@property (unsafe_unretained) IBOutlet NSTextView *descriptionTextView;

- (IBAction)saveButtonPushed:(id)sender;
- (IBAction)cancelButtonPushed:(id)sender;

@end
