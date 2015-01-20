//
//  New_ContentViewController.m
//  Stefanie
//
//  Created by Fliegl on 13.01.15.
//  Copyright (c) 2015 Johannes Dürr. All rights reserved.
//

#import "New_ContentViewController.h"

@interface New_ContentViewController ()

@end

@implementation New_ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)saveContentString:(NSMutableString*)contentString withFilename:(NSString*)filename andImage:(NSImage*)img andFolderName:(NSString*)folderName{
    
    // received image aswell?
    BOOL gotImage = FALSE;
    
    if (img != nil) {
        gotImage = TRUE;
    }
    
    // create the save panel
    NSSavePanel *panel = [NSSavePanel savePanel];
    
    // set a new file name
    [panel setNameFieldStringValue:filename];
    
    // display the panel
    [panel beginSheetModalForWindow:[[self view]window] completionHandler:^(NSInteger result) {
        
        if (result == NSFileHandlingPanelOKButton) {
            NSFileManager* fm = [NSFileManager defaultManager];
            NSError* err = nil;
            NSURL *saveURL = [panel URL];
            if (folderName != nil && [folderName length]>0) {
                NSString *filePathComponent = [saveURL lastPathComponent];
                saveURL = [saveURL URLByDeletingLastPathComponent];
                saveURL = [saveURL URLByAppendingPathComponent:folderName];
                
                [fm createDirectoryAtURL:saveURL withIntermediateDirectories:YES attributes:nil error:&err];
                saveURL = [saveURL URLByAppendingPathComponent:filePathComponent];
                
                if (err) {
                    // Alarm user --> Folder cannot be created...
                    NSLog(@"Folder could not be created!");
                }

            }
                        err = nil;
            
            [contentString writeToURL:saveURL atomically:NO encoding:NSUTF8StringEncoding error:&err];
            
            // If we have to save a thumbnail image aswell...
            if (gotImage) {
                NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
                [defaults synchronize];
                
                NSSize thumbSize = NSSizeFromCGSize(CGSizeMake([(NSNumber*)[defaults objectForKey:@"thumbWidth"]intValue], 100));
                NSSize exportSize = NSSizeFromCGSize(CGSizeMake([(NSNumber*)[defaults objectForKey:@"imageWidth"]intValue], 488));
 
                NSImage* thumbImage = [self imageByScalingProportionallyToSize:thumbSize onImage:img];
                NSImage* exportImage = [self imageByScalingProportionallyToSize:exportSize onImage:img];
                
                if (thumbImage != nil) {
                    // The thumb
                    
                    [thumbImage lockFocus] ;
                    NSBitmapImageRep *bitmapRep = [[NSBitmapImageRep alloc] initWithFocusedViewRect:NSMakeRect(0.0, 0.0, [thumbImage size].width, [thumbImage size].height)] ;
                    [thumbImage unlockFocus] ;
                    
                    //NSBitmapImageRep *imgRep = [[thumbImage representations] objectAtIndex: 0];
                    NSData *data = [bitmapRep representationUsingType: NSJPEGFileType properties: nil];
                    saveURL = [saveURL URLByDeletingLastPathComponent];
                    saveURL = [saveURL URLByAppendingPathComponent:@"thumb.jpg"];
                    [data writeToURL:saveURL atomically:YES];
                    
                    [exportImage lockFocus] ;
                    bitmapRep = [[NSBitmapImageRep alloc] initWithFocusedViewRect:NSMakeRect(0.0, 0.0, [exportImage size].width, [exportImage size].height)] ;
                    [exportImage unlockFocus] ;
                    
                    // The export image
                    data = nil;
                    data = [bitmapRep representationUsingType: NSJPEGFileType properties: nil];
                    saveURL = [saveURL URLByDeletingLastPathComponent];
                    saveURL = [saveURL URLByAppendingPathComponent:@"image.jpg"];
                    [data writeToURL:saveURL atomically:YES];
                }
                
            }
        }
    }];
    
}

