//
//  CommentCell.h
//  VideoTutorialsWithServerApp
//
//  Created by Samuel Germain on 2019-10-07.
//  Copyright © 2019 Sam G. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Comment;

NS_ASSUME_NONNULL_BEGIN

@interface CommentCell : UITableViewCell

/* Assign the title and text of the comment cell */
-(void)updateUI:(nonnull Comment*)comment;
@end

NS_ASSUME_NONNULL_END
