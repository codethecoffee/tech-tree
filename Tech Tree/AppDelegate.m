//
//  AppDelegate.m
//  Tech Tree
//
//  Created by Suzy Lee on 8/5/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Use Firebase library to configure APIs
    [FIRApp configure];
    
    [GIDSignIn sharedInstance].clientID = @"843783056798-0tjrpq2otukgshngbdkvkbnuvvovk10d.apps.googleusercontent.com";
    [GIDSignIn sharedInstance].delegate = self;  // If AppDelegate conforms to GIDSignInDelegate
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


// IMPLEMENTATION OF FIREBASE GOOGLE SIGN IN

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    return [[GIDSignIn sharedInstance] handleURL:url];
}

- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // ...
    if (error == nil) {
        GIDAuthentication *authentication = user.authentication;
        FIRAuthCredential *credential =
        [FIRGoogleAuthProvider
         credentialWithIDToken:authentication.idToken
         accessToken:authentication.accessToken];
        NSLog(@"Signed in successfully!");
        
        NSString *userId = user.userID;
        NSString *fullName = user.profile.name;
        NSString *email = user.profile.email;
        NSLog(@"userID: %@, fullName: %@, email: %@", userId, fullName, email);
                
        // Authenticate with Firebase using the id token
        [[FIRAuth auth] signInWithCredential:credential completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
            NSLog(error.localizedDescription);
        }];
        
        
    } else {
        NSLog(@"Something went wrong; could not login properly");
    }
}

- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations when the user disconnects from app here.
    // ...
}

/**
 Sign out user on current device
 */
- (IBAction)didTapSignOut:(id)sender {
    [[GIDSignIn sharedInstance] signOut];
}

@end
