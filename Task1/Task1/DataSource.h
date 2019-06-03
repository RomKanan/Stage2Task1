//
//  DataSource.h
//  Task1
//
//  Created by Roma on 6/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DataSource : NSObject

@property (strong, nonatomic) NSArray<CustomView*> *views;

+ (DataSource*)sharedInstance;

@end

NS_ASSUME_NONNULL_END
