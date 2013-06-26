//
// Created by zen on 6/2/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class DXBaseTransaction;

@protocol DXTransactionHandler <NSObject>

- (BOOL)handleTransaction:(DXBaseTransaction *)transaction withObject:(id)object;

@end