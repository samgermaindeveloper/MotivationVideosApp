//
//  Video.h
//  VideoTutorialsWithServerApp
//
//  Created by Samuel Germain on 2019-10-06.
//  Copyright © 2019 Sam G. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Video : NSObject
/* The title of the video */
@property(nonatomic,strong) NSString* title;
/* Description of the video */
@property(nonatomic,strong) NSString* desc;
/* An html element that holds the information to display a video */
@property(nonatomic,strong) NSString* iframe;
/* The url to an image displayed next to the video */
@property(nonatomic,strong) NSString* thumbnailUrl;
/* A unique number identifier for each video */
@property(nonatomic,assign) NSNumber* identifier;
@end

NS_ASSUME_NONNULL_END
