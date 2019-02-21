

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    application.applicationIconBadgeNumber = 0;
    UILocalNotification *localNotify = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    if(localNotify){
        
        UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"Receive on launch" message:localNotify.alertBody preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alertAct = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
        
        [alertCon addAction:alertAct];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [application.keyWindow.rootViewController presentViewController:alertCon animated:YES completion:nil];
        });

    }
    return YES;
}

- (void) application: (UIApplication *)application didReceiveLocalNotification:(nonnull UILocalNotification *)notification {
    
    application.applicationIconBadgeNumber = 0;
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"Receive while running" message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAct = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil];
                               
    [alertCon addAction:alertAct];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [application.keyWindow.rootViewController presentViewController:alertCon animated:YES completion:nil];
    });
}

@end
