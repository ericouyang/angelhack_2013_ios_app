//
//  PayPalViewController.h
//  Checkout
//
//  Created by Kevin Song on 6/16/13.
//  Copyright (c) 2013 Kevin Song. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"

@interface PayPalViewController : UIViewController<PayPalPaymentDelegate> {
    
    IBOutlet UIButton *pay;
}

@property(nonatomic, retain) UIButton *pay;

-(IBAction) payBtn;


@end
