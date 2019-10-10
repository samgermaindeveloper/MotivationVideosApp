//
//  VideoCell.h
//  VideoTutorialsWithServerApp
//
//  Created by Samuel Germain on 2019-10-06.
//  Copyright © 2019 Sam G. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

NS_ASSUME_NONNULL_BEGIN

@interface VideoCell : UITableViewCell

/* Sets each element of the cell to be what it's supposed to be */
-(void)updateUI:(nonnull Video*)video;
/* Resizes an image to fit in a smaller or bigger view */
- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end

NS_ASSUME_NONNULL_END
