//
//  FirstViewController.m
//  Checkout
//
//  Created by Kevin Song on 6/15/13.
//  Copyright (c) 2013 Kevin Song. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "Item.h"

@interface FirstViewController ()


@end

@implementation FirstViewController


@synthesize cartTable;
@synthesize subTotalLabel;

NSArray *items = NULL;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //items = [[NSArray alloc] initWithObjects:@"Item No. 1", @"Item No. 2", @"Item No. 3", @"Item No. 4", @"Item No. 5", @"Item No. 6", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [cartTable reloadData];
    [cartTable setEditing:NO animated:YES];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    subTotalLabel.text = [[NSString alloc] initWithFormat:@"Subtotal: $%@", appDelegate.subTotal];
}




#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    

    
    // Return the number of rows in the section.
    // Usually the number of items in your array (the one that holds your list)
    return [appDelegate.currentCart count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    
    //Where we configure the cell in each row
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    // Configure the cell... setting the text of our cell's label
    NSLog(@"Object: %@", [appDelegate.currentCart objectAtIndex:indexPath.row]);
    
    Item* currentItem = [appDelegate.currentCart objectAtIndex:indexPath.row];
    /*
    NSString *requestString = [NSString stringWithFormat:@"http://simpligro.com/api/item.json?id=%@", [appDelegate.currentCart objectAtIndex:indexPath.row]];
    
    //NSLog(requestString);
    
    NSString *jsonString = [NSString stringWithContentsOfURL:[NSURL URLWithString:requestString] encoding:NSUTF8StringEncoding error:nil];
    
    //NSLog(@"%@", jsonString);
    
    NSError *e = nil;
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
    
    //NSLog(@"%@", data);
    
    NSString *itemName = [JSON objectForKey:@"name"];
    NSString *itemPriceString = [JSON objectForKey:@"cost"];
    float cost = [itemPriceString floatValue];
    
    cost = cost / 100;
    
    NSString *itemPrice = [NSString stringWithFormat:@"$%.2f", cost];
    */

    
    cell.textLabel.text = currentItem.name;
    cell.detailTextLabel.text = currentItem.price;
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    // If you want to push another view upon tapping one of the cells on your table.
    
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

// Override to support conditional editing of the table view.
// This only needs to be implemented if you are going to be returning NO
// for some items. By default, all items are editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        NSString *postString = [[NSString alloc] initWithFormat:@"http://simpligro.com/api/transaction_item_delete.json?id=%@", ((Item*)[appDelegate.currentCart objectAtIndex:indexPath.row]).transactionItemId];
        
        NSLog(@"%@", postString);
        
        NSString* postResult = [NSString stringWithContentsOfURL:[NSURL URLWithString:postString] encoding:NSUTF8StringEncoding error:nil];
    
        NSLog(@"%@", postResult);
        
        [appDelegate.currentCart removeObject:[appDelegate.currentCart objectAtIndex:indexPath.row]];
        
        NSLog(@"%@",@"Deleted");
        
        
        NSString *subTotalString = [[NSString alloc] initWithFormat:@"http://simpligro.com/api/transaction_subtotal.json?id=%@", appDelegate.currentCartId];
        NSString* subTotalResult = [NSString stringWithContentsOfURL:[NSURL URLWithString:subTotalString] encoding:NSUTF8StringEncoding error:nil];
        subTotalResult = [subTotalResult stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        
        NSLog(@"subTotalResult: %@", subTotalResult);
        
        float subTotalFloat = [subTotalResult floatValue];
        
        subTotalFloat = subTotalFloat / 100;
        
        subTotalResult = [NSString stringWithFormat:@"%.2f", subTotalFloat];
        
        appDelegate.subTotal = subTotalResult;
        
        subTotalLabel.text = [[NSString alloc] initWithFormat:@"Subtotal: $%@", subTotalResult];
        
        [cartTable reloadData];
        [cartTable setEditing:NO animated:YES];
    }
}

@end
