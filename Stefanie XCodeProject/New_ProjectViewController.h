//
//  New_ProjectViewController.h
//  StaceyContentCreator
//
//  Created by Johannes Dürr on 11.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "New_ContentViewController.h"

@interface New_ProjectViewController : New_ContentViewController

@property (weak) IBOutlet NSTextField *titleTextView;
@property (weak) IBOutlet NSTextField *dateTextView;
@property (unsafe_unretained) IBOutlet NSTextView *contentTextView;
@property (weak) IBOutlet NSImageView *thumbnailImageWell;
@property (weak) IBOutlet NSTextField *folderNameTextField;

- (IBAction)saveButtonPushed:(id)sender;
@end
