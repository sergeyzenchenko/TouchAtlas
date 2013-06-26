//
// Created by zen on 6/2/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DXAppConfiguration.h"
#import "DXDefaultAppConfiguration.h"
#import "DXTransactionLogger.h"


@implementation DXDefaultAppConfiguration

- (id <DXAppearanceConfiguration>)appearanceConfiguration
{
    return nil;
}

- (id <DXAppURLHandler>)urlHandler
{
    return nil;
}

- (id <DXPushNotificationConfigurator>)pushNotificationConfigurator
{
    return nil;
}

- (id <DXPushNotificationReceiver>)remoteNotificationReceiver
{
    return nil;
}

- (id <DXLocalNotificationReceiver>)localNotificationReceiver
{
    return nil;
}

- (NSArray *)transactionHandlers
{
    return @[[DXTransactionLogger new]];
}

@end