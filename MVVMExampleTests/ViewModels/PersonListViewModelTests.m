//
//  PersonListViewModelTests.m
//  MVVMExample
//
//  Created by Martin Richter on 02/05/16.
//  Copyright © 2016 Futurice. All rights reserved.
//

// В проекте 5 групп:
// Views
// ViewModels
// Models
// Stores
// Helpers

#import <XCTest/XCTest.h>
#import "PersonListViewModel.h" // Inject "ViewModel"
#import "Person.h"              // Inject "Model"

#pragma mark - Mocks

// Создание макета реального хранилища данных с одним свойством: (BOOL) получить ли данные людей
@interface MockPersonStore : PersonStore // Наследование от "Store"
@property (nonatomic, assign) BOOL didFetchPeople;
@end

@implementation MockPersonStore
// RACSignal реализует возврат данных из "Model"
- (RACSignal *)fetchPeople {
    self.didFetchPeople = YES;
    // Макет массива с данными из объекта Person в "Model"
    NSArray *people = @[
        [[Person alloc] initWithFirstName:@"A" lastName:@"B"],
        [[Person alloc] initWithFirstName:@"C" lastName:@"D"]
    ];
    
    // Not: return people; But using RACSignal
    return [RACSignal return:people];
}
@end

#pragma mark - Test Class
// тест-класс
@interface PersonListViewModelTests : XCTestCase
@property (nonatomic, strong) MockPersonStore *mockStore; // Параметр с определенным макетом
@end


// Прогон всех тестов
@implementation PersonListViewModelTests
- (void)setUp {
    [super setUp];
    self.mockStore = [[MockPersonStore alloc] init]; // Иниц-ция макета
}

- (void)tearDown {
    self.mockStore = nil;
    [super tearDown];
}

- (void)testViewModelFetchesPeopleAfterInit {
    // Иниц-ция "ViewModel" с "Store"
    id _ __unused = [[PersonListViewModel alloc] initWithStore:self.mockStore]; // Неиспользуемая переменная
    // Получен ли список людей
    XCTAssertTrue(self.mockStore.didFetchPeople);
}

// Равно ли кол-во запланированному
- (void)testViewModelReturnsPeopleCount {
    PersonListViewModel *viewModel = [[PersonListViewModel alloc] initWithStore:self.mockStore];
    XCTAssertEqual([viewModel numberOfPeopleInSection:0], 2);
}

- (void)testViewModelReturnsFullNames {
    PersonListViewModel *vm = [[PersonListViewModel alloc] initWithStore:self.mockStore];
    NSLog(@"\n\n\n vm:%@ \n [vm fullNameAtIndexPath:0]: %@", vm, [vm fullNameAtIndexPath:0]);
    NSString *expectedResult = @"A B";
    XCTAssertTrue([[vm fullNameAtIndexPath:0] isEqualToString:expectedResult], @"Strings are not equal %@ %@", expectedResult, [vm fullNameAtIndexPath:0]);
    
//    XCTFail(@"Try to implement this test!");
}

@end
