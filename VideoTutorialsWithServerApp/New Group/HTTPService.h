//
//  HTTPService.h
//  VideoTutorialsWithServerApp
//
//  Created by Samuel Germain on 2019-10-06.
//  Copyright © 2019 Sam G. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^onComplete)(NSArray * _Nullable dataArray, NSString * _Nullable errMessage);

@interface HTTPService : NSObject

//Static: call it globally on class without creating an instance of that class
+ (id) instance;

/*
 Sends a get request
 param urlPath: The extension to the base url base
 param completionHandler: deals with the data or sends an error message
 */
-(void) getWithUrlPath:(NSString*)urlPath :(nullable onComplete)completionHandler;

/*
 Sends a post request to the server to record comments made on videos
 param urlPath: The extension to the base url
 param name: The name of the person posting a comment
 param comment: The comment posted
 */
-(void) postWithUrlPath:(NSString*) urlPath name:(NSString*)name comment:(NSString*)comment;

@end

NS_ASSUME_NONNULL_END
