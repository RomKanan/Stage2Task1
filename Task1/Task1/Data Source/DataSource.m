//
//  DataSource.m
//  Task1
//
//  Created by Roma on 6/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

#import "DataSource.h"



@interface DataSource()

@property (strong, nonatomic) NSDictionary* imagesWithUrls;

@end


@implementation DataSource

static DataSource *SINGLETON = nil;

static bool isFirstAccess = YES;

- (id) init{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    self.imagesWithUrls = @{@"0" : @"https://bitly.su/cQtlm",
                            @"1" : @"https://bitly.su/eX4vQr",
                            @"2" : @"https://bitly.su/77iaQh7y",
                            @"3" : @"https://bitly.su/AhLxv",
                            @"4" : @"https://bitly.su/aaNiFF",
                            @"5" : @"https://bitly.su/ZHnGi6M",
                            @"6" : @"https://bitly.su/4SgAziC",
                            @"7" : @"https://bitly.su/jLgg3s6",
                            @"8" : @"https://bitly.su/ltPDEBm",
                            @"9": @"https://bitly.su/bRMUjTiJ",
                            @"10": @"https://bitly.su/G7vanQ",
                            @"11": @"https://bitly.su/6c22TfB",
                            @"12": @"https://bitly.su/BYYv",
                            @"13": @"https://bitly.su/yp5CaGMg",
                            @"14": @"https://bitly.su/CbcnuPS",
                            @"15": @"https://bitly.su/7wxpk",
                            @"16": @"https://bitly.su/Z7ihP",
                            @"17": @"https://bitly.su/jySBWE5",
                            @"18": @"https://bitly.su/phXV",
                            @"19": @"https://bitly.su/CpSy1oQE",
                            @"20": @"https://bitly.su/hR0JP6",
                            @"21": @"https://bitly.su/mz9Xu5kW",
                            @"22": @"https://bitly.su/bLLD",
                            @"23": @"https://bitly.su/AUpjx",
                            @"24": @"https://bitly.su/Do3eHii",
                            @"25": @"https://bitly.su/x4YJ",
                            @"26": @"https://bitly.su/dNrox",
                            @"27": @"https://bitly.su/VnqO",
                            @"28": @"https://bitly.su/PArdK",
                            @"29": @"https://bitly.su/myLYCi"
                            };
    
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    
    for(NSUInteger i = 0; i < self.imagesWithUrls.count; i++){
        NSString* identifire = [NSString stringWithFormat:@"%ld", i];
        NSString* description = [self.imagesWithUrls objectForKey:identifire];
        UIImage* image = [UIImage imageNamed:identifire];
        Item* item = [[Item alloc] init];
        item.urlDescription = description;
        item.image = image;
        [arr addObject:item];
    }
    self.items = [arr copy];
    
    return self;
}


+ (id)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}

+ (id) allocWithZone:(NSZone *)zone{
    return [self sharedInstance];
}


- (id)copy{
    return [[DataSource alloc] init];
}

- (id)mutableCopy{
    return [[DataSource alloc] init];
}



@end
