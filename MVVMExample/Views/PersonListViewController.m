//
//  PersonListViewController.m
//  MVVMExample
//
//  Created by Martin Richter on 28/04/16.
//  Copyright © 2016 Futurice. All rights reserved.
//

#import "PersonListViewController.h"
#import <libextobjc/EXTScope.h>
#import "PersonCell.h"
#import "UITextField+EmailChecker.h"

@interface PersonListViewController ()

@property (nonatomic, strong, readonly) PersonListViewModel *viewModel;

@end

@implementation PersonListViewController

#pragma mark - Lifecycle

- (instancetype)initWithViewModel:(PersonListViewModel *)viewModel {
    self = [super initWithStyle:UITableViewStylePlain];
    if (!self) return nil;

    _viewModel = viewModel;

    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UINib *cell = [UINib nibWithNibName:NSStringFromClass([PersonCell class])bundle:nil];
    [self.tableView registerNib:cell forCellReuseIdentifier:NSStringFromClass(PersonCell.class)];
    
    [self bindViewModel];
}

#pragma mark - Bindings
- (void)bindViewModel {
    self.title = [self.viewModel title];
    @weakify(self);
    [[self.viewModel.hasUpdatedContent
        deliverOnMainThread] // important, or view won't update instantly
        subscribeNext:^(id _) {
            @strongify(self); // this, together with @weakify, prevents a retain cycle
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
            [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
        }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfPeopleInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /** 
     // Кастомная ячейка через класс, без xib'а
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(CustomCell.class) forIndexPath:indexPath];
    */
    
    PersonCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(PersonCell.class) forIndexPath:indexPath];
    
    cell.personTitle.text = [self.viewModel fullNameAtIndexPath:indexPath];
    
    /** 
     
     @description Валидация Email
     
     @see UITextField+EmailChecker
     
     */
    
    RAC(cell.personEmail, textColor)=[cell.personEmail.validateEmail map:^id(id val){
        if ([val boolValue]) {
            return [UIColor greenColor];
        } else {
            return [UIColor redColor]; }
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Custom cell's height: not implemented
    // PersonCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass(PersonCell.class)];
    // RSOQuestion *question = [self.questions objectAtIndex:indexPath.row];
    // CGFloat height = [cell minimumHeightForCell:question.text];
    
    return 111.0f;
    
}

@end
