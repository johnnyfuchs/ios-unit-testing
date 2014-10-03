//
// Created by Johnny Sparks on 10/3/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LoginFormView.h"
#import "FormModel.h"

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
            CGFloat minimumHeight = 150.0;
            [[theValue(CGRectGetHeight(view.frame)) should] beGreaterThanOrEqualTo:theValue(minimumHeight)];
        });

        it(@"Should have a minium width", ^{
            CGFloat minimumWidth = 320.0;
            [[theValue(CGRectGetWidth(view.frame)) should] beGreaterThanOrEqualTo:theValue(minimumWidth)];
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


    // This is a little blend of integration and unit testing
    context(@"Event handling", ^{

        it(@"Can have the username text field focused", ^{
            [[theValue([view.usernameField canBecomeFirstResponder]) should] beTrue];
        });

        it(@"Can have the password text field focused", ^{
            [[theValue([view.passwordField canBecomeFirstResponder]) should] beTrue];
        });

        it(@"Fires a submit handler when the submit button is tapped", ^{
            __block LoginFormView *submittedFormView = nil;

            [view setOnSubmit:^(LoginFormView *loginFormView) {
                submittedFormView = loginFormView;
            }];

            [view.submitButton sendActionsForControlEvents:UIControlEventTouchUpInside];

            [[expectFutureValue(submittedFormView) shouldEventually] beNonNil];
        });

        it(@"Can handle a nil submit callback", ^{
            // could assert message to std error
            [view.submitButton sendActionsForControlEvents:UIControlEventTouchUpInside];
            [[view.onSubmit should] beNil];
        });
    });

    context(@"Model loading", ^{

        __block FormModel *model;

        beforeEach(^{
            model = [[FormModel alloc] init];
            model.usernamePlaceholder = @"Flugen durna namerine";
            model.passwordPlaceholder = @"Pfffstarwortz";
            model.username = @"Martini";
            model.password = @"Pastrami";
            model.loginTitle = @"Come in friend! Feel Heart.";
        });

        it(@"Updates the username text when a new form model is set", ^{
            [[view.usernameField.text shouldNot] equal:model.username];
            view.model = model;
            [[view.usernameField.text should] equal:model.username];
        });

        it(@"Updates the username placeholder text when a new form model is set", ^{
            view.model = model;
            [[view.usernameField.placeholder should] equal:model.usernamePlaceholder];
            [[view.usernameField.placeholder shouldNot] beNil];
        });

        it(@"Updates the password text when a new form model is set", ^{
            [[view.passwordField.text shouldNot] equal:model.password];
            view.model = model;
            [[view.passwordField.text should] equal:model.password];
        });

        it(@"Updates the password placeholder text when a new form model is set", ^{
            view.model = model;
            [[view.passwordField.placeholder should] equal:model.passwordPlaceholder];
            [[view.passwordField.placeholder shouldNot] beNil];
        });

        it(@"Updates the login form submit button text when a new form model is set", ^{
            view.model = model;
            NSString *loginTitle = [view.submitButton titleForState:UIControlStateNormal];
            [[loginTitle shouldNot] beNil];
            [[loginTitle should] equal:model.loginTitle];
        });
    });

    context(@"Model updating", ^{

        it(@"Loads the model with the username from the text field", ^{
            view.usernameField.text = @"EweserMame";
            FormModel *model = view.model;
            [[model.username should] equal:@"EweserMame"];
        });

        it(@"Loads the model with the password from the text field", ^{
            view.passwordField.text = @"PorsewOrt";
            FormModel *model = view.model;
            [[model.password should] equal:@"PorsewOrt"];
        });
    });
});



SPEC_END