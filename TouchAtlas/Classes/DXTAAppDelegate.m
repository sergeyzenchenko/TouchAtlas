//
// Created by zen on 6/2/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "DXTAAppDelegate.h"
#import "DXAppConfiguration.h"
#import "DXAppearanceConfiguration.h"
#import "DXRootTransaction.h"
#import "DXLocalNotificationReceiver.h"
#import "DXPushNotificationReceiver.h"
#import "DXPushNotificationConfigurator.h"
#import "DXAppURLHandler.h"

@interface DXTAAppDelegate ()

@property (nonatomic, strong) id<DXAppConfiguration> configuration;

@end

@implementation DXTAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    [self setupIOC];
    [self setupConfiguration];
    [self setupAppearance];
    [self setupAPNS];

    [self runRootTransaction];

    return YES;
}

- (void)setupAPNS
{
    if (self.configuration.pushNotificationConfigurator) {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:self.configuration.pushNotificationConfigurator.notificationTypes];
    }
}

- (void)runRootTransaction
{
    id<DXRootTransaction> rootTransaction = [self.configuration rootTransaction];
    rootTransaction.window = self.window;
    [rootTransaction call];
}

- (void)setupAppearance
{
    id<DXAppearanceConfiguration> appearanceConfiguration = [self.configuration appearanceConfiguration];
    [appearanceConfiguration setup];
}

- (void)setupConfiguration
{
    self.configuration = (id <DXAppConfiguration>) [AppleGuice instanceForProtocol:@protocol(DXAppConfiguration)];
}

- (void)setupIOC
{
    [AppleGuice startServiceWithImplementationDiscoveryPolicy:AppleGuiceImplementationDiscoveryPolicyRuntime];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [[self.configuration urlHandler] handleURL:url sourceApplication:sourceApplication annotation:annotation];
}

#pragma mark - Notifications

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [self.configuration.pushNotificationConfigurator didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    [self.configuration.pushNotificationConfigurator didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [self.configuration.remoteNotificationReceiver didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [self.configuration.localNotificationReceiver didReceiveLocalNotification:notification];
}

#pragma mark -- State Restoration protocol adopted by UIApplication delegate --

- (UIViewController *) application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    return nil;
}

- (BOOL) application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    return NO;
}

- (BOOL) application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    return NO;
}

- (void) application:(UIApplication *)application willEncodeRestorableStateWithCoder:(NSCoder *)coder
{

}

- (void) application:(UIApplication *)application didDecodeRestorableStateWithCoder:(NSCoder *)coder
{

}


@end