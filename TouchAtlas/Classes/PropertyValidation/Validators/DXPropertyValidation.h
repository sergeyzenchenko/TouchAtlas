//
// Created by zen on 6/9/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol DXPropertyValidation <NSObject>

- (id)initWithFieldType:(NSString *)type;
- (BOOL)validateField:(NSString *)name inObject:(NSObject *)object;
- (BOOL)shouldValidateType:(NSString *)encodingString;
@end