//
//  JoystiqueAppDelegate.h
//  Joystique
//
//  Created by Stephan Seidt on 7/17/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JoystiqueViewController;

@interface JoystiqueAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    JoystiqueViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet JoystiqueViewController *viewController;

@end

