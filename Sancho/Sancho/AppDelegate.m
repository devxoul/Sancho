//
//  AppDelegate.m
//  Sancho
//
//  Created by 전 수열 on 12. 8. 21..
//  Copyright (c) 2012년 Joyfl. All rights reserved.
//

#import "AppDelegate.h"
#import <Carbon/Carbon.h>
#import "Sancho.h"

@implementation AppDelegate

// C 코드에서의 접근이 가능하도록 전역에 정의
Sancho *sancho;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	sancho = [[Sancho alloc] init];
	[self registerHotKey];
}

- (void)awakeFromNib
{
	statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
	[statusItem setImage:[NSImage imageNamed:@"statusicon_default.png"]];
	[statusItem setAlternateImage:[NSImage imageNamed:@"statusicon_alt.png"]];
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
			[sancho show];
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
	[(Sancho *)sancho show];
	return noErr;
}

@end
