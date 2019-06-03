//
//  CustomView.h
//  Task1
//
//  Created by Roma on 6/2/19.
//  Copyright © 2019 Roman. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomView : UIView
@property (strong, nonatomic ) UIImage* image;
@property (strong, nonatomic ) NSString* urlDescription;



- (instancetype)initWithImage:(UIImage*)image andDescription:(NSString*)description;
@end

NS_ASSUME_NONNULL_END
