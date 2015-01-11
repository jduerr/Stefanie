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
}

- (IBAction)saveButtonPushed:(id)sender {
    
    NSMutableString* entryString = [[NSMutableString alloc]init];
    
    
    // Add title to page
    [entryString appendString:[NSString stringWithFormat:@"title: %@\n-\n", self.titleTextField.stringValue]];
    
    // Add content
    [entryString appendString:[NSString stringWithFormat:@"content:\n\n%@\n", self.contentTextView.string]];
    
    // create the save panel
    NSSavePanel *panel = [NSSavePanel savePanel];
    
    // set a new file name
    [panel setNameFieldStringValue:@"page.txt"];
    
    // display the panel
    [panel beginWithCompletionHandler:^(NSInteger result) {
        
        if (result == NSFileHandlingPanelOKButton) {
            
            // create a file namaner and grab the save panel's returned URL
            NSFileManager *manager = [NSFileManager defaultManager];
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
