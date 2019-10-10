//
//  VideoVC.m
//  VideoTutorialsWithServerApp
//
//  Created by Samuel Germain on 2019-10-06.
//  Copyright © 2019 Sam G. All rights reserved.
//

#import "VideoVC.h"
#import "HTTPService.h"
#import "Video.h"
#import "CommentCell.h"
#import "Comment.h"

@interface VideoVC ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *videoTitle;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextView *enterCommentView;
@property (weak, nonatomic) IBOutlet UITextField *enterCommentName;
@property (weak, nonatomic) IBOutlet UITableView *comments;

@property(strong, nonatomic) NSArray* commentList;
@end

/*
 A view controller that displays a video and lets users post comments
 */
@implementation VideoVC

-(void) viewDidLoad{
    [super viewDidLoad];
    NSString *url = [NSString stringWithFormat:@"%s%@", "/comments/", self.video.identifier];
    // Get all the comments for this video
    [[HTTPService instance] getWithUrlPath:url :^(NSArray* _Nullable dataArray, NSString* _Nullable errMessage){
        
        if (dataArray){
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for (NSDictionary *d in dataArray){
                Comment *com = [[Comment alloc]init];
                com.name = [d objectForKey:@"user"];
                com.comment = [d objectForKey:@"comment"];
                [arr addObject:com];
            }
            
            self.commentList = arr;
            [self updateTableData];
        }else if(errMessage){
            NSLog(@"%@", errMessage.debugDescription);
        }
    }];
    self.webView.navigationDelegate = self;
    self.videoTitle.text = self.video.title;
    self.textView.text = self.video.desc;
    [self.webView loadHTMLString:self.video.iframe baseURL:nil];
}

/* Posts a comment to a video */
- (IBAction)postButton:(id)sender {
    NSString *url = [NSString stringWithFormat:@"%s%@", "/comments/", self.video.identifier];
    [[HTTPService instance] postWithUrlPath:url name:self.enterCommentName.text comment:self.enterCommentView.text];
}


/*
 Applies some css styling to the video frames to make them fit on the screen
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSString* css = @".container {position: relative; width: 100%; height: 0; padding-bottom: 56.25%; } .video {position: absolute; top: 0; left: 0; width: 100%; height: 100%;}";
    NSString* js = [NSString stringWithFormat:
                    @"var styleNode = document.createElement('style');\n"
                    "styleNode.type = \"text/css\";\n"
                    "var styleText = document.createTextNode('%@');\n"
                    "styleNode.appendChild(styleText);\n"
                    "document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
    [self.webView evaluateJavaScript:js completionHandler:nil];
}

-(void) updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.comments reloadData];
    });
}

/*
 Determines which table cell goes in each row
 */
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentCell* cell = (CommentCell*)[tableView dequeueReusableCellWithIdentifier:@"comm"];
    
    if (!cell){
        cell = [[CommentCell alloc]init];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    Comment *comment = [self.commentList objectAtIndex:indexPath.row];
    CommentCell* comCell = (CommentCell*)cell;
    [comCell updateUI:comment];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.commentList.count;
}

@end
