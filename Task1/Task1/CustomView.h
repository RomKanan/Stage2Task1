//
//  CustomView.h
//  Task1
//
//  Created by Roma on 6/2/19.
//  Copyright © 2019 Roman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@class CustomView;

@protocol CustomViewDelegate <NSObject>

-(void)setTitleAccordingToView:(Item*)view;

@end


@interface CustomView : UIView

@property (strong, nonatomic) Item* item;
@property (weak, nonatomic) id<CustomViewDelegate> delegate;

- (instancetype)initWithItem:(Item*)item;
@end


NS_ASSUME_NONNULL_END