- (NSImage*)imageByScalingProportionallyToSize:(NSSize)targetSize onImage:(NSImage*)sourceImage{

    NSImage* newImage = nil;
    
    if ([sourceImage isValid])
    {
        NSSize imageSize = [sourceImage size];
        float width  = imageSize.width;
        float height = imageSize.height;
        
        float targetWidth  = targetSize.width;
        float targetHeight = targetSize.height;
        
        float scaleFactor  = 0.0;
        float scaledWidth  = targetWidth;
        float scaledHeight = targetHeight;
        
        NSPoint thumbnailPoint = NSZeroPoint;
        
        if ( NSEqualSizes( imageSize, targetSize ) == NO )
        {
            
            float widthFactor  = targetWidth / width;
            
            scaleFactor = widthFactor;
            
            // Take care of retina machines
            CGFloat f_scaleFactor = [[self.view window]backingScaleFactor];
            
            scaledWidth  = width  * scaleFactor / f_scaleFactor;
            scaledHeight = height * scaleFactor / f_scaleFactor;
            //thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        
        newImage = [[NSImage alloc] initWithSize:CGSizeMake(scaledWidth, scaledHeight)];
        
        [newImage lockFocus];
        
        NSRect thumbnailRect;
        thumbnailRect.origin = thumbnailPoint;
        thumbnailRect.size.width = scaledWidth;
        thumbnailRect.size.height = scaledHeight;
        
        [sourceImage drawInRect: thumbnailRect
                       fromRect: NSZeroRect
                      operation: NSCompositeSourceOver
                       fraction: 1.0];
        
        [newImage unlockFocus];
        
    }
    
    return newImage;
}

//- (NSImage *)imageResize:(NSImage*)anImage newSize:(NSSize)newSize {
//    NSImage *sourceImage = anImage;
//    [sourceImage setScalesWhenResized:YES];
//    
//    // Report an error if the source isn't a valid image
//    if (![sourceImage isValid]){
//        NSLog(@"Invalid Image");
//    } else {
//        NSImage *smallImage = [[NSImage alloc] initWithSize: newSize];
//        [smallImage lockFocus];
//        [sourceImage setSize: newSize];
//        [[NSGraphicsContext currentContext] setImageInterpolation:NSImageInterpolationHigh];
//        [sourceImage drawAtPoint:NSZeroPoint fromRect:CGRectMake(0, 0, newSize.width, newSize.height) operation:NSCompositeCopy fraction:1.0];
//        [smallImage unlockFocus];
//        return smallImage;
//    }
//    return nil;
//}

#pragma mark - addMarkup methods

- (IBAction)addMarkup_Heading:(id)sender{
    NSToolbarItem* item = (NSToolbarItem*)sender;
    
    // Headlines
    
    if([[item itemIdentifier]isEqualToString: @"h1" ]){
        [theTextView insertText:@"#"];
    }
    if([[item itemIdentifier]isEqualToString: @"h2" ]){
        [theTextView insertText:@"##"];
    }
    if([[item itemIdentifier]isEqualToString: @"h3" ]){
        [theTextView insertText:@"###"];
    }
}

- (IBAction)addMarkup_CodeSnippet:(id)sender{
    // code snippet
    [theTextView insertText:@"<pre class=\"prettyprint\">\n\n</pre>"];
}

- (IBAction)addMarkup_orderedList:(id)sender{
    // ordered List
    [theTextView insertText:@"\n1. \n2. \n3. \n"];
}
- (IBAction)addMarkup_unorderedList:(id)sender{
    // ordered List
    [theTextView insertText:@"\n* \n* \n* \n"];
}
- (IBAction)addMarkup_hyperlink:(id)sender{
    // ordered List
    [theTextView insertText:@"[Link Text](http://)"];
}

- (IBAction)addMarkup_imageFromLink:(id)sender{
    // ordered List
    [theTextView insertText:@" ![alt text](http://domain.tld/image.png \"PopUp-Text\") "];
}

- (IBAction)addMarkup_table:(id)sender{
    // ordered List
    [theTextView insertText:@"     | Tables        | Are           | Cool  |\n     | ------------- |:-------------:| -----:|\n     | col 3 is      | right-aligned | $1600 |\n     | col 2 is      | centered      |   $12 |\n     | zebra stripes | are neat      |    $1 |\n"];
}

- (IBAction)addMarkup_blockquote:(id)sender{
    // ordered List
    [theTextView insertText:@"\n\n> \n"];
}



@end
