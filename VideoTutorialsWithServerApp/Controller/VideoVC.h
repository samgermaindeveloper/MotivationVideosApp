//
//  VideoVC.h
//  VideoTutorialsWithServerApp
//
//  Created by Samuel Germain on 2019-10-06.
//  Copyright © 2019 Sam G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@class Video;

NS_ASSUME_NONNULL_BEGIN

@interface VideoVC : UIViewController <WKNavigationDelegate, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate, UITextFieldDelegate>
@property (nonatomic,strong) Video *video;
@end

NS_ASSUME_NONNULL_END
