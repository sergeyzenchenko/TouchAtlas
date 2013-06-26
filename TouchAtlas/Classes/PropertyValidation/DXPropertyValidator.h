//
// Created by zen on 6/9/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface DXPropertyValidator : NSObject

- (void)addNotNilValidationForFieldOfType:(NSString *)fieldType;
- (void)validate:(NSObject *)object;

@end