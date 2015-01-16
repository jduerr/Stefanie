//
//  New_PageViewController.m
//  StaceyContentCreator
//
//  Created by Johannes Dürr on 11.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import "New_PageViewController.h"

@interface New_PageViewController ()

@end

@implementation New_PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    theTextView = self.contentTextView;
}

- (IBAction)saveButtonPushed:(id)sender {
    
    NSMutableString* entryString = [[NSMutableString alloc]init];
    
    
    // Add title to page
    [entryString appendString:[NSString stringWithFormat:@"title: %@\n-\n", self.titleTextField.stringValue]];
    
    // Add content
    [entryString appendString:[NSString stringWithFormat:@"content:\n\n%@\n", self.contentTextView.string]];
    
    [self saveContentString:entryString withFilename:@"page.txt" andImage:self.thumbImageWell.image andFolderName:self.folderNameTextField.stringValue];
    
    
    [self removeFromSuperView:self];
     
}

- (IBAction)removeFromSuperView:(id)sender {
    [self removeFromParentViewController];
}
@end
