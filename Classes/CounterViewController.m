#import "CounterViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation CounterViewController

// This function is called when the view has finished loading. This is our start point.
- (void)viewDidLoad {
	// Remember to call super class's function for functions that we override
    [super viewDidLoad];
	
	// Go through all subviews for the view, meaning all labels, buttons and so on
	for (UIView *subview in [self.view subviews]) {
		// Check if this subview is a label or a button
		if ([subview isKindOfClass:UILabel.class] || [subview isKindOfClass:UIButton.class]) {
			// Set rounded corners
			subview.layer.cornerRadius = 10;
			
			// Set a border
			[subview.layer setBorderColor: [[UIColor whiteColor] CGColor]];
			[subview.layer setBorderWidth: 2.0];
		}
	}
	
	// Retrieve counter start value from persisted storage, actually a user setting
	_count = [[NSUserDefaults standardUserDefaults] integerForKey:@"count"];
	
	// Format the integer as a string and put into label
	NSString* countString = [NSString stringWithFormat:@"%d", _count];
	[_countLabel setText:countString];
}

// Make sure the app accepts any orientation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

// Declare our own dealloc if we need to free memory
- (void)dealloc {
    [super dealloc];
}

// This function is called when the decrease button is touched by the user
- (void)decreaseButton {
	_count--;
	[self updateAndSave];
}

// This function is called when the increase button is touched by the user
- (void)increaseButton {
	_count++;
	[self updateAndSave];
}

// This function is called when the reset button in the bottom toolbar is touched by the user
- (void)resetButton {
	UIAlertView* alert = [[UIAlertView alloc] init];
	[alert setTitle:@"Reset"];
	[alert setMessage:@"Are you sure you want to reset the counter to zero?"];
	[alert setDelegate:self];
	[alert addButtonWithTitle:@"Yes"];
	[alert addButtonWithTitle:@"No"];
	[alert show];
	[alert release];
}

// This function is called when any button in an UIAlertView is touched by the user
// We only have one UIAlertView in the app so far, so we know what to do here
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex==0) {
		_count = 0;
		[self updateAndSave];
	}
}

// This function is called when the about button is touched by the user
- (void)aboutButton {
	// Load a url in the web browser
	NSURL* url = [NSURL URLWithString:@"http://mikeplate.com"];
	[[UIApplication sharedApplication] openURL:url];
}

// This function updates the user interface with a new counter value and persists it to storage
- (void)updateAndSave {
	// Format the integer count as a string
	NSString* countString = [NSString stringWithFormat:@"%d", _count];
	
	// Put the string into the label at the top of the view
	[_countLabel setText:countString];
	
	// Store the value as a user setting. Simplest way to store a single value.
	[[NSUserDefaults standardUserDefaults] setInteger:_count forKey:@"count"];
}

@end
