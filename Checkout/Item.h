//
//  Item.h
//  Checkout
//
//  Created by Andover on 6/16/13.
//  Copyright (c) 2013 Kevin Song. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property NSString* itemId;
@property NSString* transactionItemId;
@property NSString* name;
@property NSString* description;
@property NSString* price;


-(Item*)initWithItemId: (NSString*)itemId1 withTransactionItemId:(NSString*)transactionItemId1 withName:(NSString*)name1 withDescription:(NSString*)description1 withPrice:(NSString*)price1;

@end
