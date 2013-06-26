//
// Created by zen on 6/9/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DXPropertyValidator.h"
#import "MARTNSObject.h"
#import "RTProperty.h"
#import "DXPropertyNotNilValidator.h"

@interface DXPropertyValidator ()

@property(nonatomic, strong) NSMutableArray *validators;

@end

@implementation DXPropertyValidator

- (id)init
{
    self = [super init];
    if (self) {
        self.validators = [NSMutableArray new];
    }
    return self;
}

- (void)addNotNilValidationForFieldOfType:(NSString *)fieldType
{
    [self.validators addObject:[[DXPropertyNotNilValidator alloc] initWithFieldType:fieldType]];
}

- (void)validate:(NSObject *)object
{
    NSArray *properties = [[object class] rt_properties];

    for (RTProperty *property in properties) {
        [self validateProperty:property inObject:object];
    }
}

- (void)validateProperty:(RTProperty *)property inObject:(NSObject *)object
{
    NSArray *selectedValidators = [self validatorsForFieldType:[self trimTypeEncodingString:property.typeEncoding]];

    for (id<DXPropertyValidation> validator in selectedValidators) {
        BOOL isFieldValid = [validator validateField:property.name inObject:object];
        NSParameterAssert(isFieldValid);
    }
}

- (NSArray *)validatorsForFieldType:(NSString *)encodingString
{
    return [self.validators filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id<DXPropertyValidation> validator, NSDictionary *bindings) {
        return [validator shouldValidateType:encodingString];
    }]];
}

- (NSString *)trimTypeEncodingString:(NSString *)encoding
{
    encoding = [encoding stringByReplacingOccurrencesOfString:@"@" withString:@""];
    encoding = [encoding stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    return encoding;
}

@end