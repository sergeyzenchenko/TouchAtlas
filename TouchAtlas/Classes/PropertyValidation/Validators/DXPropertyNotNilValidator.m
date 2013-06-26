//
// Created by zen on 6/9/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DXPropertyNotNilValidator.h"


@interface DXPropertyNotNilValidator ()

@property(nonatomic, copy) NSString *type;

@end

@implementation DXPropertyNotNilValidator

- (id)initWithFieldType:(NSString *)type
{
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}

- (BOOL)validateField:(NSString *)name inObject:(NSObject *)object
{
    return [object valueForKey:name] != nil;
}

- (BOOL)shouldValidateType:(NSString *)encodingString
{
    return [self.type isEqualToString:encodingString];
}


@end