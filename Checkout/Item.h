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
@property NSString* name;
@property NSString* description;
@property NSString* price;

+allocWithItemId: (NSString*)itemId withName:(NSString*)name withDescription:(NSString*)description withPrice:(NSString*)price;

@end
