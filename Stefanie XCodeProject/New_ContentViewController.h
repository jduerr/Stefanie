//
//  New_ContentViewController.h
//  Stefanie
//
//  Created by Fliegl on 13.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface New_ContentViewController : NSViewController{
    NSTextView* theTextView;
}

- (void)saveContentString:(NSMutableString*)contentString withFilename:(NSString*)filename andImage:(NSImage*)img andFolderName:(NSString*)folderName;

- (IBAction)addMarkup_Heading:(id)sender;

@end
