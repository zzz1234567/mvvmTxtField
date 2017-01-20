//
//  UITextField+EmailChecker.h
//  MVVMExample
//
//  Created by Кузнецов Андрей on 20.01.17.
//  Copyright © 2017 Futurice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@class RACSignal;

@interface UITextField (EmailChecker)

- (RACSignal *)validateEmail;

@end
