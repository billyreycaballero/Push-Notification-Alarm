
#import "ViewController.h"

@interface ViewController ()

- (void) requestPermissionToNotify;
- (void) createNotification: (int)secondsInTheFuture;

@end

@implementation ViewController

- (IBAction)scheduleButton:(id)sender {
    
    [self requestPermissionToNotify];
    [self createNotification:15];
}

-(void) requestPermissionToNotify {
    
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

- (void) createNotification: (int)secondsInTheFuture {
    
    UILocalNotification *localNotif =  [[UILocalNotification alloc] init];
    localNotif.fireDate = [[NSDate date] dateByAddingTimeInterval:secondsInTheFuture];
    localNotif.timeZone = nil;
    
    localNotif.alertTitle = @"Alert Notification";
    localNotif.alertBody = @"This is a 15 sec alert notification";
    localNotif.alertAction = @"Okay";
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    
    localNotif.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
