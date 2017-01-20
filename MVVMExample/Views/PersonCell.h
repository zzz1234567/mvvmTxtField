//
//  PersonCell.h
//
#import <UIKit/UIKIt.h>

@class PersonListViewModel;

@interface PersonCell : UITableViewCell

// Подход GroceryList:
// @property (nonatomic, strong) PersonListViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UILabel *personTitle;
@property (weak, nonatomic) IBOutlet UITextField *personEmail;

@end
