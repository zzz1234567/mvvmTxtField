//
//  GCYGroceryStoreCell.m
//  GroceryList
//
//  Created by Justin Spahr-Summers on 2013-12-14.
//  Copyright (c) 2013 Justin Spahr-Summers. All rights reserved.
//

#import "PersonCell.h"

#import "PersonStore.h"
#import "PersonListViewModel.h"

@implementation PersonCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
 
	return self;
}

/* not implemented
- (CGFloat) minimumHeightForCell:(NSString *)answer {
    [self.answerTextLabel setText:answer];
    NSString *refinedAnswerText = self.answerTextLabel.plainText;
    CGRect newRect = [refinedAnswerText boundingRectWithSize:CGSizeMake(320, INFINITY)
                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                  attributes:@{NSFontAttributeName: self.answerTextLabel.font}
                                                     context:nil];
    CGFloat actualHeight = newRect.size.height;
    
    //Add some
    actualHeight += 53;
    
    return actualHeight < 95 ? 95 : actualHeight ;
}
*/

@end
