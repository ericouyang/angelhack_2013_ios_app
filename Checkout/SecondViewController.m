//
//  SecondViewController.m
//  Checkout
//
//  Created by Kevin Song on 6/15/13.
//  Copyright (c) 2013 Kevin Song. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSLog(@"View Loaded!");

}

- (void)viewDidAppear:(BOOL)animated
{    
    NSLog(@"View appeared");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) barcodePickerController:(BarcodePickerController*)picker
                   returnResults:(NSSet *)results
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self dismissModalViewControllerAnimated:TRUE];
    
    //NSLog(@"%@", [[results anyObject] barcodeString]);

    NSString *requestString = [NSString stringWithFormat:@"http://simpligro.com/api/item.json?upc=%@", [[[results anyObject]barcodeString] substringFromIndex:1]];
    
    //NSLog(requestString);
    
    NSString *jsonString = [NSString stringWithContentsOfURL:[NSURL URLWithString:requestString] encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@", jsonString);
    
    
    
    
}

- (IBAction)scanBtn {
    
    BarcodePickerController *picker = [[BarcodePickerController alloc] init];
    // Let's keep things simple by using the default built-in overlay
    //[picker setOverlay:customOverlay];
    [picker setDelegate:self];
    picker.orientation = UIImageOrientationUp;
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self presentModalViewController:picker animated:TRUE];
    //[picker release];

}

@end
