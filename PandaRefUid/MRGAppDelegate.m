//
//  MRGAppDelegate.m
//  PandaRefUid
//
//  Created by Вадим Бабаджанян on 9/8/11.
//  Copyright (c) 2011 "АйТи Территория". All rights reserved.
//

#import "MRGAppDelegate.h"

@implementation MRGAppDelegate
@synthesize lowecase;
@synthesize uppercase;
@synthesize number;
@synthesize symbols;
@synthesize length;
@synthesize textField;

@synthesize window = _window, statusMenu, myMenuStatusItem;

- (void)dealloc {
	[_window release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
    lowecase.state = 1;
    uppercase.state = 1;
    number.state = 1;
    symbols.state = 0;
    length.stringValue = @"10";//[NSNumber numberWithInt:15];
	textField.stringValue = @"";
    
	// Insert code here to initialize your application
	[_window setDelegate:self];
	statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
	[statusItem setMenu:statusMenu];
	[statusItem setImage:[NSImage imageNamed:@"Icon.png"]];
	[statusItem setHighlightMode:YES];
	
	[[NSApplication sharedApplication] stopModal];
	
	
}


- (IBAction)Generate:(id)sender {
    NSMutableString *letters = [NSMutableString stringWithString:@""];
    if (lowecase.state == 1) {
        [letters appendString:@"zyxwvutsrqponmlkjihgfedcba"];
    }
    if (uppercase.state == 1) {
        [letters appendString:@"ZYXWVUTSRQPONMLKJIHGFEDCBA"];
    }
    if (number.state == 1) {
        [letters appendString:@"1234567890"];
    }
    if (symbols.state == 1) {
        [letters appendString:@"!№;%:?*()_+=-~<>,.[]{}"];
    }
    
    NSMutableString *password = [NSMutableString stringWithString:@""];
    
    for (int i=1; i<=[length.stringValue intValue]; i++) {
        int k = arc4random() % (letters.length);
        [password appendString:[letters substringWithRange:NSMakeRange(k,1)]];
    }
    
    textField.stringValue = [NSString stringWithString:password];
    
}


- (void)windowWillClose:(NSNotification *)aNotification {
	
}

- (BOOL)windowShouldClose:(id)sender {
	[[NSApplication sharedApplication] hide:self];
	return NO;
}

-(IBAction) applicationUnHide:(id)sender {
	[[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
	[[NSApplication sharedApplication] unhide:self];
}


- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
	return YES;
}
- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag {
	[[NSApplication sharedApplication] unhide:self];
	return YES;
}




@end
