//
//  CommentCell.m
//  VideoTutorialsWithServerApp
//
//  Created by Samuel Germain on 2019-10-07.
//  Copyright © 2019 Sam G. All rights reserved.
//

#import "CommentCell.h"
#import "Comment.h"

@interface CommentCell()


@property (weak, nonatomic) IBOutlet UIView *cellView;
@property (weak, nonatomic) IBOutlet UILabel *commentName;
@property (weak, nonatomic) IBOutlet UITextView *commentText;


@end

@implementation CommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)updateUI:(nonnull Comment*)comment{
    self.commentName.text = comment.name;
    self.commentText.text = comment.comment;
}


@end
