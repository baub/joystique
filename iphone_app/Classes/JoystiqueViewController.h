//
//  JoystiqueViewController.h
//  Joystique
//
//  Created by Stephan Seidt on 7/17/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CMMotionManager.h>
#import "Zimt/Zimt.h"

@interface JoystiqueViewController : UIViewController <ZTWebSocketDelegate, UITextFieldDelegate> {
	UITextField *addressField;
	UILabel *statusLabel;
	NSString *address;
		
	CMMotionManager *motionManager;
	NSOperationQueue *opQ;
	id deviceMotionHandler;
	
	ZTWebSocket* webSocket;

}

@property (nonatomic, retain) IBOutlet UITextField *addressField;
@property (nonatomic, retain) IBOutlet UILabel *statusLabel;
@property (nonatomic, copy) NSString *address;

- (void)changeStatus:(NSString*)text;

@end

