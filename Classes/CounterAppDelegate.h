//
//  CounterAppDelegate.h
//  Counter
//
//  Created by Mike P on 2010-11-17.
//  Copyright 2010 My Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CounterViewController;

@interface CounterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CounterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CounterViewController *viewController;

@end

