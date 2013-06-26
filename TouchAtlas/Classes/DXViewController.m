//
// Created by zen on 6/2/13.
// Copyright (c) 2013 111min. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DXViewController.h"
#import "DXPropertyValidator.h"

@interface DXViewController ()

@property(nonatomic) BOOL isValidated;

@end

@implementation DXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];    
    [self validate];
    self.isValidated = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSParameterAssert(self.isValidated);
}

- (void)validate
{
    DXPropertyValidator *validator = [DXPropertyValidator new];

    [validator addNotNilValidationForFieldOfType:@"<DXParametrizedTransaction>"];
    [validator addNotNilValidationForFieldOfType:@"<DXTransaction>"];

    [validator validate:self];
}

@end