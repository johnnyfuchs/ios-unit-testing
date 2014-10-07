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

    self.view.backgroundColor = [UIColor whiteColor];

    FormModel *model = [FormModel new];
    model.passwordPlaceholder = @"Pass";
    model.usernamePlaceholder = @"Ur name";
    model.loginTitle = @"Login!";

    self.loginView = [[LoginFormView alloc] init];
    [self.view addSubview:self.loginView];
    self.loginView.model = model;

    [self.loginView setOnSubmit:^(LoginFormView *loginFormView) {
        [[[UIAlertView alloc] initWithTitle:@"Done." message:@"Go eat." delegate:nil  cancelButtonTitle:@"ok" otherButtonTitles:nil] show];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
