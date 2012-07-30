//
//  AppDelegate.m
//  SanchoPrototypeStatusItem
//
//  Created by 전 수열 on 12. 7. 30..
//  Copyright (c) 2012년 Joyfl. All rights reserved.
//

#import "AppDelegate.h"
#import <Carbon/Carbon.h>

@implementation AppDelegate

// reference to self
void *context;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	context = self;
	[self registerHotKey];
}

- (void)awakeFromNib
{
	statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
	[statusItem setTitle:@"Sancho"];
	[statusItem setMenu:statusMenu];
	[statusItem setHighlightMode:YES];
}

/**
 * Reference : http://dbachrach.com/blog/2005/11/program-global-hotkeys-in-cocoa-easily/
 */
- (void)registerHotKey
{
	EventHotKeyRef hotKeyRef;
	EventHotKeyID hotKeyId;
	EventTypeSpec eventType;
	eventType.eventClass = kEventClassKeyboard;
	eventType.eventKind = kEventHotKeyPressed;
	
	// When hotkey event fired, hotKeyHandler is called.
	InstallApplicationEventHandler( &hotKeyHandler, 1, &eventType, NULL, NULL );
	
	// 4byte character
	hotKeyId.signature = 'xoul';
	hotKeyId.id = 0;
	
	// Register hotkey. (option + command + space)
	RegisterEventHotKey( 49, optionKey + cmdKey, hotKeyId, GetApplicationEventTarget(), 0, &hotKeyRef );
}


#pragma mark -
#pragma mark Status Menu Selectors

- (IBAction)statusMenuItemDidTouchUpInside:(NSMenuItem *)menuItem
{
	switch( menuItem.tag )
	{
		case 0:
			break;
			
		case 1:
			break;
			
		case 2:
			exit( 0 );
			break;
	}
}


#pragma mark -
#pragma mark HotKey

OSStatus hotKeyHandler( EventHandlerCallRef nextHandler, EventRef theEvent, void *userData )
{
	[(AppDelegate *)context openSancho];
	return noErr;
}

- (void)openSancho
{
	[[NSAlert alertWithMessageText:@"Sancho" defaultButton:@"Nice to meet you!" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Hello, I'm Sancho!"] runModal];
}

@end

