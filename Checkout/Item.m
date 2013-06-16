//
//  Item.m
//  Checkout
//
//  Created by Andover on 6/16/13.
//  Copyright (c) 2013 Kevin Song. All rights reserved.
//

#import "Item.h"

@implementation Item

@synthesize itemId, name, description, price;

+allocWithItemId: (NSString*)itemId withName:(NSString*)name withDescription:(NSString*)description withPrice:(NSString*)price {
    self.itemId         = itemId;
    self.name           = name;
    self.description    = description;
    self.price          = price;
}

@end
