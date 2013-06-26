//
// Created by zen on 6/2/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DXTransactionLogger.h"
#import "DXParametrizedTransaction.h"
#import "DXTransaction.h"
#import "DXBaseTransaction.h"


@implementation DXTransactionLogger

- (BOOL)handleTransaction:(DXBaseTransaction *)transaction withObject:(id)object
{
    NSLog(@"Perform transaction: %@ with object %@", transaction, object);

    return YES;
}

@end