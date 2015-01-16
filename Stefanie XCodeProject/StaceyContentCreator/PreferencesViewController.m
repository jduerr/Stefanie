//
//  PreferencesViewController.m
//  Stefanie
//
//  Created by Fliegl on 16.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import "PreferencesViewController.h"

@interface PreferencesViewController ()

@end

@implementation PreferencesViewController

@synthesize thumbWidth, thumbHeight, imageWidth, imageHeight;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
   
    // update local variables
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    imageWidth = [(NSNumber*)[defaults objectForKey:@"imageWidth"]intValue];
    thumbWidth = [(NSNumber*)[defaults objectForKey:@"thumbWidth"]intValue];
    
    [self.thumbWidthTextField setStringValue:[NSString stringWithFormat:@"%i", thumbWidth]];
    [self.imageWidthTextField setStringValue:[NSString stringWithFormat:@"%i", imageWidth]];
    
}

- (void)viewWillDisappear{
    [super viewWillDisappear];
    
    // save changes made in window...
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:[NSNumber numberWithInt:thumbWidth] forKey:@"thumbWidth"];
    [defaults setObject:[NSNumber numberWithInt:imageWidth] forKey:@"imageWidth"];
    
    // save
    [defaults synchronize];
    
}

@end
