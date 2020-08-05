//
//  ViewController.m
//  Tech Tree
//
//  Created by Suzy Lee on 8/5/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GIDSignIn sharedInstance].presentingViewController = self;
    // Sign in silently if possible
    [[GIDSignIn sharedInstance] signIn];

    
    
}

@end
