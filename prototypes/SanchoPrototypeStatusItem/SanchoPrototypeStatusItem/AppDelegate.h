//
//  AppDelegate.h
//  SanchoPrototypeStatusItem
//
//  Created by 전 수열 on 12. 7. 30..
//  Copyright (c) 2012년 Joyfl. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
	IBOutlet NSMenu *statusMenu;
	NSStatusItem *statusItem;
}

- (IBAction)statusMenuItemDidTouchUpInside:(id)sender;
- (void)openSancho;

@end
