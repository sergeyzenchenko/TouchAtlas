//
// Created by zen on 6/2/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DXParametrizedTransaction.h"
#import "DXTransaction.h"
#import "DXBaseTransaction.h"
#import "DXTransactionDispatcher.h"
#import "MARTNSObject.h"
#import "RTProperty.h"

@interface DXBaseTransaction ()

@property DXTransactionDispatcher *ioc_transactionDispatcher;

@end

@implementation DXBaseTransaction

- (void)validate
{
    NSParameterAssert(self.ioc_transactionDispatcher);

    NSArray *properties= [self allTransactionProperties];
    for (RTProperty *property in properties) {
        NSParameterAssert([self valueForKey:property.name]);
    }
}

- (NSArray *)allTransactionProperties
{
    NSMutableArray *properties = [NSMutableArray new];
    Class transactionClass = [self class];
    
    while (transactionClass != [DXBaseTransaction class]) {
        [properties addObjectsFromArray:[transactionClass rt_properties]];
        transactionClass = [transactionClass superclass];
    }
    return [properties copy];
}

- (void)call
{
    [self validate];
    [self.ioc_transactionDispatcher dispatchTransaction:self];
}

- (void)callWithObject:(id)object
{
    [self validate];
    [self.ioc_transactionDispatcher dispatchTransaction:self withObject:object];
}

@end