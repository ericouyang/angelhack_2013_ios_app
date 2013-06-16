//
//  PayPalViewController.m
//  Checkout
//
//  Created by Kevin Song on 6/16/13.
//  Copyright (c) 2013 Kevin Song. All rights reserved.
//

#import "PayPalViewController.h"
#import "AppDelegate.h"

@interface PayPalViewController ()

@end

@implementation PayPalViewController

@synthesize subTotalLabel;
@synthesize taxLabel;
@synthesize totalLabel;

NSString* totalAmount = nil;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)payBtn {
 
    //Create a PayPal Payment
    PayPalPayment *payment = [[PayPalPayment alloc] init];
    payment.amount = [[NSDecimalNumber alloc] initWithString:totalAmount]; //TODO: GET COST
    payment.currencyCode = @"USD";
    payment.shortDescription = @"Brogrammers' Beverage Shoppe"; //TODO: GET DESCRIPTION
    
    NSLog(@"%@", payment.amount);
    
    //Check whether payment is processable
    if (!payment.processable ) {
        //TODO: Handle negative amounts, etc. here
    }
    
    //Test Enviornment. Comment o
    [PayPalPaymentViewController setEnvironment:PayPalEnvironmentNoNetwork];
    
    //unique identifier of user
    NSString *aPayerId = nil; //TODO: Get user email (or other identifier)
    
    //Create PaypalPaymentViewController w/ credentials and payerId, PayPal Payment, PayPalPaymentDelegate to handle results
    PayPalPaymentViewController *paymentViewController;
    paymentViewController = [[PayPalPaymentViewController alloc] initWithClientId:@"AX5T5hBzmiu-kkfe-tkBxRkdtIN0zG3CTqXsB3WxD3NDeNkZtOXTdHE2Xm-H"
                                                                    receiverEmail:@"ericouyang@gmail.com"
                                                                          payerId:aPayerId
                                                                          payment:payment
                                                                         delegate:self];
    
    //present PayPalPaymentViewController
    [self presentViewController: paymentViewController animated:YES completion: nil];
    
}

- (void) payPalPaymentDidComplete:(PayPalPayment *)completedPayment {
    //Successful payment. Send to server for verification and fulfillment
    [self verifyCompletedPayment:completedPayment];
    
    //Dismiss PayPalPaymentViewController
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)payPalPaymentDidCancel {
    // The payment was canceled; dismiss the PayPalPaymentViewController.
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)verifyCompletedPayment:(PayPalPayment *)completedPayment {
    //send entire confirmation dictionary
    NSData *confirmation = [NSJSONSerialization dataWithJSONObject:completedPayment.confirmation options:0 error:nil];
    
    //TODO: Send confirmation to server and verify proof of payment
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    subTotalLabel.text = [[NSString alloc] initWithFormat:@"$%@", appDelegate.subTotal];
    
    float tax = [appDelegate.subTotal floatValue];
    tax = tax * 0.0875;
    
    float total = [appDelegate.subTotal floatValue];
    total = total + tax;

    
    taxLabel.text = [[NSString alloc] initWithFormat:@"$%.2f", tax];
    totalLabel.text = [[NSString alloc] initWithFormat:@"$%.2f", total];

    totalAmount = [[NSString alloc] initWithFormat:@"%.2f", total];
    
    //start w/ test environemnt. COMMENT OUT BELOW to switch to live
    [PayPalPaymentViewController setEnvironment:PayPalEnvironmentNoNetwork];
    [PayPalPaymentViewController prepareForPaymentUsingClientId: @"AX5T5hBzmiu-kkfe-tkBxRkdtIN0zG3CTqXsB3WxD3NDeNkZtOXTdHE2Xm-H"];//TODO: ADD CLIENT ID
}


@end
