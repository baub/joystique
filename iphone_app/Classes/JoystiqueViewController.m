//
//  JoystiqueViewController.m
//  Joystique
//
//  Created by Stephan Seidt on 7/17/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "JoystiqueViewController.h"

@implementation JoystiqueViewController

@synthesize addressField;
@synthesize statusLabel;
@synthesize address;

////

- (void)changeStatus:(NSString*)text {
	statusLabel.text = text;
}

////

- (void)viewDidLoad {
	#if	TARGET_IPHONE_SIMULATOR
		NSLog(@"Testing in simulator");
	#else
		motionManager = [[CMMotionManager alloc] init];
		motionManager.deviceMotionUpdateInterval = 1.0/100.0;
	
		if (motionManager.isGyroAvailable) {
			opQ = [[NSOperationQueue currentQueue] retain];

			deviceMotionHandler = ^ (CMDeviceMotion *deviceMotion, NSError *error) {
				CMAttitude* a = deviceMotion.attitude;
				CMRotationMatrix m = a.rotationMatrix;
				CMAcceleration ua = deviceMotion.userAcceleration;
								
				if (webSocket.connected) {
					[webSocket send: [NSString stringWithFormat:@"{ \"attitude\": { \"matrix\": [%f, %f, %f, 0, %f, %f, %f, 0, %f, %f, %f, 0, 0, 0, 0, 1], \"angles\": { \"pitch\": \"%f\", \"yaw\": \"%f\", \"roll\": \"%f\" } }, \"userAcceleration\": { \"x\": \"%f\", \"y\": \"%f\", \"z\": \"%f\" } }", m.m11, m.m21, m.m31, m.m12, m.m22, m.m32, m.m13, m.m23, m.m33, a.pitch, a.yaw, a.roll, ua.x, ua.y, ua.z]];
				}
			};
			
			[motionManager  startDeviceMotionUpdatesToQueue:opQ withHandler:deviceMotionHandler];
		} else {
			[self changeStatus:@"No Gyroscope available :-("];
			[motionManager release];
		}
	#endif
	
	[super viewDidLoad];
}

////

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [addressField resignFirstResponder];
	
	self.address = [[NSString alloc] initWithFormat:@"ws://%@:10000/", addressField.text];
	
	[self changeStatus:self.address];
	
	if (webSocket) {
		[webSocket release];
	}
	
	webSocket = [[ZTWebSocket alloc] initWithURLString:self.address delegate:self];
	[webSocket open];
	
    return YES;
}

////

-(void)webSocketDidClose:(ZTWebSocket *)webSocket {
	[self changeStatus:@"Disconnected"];
}

-(void)webSocket:(ZTWebSocket *)webSocket didFailWithError:(NSError *)error {
    if (error.code == ZTWebSocketErrorConnectionFailed) {
        [self changeStatus:@"Connection failed"];
    } else if (error.code == ZTWebSocketErrorHandshakeFailed) {
        [self changeStatus:@"Handshake failed"];
    } else {
        [self changeStatus:@"Error"];
    }
}

-(void)webSocket:(ZTWebSocket *)webSocket didReceiveMessage:(NSString*)message {
    //[self changeStatus:message];
}

-(void)webSocketDidOpen:(ZTWebSocket *)aWebSocket {
    [self changeStatus:@"Connected & Sending Data"];
}

-(void)webSocketDidSendMessage:(ZTWebSocket *)webSocket {
    
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[addressField release];
    [statusLabel release];
    [address release];
	
	[motionManager stopGyroUpdates];
	[motionManager release];
	
	[webSocket release];
	
    [super dealloc];
}

@end
