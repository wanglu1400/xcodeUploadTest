//
//  AppDelegate.m
//  LocationNotification
//
//  Created by changchen on 2016/11/2.
//  Copyright © 2016年 changchen. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"weixin://"]];
    
    [self setLocationNoti];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



-(void)setLocationNoti
{
    
    
    NSCalendar* calend=[NSCalendar currentCalendar];
    NSDateComponents* comps=[calend components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:[NSDate date]];
    [comps setMinute:+2];
    
    
    //创建通知触发器
    UNTimeIntervalNotificationTrigger* timer=[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:60 repeats:YES];
    //创建通知内容
    UNMutableNotificationContent* notiContent=[[UNMutableNotificationContent alloc]init];
    notiContent.body=@"这是一个本地通知，收到了吗";
    notiContent.subtitle=@"不知道这是哪里的标题,试试";
    notiContent.title=[NSString stringWithFormat:@"这大概是主标题，试试,时间%@",[NSDate date]];
    notiContent.badge=[NSNumber numberWithInt:1];
    notiContent.sound=[UNNotificationSound defaultSound];
    // 通知参数
    NSDictionary *userDict = [NSDictionary dictionaryWithObject:@"开始学习iOS开发了" forKey:@"key"];
    notiContent.userInfo = userDict;
    
    //添加category标示
    notiContent.categoryIdentifier=@"myCategory";
    [self addNotification];
    
    //创建通知请求
    UNNotificationRequest* request=[UNNotificationRequest requestWithIdentifier:@"notification" content:notiContent trigger:timer];
    
    //通知中心
    UNUserNotificationCenter* notCenter=[UNUserNotificationCenter currentNotificationCenter];
    notCenter.delegate=self;
    [notCenter addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (!error) {
            NSLog(@"推送已添加成功 %@", @"notification");
        }else{
            NSLog(@"error : %@",error);
        }
    }];
    
    //        // ios8后，需要添加这个注册，才能得到授权
    //        if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
    //            UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    //            UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
    //                                                                                     categories:nil];
    //            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    //
    //
    //        } else {
    //
    //
    //        }
    
    
}
-(void)addNotification
{
    UNNotificationAction* actionLook=[UNNotificationAction actionWithIdentifier:@"action.look" title:@"查看" options:UNNotificationActionOptionAuthenticationRequired];
    UNNotificationAction* actionCancle=[UNNotificationAction actionWithIdentifier:@"action.cancle" title:@"取消" options:UNNotificationActionOptionDestructive];
    UNNotificationAction* actionJoin=[UNNotificationAction actionWithIdentifier:@"action.join" title:@"接受" options:UNNotificationActionOptionForeground];
    
    //闯将category
    UNNotificationCategory* category=[UNNotificationCategory categoryWithIdentifier:@"myCategory" actions:@[actionLook,actionJoin,actionCancle] intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
    
    UNUserNotificationCenter* center=[UNUserNotificationCenter currentNotificationCenter];
    [center setNotificationCategories:[NSSet setWithObject:category]];
    
}


-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    NSLog(@"userinfo : %@",[userInfo description]);
}

-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    NSLog(@"is register");
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"error : %@",[error description]);
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    
}

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler
{
    
}

@end
