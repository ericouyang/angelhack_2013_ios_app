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
    IBOutlet UILabel *subTotalLabel;
    IBOutlet UILabel *taxLabel;
    IBOutlet UILabel *totalLabel;
}

@property(nonatomic, retain) UIButton *pay;
@property (nonatomic, retain) UILabel *subTotalLabel;
@property (nonatomic, retain) UILabel *taxLabel;
@property (nonatomic, retain) UILabel *totalLabel;

-(IBAction) payBtn;


@end
