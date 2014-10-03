//
// Created by Johnny Sparks on 10/3/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LoginFormView.h"

SPEC_BEGIN(LoginViewSpec)

describe(@"A login view", ^{

    __block LoginFormView *view;

    beforeEach(^{
        view = [[LoginFormView alloc] initWithFrame:CGRectZero];
    });

    // Always on, immutable
    context(@"Initialization", ^{

        // free test! (seriously, initialization can fubar)
        it(@"should initialize", ^{
            [[view shouldNot] beNil];
        });

        it(@"Has a text intput field for entering a username", ^{
            [[view.usernameField shouldNot] beNil];
        });

        it(@"Has a text intput field for entering a password", ^{
            [[view.passwordField shouldNot] beNil];
        });

        it(@"Has a submit button", ^{
            [[view.submitButton shouldNot] beNil];
        });

        it(@"hides password characters", ^{
            [[theValue(view.passwordField.secureTextEntry) should] beYes];
        });

    });

    // Make sure things show up on screen
    context(@"Rendering", ^{

        beforeEach(^{
            [view layoutSubviews];
        });

        it(@"Should not have a 0x0 frame", ^{
            [[theValue(CGRectEqualToRect(CGRectZero, view.bounds)) should] beNo];
        });

        it(@"Should have a minium height", ^{
            CGFloat minimumHeight = 300.0;
            [[theValue(CGRectGetHeight(view.frame)) should] beGreaterThanOrEqualTo:theValue(minimumHeight)];
        });

        it(@"Should have a minium width", ^{
            CGFloat minimumWidth = 300.0;
            [[theValue(CGRectGetHeight(view.frame)) should] beGreaterThanOrEqualTo:theValue(minimumWidth)];
        });

        it(@"Should not default to hidden", ^{
            [[theValue(view.hidden) should] beNo];
        });

        it(@"'s username field is a subview", ^{
            [[view.subviews should] contain:view.usernameField];
        });

        it(@"'s password field is a subview", ^{
            [[view.subviews should] contain:view.passwordField];
        });

        it(@"'s submit button is a subview", ^{
            [[view.subviews should] contain:view.submitButton];
        });

        // make sure things aren't overlapping?
        it(@"should not overlap subviews", ^{
            CGRect namePassRect = CGRectIntersection(view.usernameField.frame, view.passwordField.frame);
            CGRect nameSubmitRect = CGRectIntersection(view.usernameField.frame, view.submitButton.frame);
            CGRect passSubmitRect = CGRectIntersection(view.passwordField.frame, view.submitButton.frame);

            [[theValue(CGRectIsNull(namePassRect)) should] beYes];
            [[theValue(CGRectIsNull(nameSubmitRect)) should] beYes];
            [[theValue(CGRectIsNull(passSubmitRect)) should] beYes];
        });


    });



});



SPEC_END