//
// Created by zen on 6/2/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol DXAppURLHandler <NSObject>

- (BOOL)handleURL:(NSURL *)url sourceApplication:(NSString *)application annotation:(id)annotation;

@end