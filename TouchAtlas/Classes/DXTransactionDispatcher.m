//
// Created by zen on 6/2/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DXTransactionDispatcher.h"
#import "DXParametrizedTransaction.h"
#import "DXTransaction.h"
#import "DXBaseTransaction.h"
#import "DXTransactionHandler.h"
#import "DXAppConfiguration.h"

@interface DXTransactionDispatcher ()

@property (nonatomic, strong) NSArray *transactionHandlers;

@end

@implementation DXTransactionDispatcher

- (id)init
{
    self = [super init];
    if (self) {
        id<DXAppConfiguration> configuration = (id <DXAppConfiguration>) [AppleGuice instanceForProtocol:@protocol(DXAppConfiguration)];
        self.transactionHandlers = configuration.transactionHandlers;
    }
    return self;
}

- (void)dispatchTransaction:(DXBaseTransaction *)transaction
{
    if ([self acceptTransaction:transaction withObject:nil]) {
        [transaction perform];
    }
}

- (BOOL)acceptTransaction:(DXBaseTransaction *)transaction withObject:(id)object
{
    for (id <DXTransactionHandler> handler in self.transactionHandlers) {
        if (![handler handleTransaction:transaction withObject:object]) {
            return NO;
        }
    }

    return YES;
}

- (void)dispatchTransaction:(DXBaseTransaction *)transaction withObject:(id)object
{
    if ([self acceptTransaction:transaction withObject:object]) {
        [transaction performWithObject:object];
    }
}

@end