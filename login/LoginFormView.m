//
// Created by Johnny Sparks on 10/3/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import "LoginFormView.h"


@implementation LoginFormView


- (instancetype)initWithFrame:(CGRect)frame {
    CGRect minFrame = frame;
    minFrame.size.height = MAX(frame.size.height, 300);
    minFrame.size.width = MAX(frame.size.width, 300);

    self = [super initWithFrame:minFrame];
    if (self) {

        CGRect bounds = minFrame;
        bounds.origin = CGPointZero;

        self.usernameField = [[UITextField alloc] initWithFrame:bounds];
        [self addSubview:self.usernameField];

        self.passwordField = [[UITextField alloc] initWithFrame:bounds];
        [self addSubview:self.passwordField];

        self.submitButton = [[UIButton alloc] initWithFrame:bounds];
        [self addSubview:self.submitButton];

        // 2
        self.passwordField.secureTextEntry = YES;
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect fieldsRect, loginRect, passRect, submitRect;

    CGRectDivide(self.bounds, &fieldsRect, &submitRect, CGRectGetHeight(self.bounds) * 0.3, CGRectMaxYEdge);
    CGRectDivide(fieldsRect, &loginRect, &passRect, CGRectGetHeight(fieldsRect) * 0.5, CGRectMaxYEdge);

    self.usernameField.frame = CGRectInset(loginRect, 3, 3);
    self.passwordField.frame = CGRectInset(passRect, 3, 3);
    self.submitButton.frame = CGRectInset(submitRect, 3, 3);
}


@end