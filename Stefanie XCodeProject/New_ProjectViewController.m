//
//  New_ProjectViewController.m
//  StaceyContentCreator
//
//  Created by Johannes Dürr on 11.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import "New_ProjectViewController.h"

@interface New_ProjectViewController ()

@end

@implementation New_ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    // Add date
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    NSDate *date = [NSDate date];
    NSString *dateString = [dateFormatter stringFromDate:date];
    [self.dateTextView setStringValue:dateString];
    
    theTextView = self.contentTextView;
}

- (IBAction)saveButtonPushed:(id)sender {
    NSMutableString* entryString = [[NSMutableString alloc]init];
    
    
    // Add title to page
    [entryString appendString:[NSString stringWithFormat:@"title: %@\n-\n", self.titleTextView.stringValue]];
    
    // Add date
    [entryString appendString:[NSString stringWithFormat:@"date:%@\n-\n", self.dateTextView.stringValue]];
    
    // Add content
    [entryString appendString:[NSString stringWithFormat:@"content:\n\n%@\n", self.contentTextView.string]];
    
    [self saveContentString:entryString withFilename:@"project.txt" andImage:self.thumbnailImageWell.image andFolderName:self.folderNameTextField.stringValue];
    
    [self cancelButtonPushed:self];
}
- (IBAction)cancelButtonPushed:(id)sender {
    [self removeFromParentViewController];
}
@end
