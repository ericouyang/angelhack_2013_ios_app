//
//  AppDelegate.h
//  Checkout
//
//  Created by Kevin Song on 6/15/13.
//  Copyright (c) 2013 Kevin Song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property NSMutableArray *currentCart;
@property NSString *currentCartId;
@property NSString *subTotal;

@end
