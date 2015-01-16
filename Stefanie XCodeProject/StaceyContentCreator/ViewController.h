//
//  ViewController.h
//  StaceyContentCreator
//
//  Created by Johannes Dürr on 11.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSView *tempView;


- (IBAction)pageGotChosen:(id)sender;
- (IBAction)categoryGotChosen:(id)sender;
- (IBAction)projectGotChosen:(id)sender;
@end

