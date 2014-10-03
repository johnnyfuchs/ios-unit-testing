//
// Created by Johnny Sparks on 10/3/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class LoginFormView;
@class FormModel;

typedef void (^OnSubmitFormViewBlock)(LoginFormView *loginFormView);

@interface LoginFormView : UIView
// 1
@property(nonatomic, strong) UITextField *usernameField;
@property(nonatomic, strong) UITextField *passwordField;
@property(nonatomic, strong) UIButton *submitButton;
@property(nonatomic, copy)  OnSubmitFormViewBlock onSubmit;
@property(nonatomic, assign) FormModel *model;

@end