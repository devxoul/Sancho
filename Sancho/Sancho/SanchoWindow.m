//
//  NoTitleBarWindow.m
//  Sancho
//
//  Created by 전 수열 on 12. 8. 27..
//  Copyright (c) 2012년 Joyfl. All rights reserved.
//

#import "SanchoWindow.h"

@implementation SanchoWindow

- (id)init
{
	self = [super init];
	
	[self setContentSize:NSMakeSize( 600, 100 )];
	[self setFrameOrigin:NSMakePoint( ( self.screen.frame.size.width - self.frame.size.width ) * .5, self.screen.frame.size.height * 2 / 3 )];
	[self setStyleMask:NSBorderlessWindowMask];
	[self setCollectionBehavior:NSWindowCollectionBehaviorCanJoinAllSpaces | NSWindowCollectionBehaviorTransient];
	[self setHidesOnDeactivate:YES];
	
	return self;
}

- (BOOL)canBecomeKeyWindow
{
	return YES;
}

@end
