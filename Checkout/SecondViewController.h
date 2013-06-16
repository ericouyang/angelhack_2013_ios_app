//
//  SecondViewController.h
//  Checkout
//
//  Created by Kevin Song on 6/15/13.
//  Copyright (c) 2013 Kevin Song. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RedLaserSDK.h"

@interface SecondViewController : UIViewController {

    IBOutlet UIButton *scan;

}

@property (nonatomic, retain) UIButton *scan;

-(IBAction) scanBtn;

@end
