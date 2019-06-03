//
//  ViewController.m
//  Task1
//
//  Created by Roma on 6/2/19.
//  Copyright © 2019 Roman. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* image = [UIImage imageNamed:@"Image"];
    CustomView* v = [[CustomView alloc] initWithImage:image andDescription:@"test"];
    v.frame = CGRectMake(0, 0, 100, 100);
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:v];
    v.center = self.view.center;
    
}


@end
