//
//  ViewController.m
//  VideoTutorialsWithServerApp
//
//  Created by Samuel Germain on 2019-10-05.
//  Copyright © 2019 Sam G. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"
#import "VideoVC.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) NSArray* videoList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *tut = @"/tutorials";
    //Get information for all the video cells on the main page
    [[HTTPService instance] getWithUrlPath:tut :^(NSArray* _Nullable dataArray, NSString* _Nullable errMessage){
        
        if (dataArray){
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for (NSDictionary *d in dataArray){
                Video *vid = [[Video alloc]init];
                vid.title = [d objectForKey:@"title"];
                vid.desc = [d objectForKey:@"desc"];
                vid.thumbnailUrl = [d objectForKey:@"thumbnailUrl"];
                vid.iframe = [d objectForKey:@"iframe"];
                vid.identifier = [d objectForKey:@"id"];
                [arr addObject:vid];
            }
            
            self.videoList = arr;
            [self updateTableData];
            
        }else if(errMessage){
            NSLog(@"%@", errMessage.debugDescription);
        }
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell* cell = (VideoCell*)[tableView dequeueReusableCellWithIdentifier:@"main"];
    
    if (!cell){
        cell = [[VideoCell alloc]init];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    VideoCell* vidCell = (VideoCell*)cell;
    [vidCell updateUI:video];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Video* video = [self.videoList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"videoVC" sender:video];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    VideoVC *vc = (VideoVC*)segue.destinationViewController;
    Video *video = (Video*)sender;
    vc.video = video;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.videoList.count;
}

@end
