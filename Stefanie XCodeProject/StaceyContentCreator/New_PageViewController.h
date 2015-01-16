//
//  New_PageViewController.h
//  StaceyContentCreator
//
//  Created by Johannes Dürr on 11.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import "New_ContentViewController.h"

@interface New_PageViewController : New_ContentViewController
@property (weak) IBOutlet NSTextField *titleTextField;
@property (unsafe_unretained) IBOutlet NSTextView *contentTextView;
@property (weak) IBOutlet NSImageView *thumbImageWell;
@property (weak) IBOutlet NSTextField *folderNameTextField;

- (IBAction)saveButtonPushed:(id)sender;
- (IBAction)removeFromSuperView:(id)sender;
@end
