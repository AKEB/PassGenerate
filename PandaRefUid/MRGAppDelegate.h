//
//  MRGAppDelegate.h
//  PandaRefUid
//
//  Created by Вадим Бабаджанян on 9/8/11.
//  Copyright (c) 2011 "АйТи Территория". All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MRGAppDelegate : NSObject <NSApplicationDelegate,NSWindowDelegate> {
	
	NSWindow            *_window;
	NSMenu              *statusMenu;
	NSMenuItem          *myMenuStatusItem;
	NSStatusItem 		*statusItem;
    
    NSButton *lowecase;
    NSButton *uppercase;
    NSButton *number;
    NSButton *symbols;
    NSTextField *length;
    NSTextField *textField;
}



@property (assign) IBOutlet NSButton *lowecase;
@property (assign) IBOutlet NSButton *uppercase;
@property (assign) IBOutlet NSButton *number;
@property (assign) IBOutlet NSButton *symbols;
@property (assign) IBOutlet NSTextField *length;
@property (assign) IBOutlet NSTextField *textField;

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSMenu *statusMenu;
@property (strong) IBOutlet NSMenuItem *myMenuStatusItem;

- (IBAction)Generate:(id)sender;

@end
