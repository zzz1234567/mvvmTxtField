//
//  Person.h
//  MVVMExample
//
//  Created by Martin Richter on 02/05/16.
//  Copyright © 2016 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy, readonly) NSString *firstName;
@property (nonatomic, copy, readonly) NSString *lastName;
@property (nonatomic, copy, readonly) NSString *emailAddress;

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;
- (instancetype)initWithEmailAddress:(NSString *)emailAddress;

/*
// Из GroceryList
// Returns a signal that will send zero or more `GCYGroceryItem`s then complete.
+ (RACSignal *)groceryItemsWithString:(NSString *)string store:(GCYGroceryStore *)store;
*/

@end
