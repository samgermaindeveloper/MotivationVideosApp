//
//  MyOwnTableView.m
//  VideoTutorialsWithServerApp
//
//  Created by Samuel Germain on 2019-10-10.
//  Copyright © 2019 Sam G. All rights reserved.
//

#import "MyOwnTableView.h"

@implementation MyOwnTableView

-(CGSize) intrinsicContentSize{
    [self layoutIfNeeded];
    [self invalidateIntrinsicContentSize];
    return self.contentSize;
}

//-(void) setContentSize:(CGSize)size{
//    [self invalidateIntrinsicContentSize];
//}

-(void) reloadData {
    [super reloadData];
    [self invalidateIntrinsicContentSize];
}
                     
@end
