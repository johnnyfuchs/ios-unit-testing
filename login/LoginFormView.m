//
// Created by Johnny Sparks on 10/3/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "LoginFormView.h"
#import "UIColor+EE.h"
#import "FormModel.h"


@implementation LoginFormView

- (instancetype)initWithFrame:(CGRect)frame {

    CGRect minFrame = frame;
    minFrame.size.height = MAX(frame.size.height, 150);
    minFrame.size.width = MAX(frame.size.height, 320);

    self = [super initWithFrame:minFrame];
    if (self) {

        CGRect bounds = minFrame;
        bounds.origin = CGPointZero;

        self.usernameField = [[UITextField alloc] initWithFrame:frame];
        self.usernameField.backgroundColor = [UIColor grayColor];
        [self addSubview:self.usernameField];

        self.passwordField = [[UITextField alloc] initWithFrame:frame];
        self.passwordField.backgroundColor = [UIColor grayColor];
        [self addSubview:self.passwordField];

        self.submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.submitButton.frame = bounds;
        [self addSubview:self.submitButton];

        [self.submitButton setTitle:@"SomeTitle" forState:UIControlStateNormal];
        [self.submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.submitButton.backgroundColor = [UIColor pinkColor];
        [self.submitButton addTarget:self action:@selector(handleTap) forControlEvents:UIControlEventTouchUpInside];

        self.passwordField.secureTextEntry = YES;
    }

    return self;
}

- (void)handleTap {
    // logging what went wrong
    if(self.onSubmit){
        self.onSubmit(self);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect fieldsRect, loginRect, passRect, submitRect;

    CGRectDivide(self.bounds, &fieldsRect, &submitRect, CGRectGetHeight(self.bounds) * 0.67, CGRectMinYEdge);
    CGRectDivide(fieldsRect, &loginRect, &passRect, CGRectGetHeight(fieldsRect) * 0.5, CGRectMinYEdge);

    self.usernameField.frame = CGRectInset(loginRect, 1, 1);
    self.passwordField.frame = CGRectInset(passRect, 1, 1);
    self.submitButton.frame = CGRectInset(submitRect, 1, 1);
}


- (FormModel *)model {
    FormModel *model = [FormModel new];
    model.username = self.usernameField.text;
    model.password = self.passwordField.text;
    return model;
}

- (void)setModel:(FormModel *)model {
    self.usernameField.placeholder = model.usernamePlaceholder;
    self.usernameField.text = model.username;

    self.passwordField.placeholder = model.passwordPlaceholder;
    self.passwordField.text = model.password;

    [self.submitButton setTitle:model.loginTitle forState:UIControlStateNormal];
}


@end