//
//  ViewController.m
//  login
//
//  Created by Johnny Sparks on 10/3/14.
//  Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "ViewController.h"
#import "LoginFormView.h"
#import "FormModel.h"

@interface ViewController ()

@property(nonatomic, strong) LoginFormView *loginView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FormModel *model = [FormModel new];
    model.passwordPlaceholder = @"Pass";
    model.usernamePlaceholder = @"Ur name";

    self.loginView = [[LoginFormView alloc] init];
    [self.view addSubview:self.loginView];
    self.loginView.model = model;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
