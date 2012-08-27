//
//  Sancho.m
//  Sancho
//
//  Created by 전 수열 on 12. 8. 27..
//  Copyright (c) 2012년 Joyfl. All rights reserved.
//

#import "Sancho.h"
#import "PluginLauncher.h"

@implementation Sancho

- (id)init
{
	self = [super init];
	
	window = [[SanchoWindow alloc] init];
	
	textField = [[NSTextField alloc] initWithFrame:NSMakeRect( 10, 20, 580, 60 )];
	[textField setFont:[NSFont systemFontOfSize:40]];
	[window.contentView addSubview:textField];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:NSControlTextDidChangeNotification object:nil];
	
	return self;
}

- (void)show
{
	textField.stringValue = @"";
	
	[window makeKeyAndOrderFront:nil];
	[NSApp activateIgnoringOtherApps:YES];
	[textField becomeFirstResponder];
	
}

- (void)hide
{
	
}


#pragma mark -
#pragma mark NSTextFieldDelegate

- (void)textDidChange
{	
	launch( [textField.stringValue cStringUsingEncoding:NSASCIIStringEncoding] );
}


@end
