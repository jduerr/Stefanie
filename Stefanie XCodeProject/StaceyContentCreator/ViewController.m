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
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(windowDidResize) name:@"NSWindowDidResizeNotification" object:nil];
    [self.tempView setAutoresizesSubviews:YES];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)windowDidResize{
    
    for (NSView* subview in [self.tempView subviews]) {
        subview.frame = self.tempView.frame;
    }
    //[controller.view setFrame:self.tempView.frame];
}

// Set window to prop. size
- (void)setWindowToNewSizeWithWidth:(float)width andHeight:(float)height{
    NSWindow* window = [self.view window];
    NSRect frame = [window frame];
    //frame.origin.y = height - frame.origin.y;
    frame.size.height = height;
    frame.size.width = width;
    [window setFrame:frame display:YES animate:YES];
    
}

#pragma mark - Dropdown Panel methods


- (IBAction)pageGotChosen:(id)sender {
    
    [[self.tempView subviews]
     makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // set window size
    [self setWindowToNewSizeWithWidth:763 andHeight:600];
    
    New_PageViewController* controller = [self.storyboard instantiateControllerWithIdentifier:@"Page"];
    
    [self.tempView addSubview:controller.view];
    //[self.tempView addConstraints:controller.view.constraints];
    
    [self windowDidResize];
    
}

- (IBAction)categoryGotChosen:(id)sender {
    
    [[self.tempView subviews]
     makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // set window size
    [self setWindowToNewSizeWithWidth:763 andHeight:600];
    
    New_CategoryViewController* controller = [self.storyboard instantiateControllerWithIdentifier:@"Category"];
    [self.tempView addSubview:controller.view];
    
    [self windowDidResize];
    
}

- (IBAction)projectGotChosen:(id)sender {
   
    [[self.tempView subviews]
     makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // set window size
    [self setWindowToNewSizeWithWidth:763 andHeight:700];
    
    New_ProjectViewController* controller = [self.storyboard instantiateControllerWithIdentifier:@"Project"];
    [self.tempView addSubview:controller.view];
    
    [self windowDidResize];
    
}


@end
