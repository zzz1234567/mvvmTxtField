//
//  UITextField+EmailChecker.m
//  MVVMExample
//
//  Created by Кузнецов Андрей on 20.01.17.
//  Copyright © 2017 Futurice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UITextField+EmailChecker.h"


@implementation UITextField (EmailChecker)

- (RACSignal *)validateEmail {
//    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber){
//        __block BOOL halt = NO;
//        [self enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
//            [subscriber sendNext:line];
//            *stop = halt;
//        }];
//        [subscriber sendCompleted];
//        return [RACDisposable disposableWithBlock:^{
//            halt = YES;
//            NSLog(@"Disposed DatumSignal");
//        }];
//    }];
    
    RACSignal *validEmailSignal = [self.rac_textSignal map:^id(NSString *val) {
        return @([val rangeOfString:@"@"].location != NSNotFound);
    }];
    
    return validEmailSignal;
    
}






@end
