//
//  AppDelegate.h
//  Sancho
//
//  Created by 전 수열 on 12. 8. 21..
//  Copyright (c) 2012년 Joyfl. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
	IBOutlet NSMenu *statusMenu;
	NSStatusItem *statusItem;
}

- (IBAction)statusMenuItemDidTouchUpInside:(id)sender;

@end
