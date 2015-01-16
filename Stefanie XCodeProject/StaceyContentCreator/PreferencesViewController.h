//
//  PreferencesViewController.h
//  Stefanie
//
//  Created by Fliegl on 16.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PreferencesViewController : NSViewController{
    
    // image sizes
    int thumbWidth;
    int thumbHeight;
    int imageWidth;
    int imageHeight;
    
}

@property int thumbWidth;
@property int thumbHeight;
@property int imageWidth;
@property int imageHeight;

@property (weak) IBOutlet NSTextField *thumbWidthTextField;
@property (weak) IBOutlet NSTextField *imageWidthTextField;
@end
