//
//  ViewController.m
//  StaceyContentCreator
//
//  Created by Johannes Dürr on 11.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import "ViewController.h"
#import "New_PageViewController.h"
#import "New_CategoryViewController.h"
#import "New_ProjectViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}



#pragma mark - Dropdown Panel methods

-(IBAction)pageDropDownGotSelected:(id)sender{
    NSLog(@"Page got called");
}

- (IBAction)pageGotChosen:(id)sender {
    
    [[self.tempView subviews]
     makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.tempView setAutoresizesSubviews:YES];
    New_PageViewController* controller = [self.storyboard instantiateControllerWithIdentifier:@"Page"];
    [self.tempView addSubview:controller.view];
    [controller.view setFrame:self.tempView.frame];
    
}

- (IBAction)categoryGotChosen:(id)sender {
    [[self.tempView subviews]
     makeObjectsPerformSelector:@selector(removeFromSuperview)];
    New_CategoryViewController* controller = [self.storyboard instantiateControllerWithIdentifier:@"Category"];
    [self.tempView addSubview:controller.view];
    [controller.view setFrame:self.tempView.frame];
}

- (IBAction)projectGotChosen:(id)sender {
    [[self.tempView subviews]
     makeObjectsPerformSelector:@selector(removeFromSuperview)];
    New_ProjectViewController* controller = [self.storyboard instantiateControllerWithIdentifier:@"Project"];
    [self.tempView addSubview:controller.view];
    [controller.view setFrame:self.tempView.frame];
}

@end
