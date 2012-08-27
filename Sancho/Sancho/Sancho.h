//
//  Sancho.h
//  Sancho
//
//  Created by 전 수열 on 12. 8. 27..
//  Copyright (c) 2012년 Joyfl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SanchoWindow.h"

@interface Sancho : NSObject
{
	SanchoWindow *window;
	NSTextField *textField;
}

- (void)show;
- (void)hide;

@end
