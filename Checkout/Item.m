//
//  Item.m
//  Checkout
//
//  Created by Andover on 6/16/13.
//  Copyright (c) 2013 Kevin Song. All rights reserved.
//

#import "Item.h"

@implementation Item

@synthesize itemId;
@synthesize name;
@synthesize description;
@synthesize price;
@synthesize transactionItemId;

-(Item*)initWithItemId: (NSString*)itemId1 withTransactionItemId:(NSString*)transactionItemId1 withName:(NSString*)name1 withDescription:(NSString*)description1 withPrice:(NSString*)price1 {
    itemId         = itemId1;
    transactionItemId = transactionItemId1;
    name           = name1;
    description    = description1;
    price          = price1;
    return self;
}

@end
