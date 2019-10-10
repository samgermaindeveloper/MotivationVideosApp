//
//  Comment.h
//  VideoTutorialsWithServerApp
//
//  Created by Samuel Germain on 2019-10-07.
//  Copyright © 2019 Sam G. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Comment : NSObject
/*A text comment posted on a video*/
@property(nonatomic,strong) NSString* comment;
/* The name of a person posting a comment */
@property(nonatomic,strong) NSString* name;
@end

NS_ASSUME_NONNULL_END
