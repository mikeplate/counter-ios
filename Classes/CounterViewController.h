//
//  CounterViewController.h
//  Counter
//
//  Created by Mike P on 2010-11-17.
//  Copyright 2010 My Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CounterViewController : UIViewController {
	IBOutlet UILabel* _countLabel;
	int _count;
}

-(IBAction) decreaseButton;
-(IBAction) increaseButton;
-(IBAction) resetButton;
-(IBAction) aboutButton;

-(void) updateAndSave;
//-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
