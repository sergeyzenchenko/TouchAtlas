//
// Created by zen on 6/2/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol DXLocalNotificationReceiver <NSObject>

- (void)didReceiveLocalNotification:(UILocalNotification *)notification;

@end