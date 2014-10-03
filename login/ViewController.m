//
//  ViewController.m
//  login
//
//  Created by Johnny Sparks on 10/3/14.
//  Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "ViewController.h"
#import "LoginFormView.h"

@interface ViewController ()

@property(nonatomic, strong) LoginFormView *loginView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.loginView = [[LoginFormView alloc] init];
    [self.view addSubview:self.loginView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
