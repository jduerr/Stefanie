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
    
    // create the save panel
    NSSavePanel *panel = [NSSavePanel savePanel];
    
    // set a new file name
    [panel setNameFieldStringValue:@"category.txt"];
    
    // display the panel
    [panel beginWithCompletionHandler:^(NSInteger result) {
        
        if (result == NSFileHandlingPanelOKButton) {
            
        NSURL *saveURL = [panel URL];
            
            
            NSError* err;
            
            [entryString writeToURL:saveURL atomically:NO encoding:NSUTF8StringEncoding error:&err];
        }
    }];
    
    [self cancelButtonPushed:nil];

}

- (IBAction)cancelButtonPushed:(id)sender {
    [self dismissViewController:self];
}
@end
