//
//  AppDelegate.m
//  SanchoPrototypeStatusItem
//
//  Created by 전 수열 on 12. 7. 30..
//  Copyright (c) 2012년 Joyfl. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Insert code here to initialize your application
}

- (void)awakeFromNib
{
	statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
	[statusItem setTitle:@"Sancho"];
	[statusItem setMenu:statusMenu];
	[statusItem setHighlightMode:YES];
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

@end
