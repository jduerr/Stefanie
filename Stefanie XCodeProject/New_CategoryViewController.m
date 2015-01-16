//
//  New_CategoryViewController.m
//  StaceyContentCreator
//
//  Created by Johannes Dürr on 11.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import "New_CategoryViewController.h"

@interface New_CategoryViewController ()

@end

@implementation New_CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.

}

- (IBAction)saveButtonPushed:(id)sender {
    NSMutableString* entryString = [[NSMutableString alloc]init];
    
    
    // Add title to page
    [entryString appendString:[NSString stringWithFormat:@"page_description: %@\n-\n", self.descriptionTextView.string]];
    
    // Add content
    [entryString appendString:[NSString stringWithFormat:@"title: %@\n", self.titleTextField.stringValue]];
    
    [self saveContentString:entryString withFilename:@"category.txt" andImage:nil andFolderName:nil];
    
    [self cancelButtonPushed:self];

}

- (IBAction)cancelButtonPushed:(id)sender {
    [self removeFromParentViewController];
}
@end
