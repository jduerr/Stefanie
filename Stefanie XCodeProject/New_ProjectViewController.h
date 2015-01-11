//
//  New_ProjectViewController.h
//  StaceyContentCreator
//
//  Created by Johannes Dürr on 11.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import "ViewController.h"

@interface New_ProjectViewController : ViewController
@property (weak) IBOutlet NSTextField *titleTextView;
@property (weak) IBOutlet NSTextField *dateTextView;
@property (unsafe_unretained) IBOutlet NSTextView *contentTextView;

- (IBAction)saveButtonPushed:(id)sender;
@end
