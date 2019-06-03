//
//  Item.h
//  Task1
//
//  Created by Roma on 6/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject

@property (strong, nonatomic) UIImage* image;
@property (strong, nonatomic) NSString* urlDescription;

@end

NS_ASSUME_NONNULL_END
