//
// Created by zen on 6/2/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class DXBaseTransaction;

@interface DXTransactionDispatcher : NSObject <AppleGuiceSingleton>

- (void)dispatchTransaction:(DXBaseTransaction *)transaction;
- (void)dispatchTransaction:(DXBaseTransaction *)transaction withObject:(id)object;

@end