//
// Created by Johnny Sparks on 10/3/14.
// Copyright (c) 2014 beergrammer. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LoginView.h"


SPEC_BEGIN(LoginViewSpec)

describe(@"A login view", ^{

    __block LoginView *view;

    context(@"Initialization", ^{

        beforeEach(^{
            view = [[LoginView alloc] init];
        });

        it(@"Has an input field for entering a username or email address", ^{

            [[view.usernameField shouldNot] beNil];
            [[view.passwordField shouldNot] beNil];

        });
    });


});



SPEC_END