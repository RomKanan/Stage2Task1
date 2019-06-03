//
//  ScrollViewController.h
//  Task1
//
//  Created by Roma on 6/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

#import "CustomView.h"
#import "DataSource.h"

NS_ASSUME_NONNULL_BEGIN

@class ScrollViewController;

@protocol ScrollVCDelegate <NSObject>

-(void)passViewWithItem:(Item*)item;
-(void)restoreTitle;

@end

@interface ScrollViewController : UIViewController
@property (weak, nonatomic) id<ScrollVCDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
