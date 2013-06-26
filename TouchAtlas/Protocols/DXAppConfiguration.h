//
// Created by zen on 6/2/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol DXRootTransaction;
@protocol DXAppearanceConfiguration;
@protocol DXAppURLHandler;
@protocol DXPushNotificationConfigurator;
@protocol DXPushNotificationReceiver;
@protocol DXLocalNotificationReceiver;

@protocol DXAppBaseConfiguration

@optional
- (id <DXAppearanceConfiguration>)appearanceConfiguration;
- (id <DXAppURLHandler>)urlHandler;
- (id <DXPushNotificationConfigurator>)pushNotificationConfigurator;
- (id <DXPushNotificationReceiver>)remoteNotificationReceiver;
- (id <DXLocalNotificationReceiver>)localNotificationReceiver;
- (NSArray *)transactionHandlers;

@end

@protocol DXAppConfiguration <DXAppBaseConfiguration, AppleGuiceSingleton>

@required
- (id <DXRootTransaction>)rootTransaction;

@end