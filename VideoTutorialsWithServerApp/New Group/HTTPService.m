//
//  HTTPService.m
//  VideoTutorialsWithServerApp
//
//  Created by Samuel Germain on 2019-10-06.
//  Copyright © 2019 Sam G. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "http://localhost:6060"
#define URL_TUTORIALS "/tutorials"

/*
 Singleton class for making get and post requests to our own server
 */
@implementation HTTPService

+ (id) instance {
    static HTTPService *sharedInstance = nil;
    
    //Allocate the instance if it doesn't exist
    @synchronized (self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    
    return sharedInstance;
    
}

/*
 Sends a get request
 param urlPath: The extension to the base url base
 param completionHandler: deals with the data or sends an error message
 */
-(void) getWithUrlPath:urlPath :(nullable onComplete)completionHandler {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%@", URL_BASE, urlPath]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData* _Nullable data, NSURLResponse* _Nullable response, NSError* _Nullable error){
        
        if (data != nil){
            NSError *err;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil){
                completionHandler(json, nil);
            }else{
                completionHandler(nil, err.debugDescription);
            }
        }else{
            NSLog(@"Err: %@", error.debugDescription);
            completionHandler(nil, error.debugDescription);
        }
        
    }] resume];
}

/*
 Sends a post request to the server to record comments made on videos
 param urlPath: The extension to the base url
 param name: The name of the person posting a comment
 param comment: The comment posted
 */
-(void) postWithUrlPath:(NSString*) urlPath name:(NSString*)name comment:(NSString*)comment{

    
    NSDictionary *commentToPost = @{@"user":name, @"comment":comment};
    NSError* err;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%@", URL_BASE, urlPath]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPMethod:@"POST"];
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:commentToPost options:0 error:&err];
    
    [request setHTTPBody:postData];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error){

    }];
    
    [postDataTask resume];
    
}

@end
