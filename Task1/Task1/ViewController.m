//
//  ViewController.m
//  Task1
//
//  Created by Roma on 6/2/19.
//  Copyright © 2019 Roman. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:165.f/256.f green:216.f/256.f blue:151.f/256.f alpha:1];
   
    self.title = @"Drag'n'Drop Strange Cats";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonClicked:)];
    
    [self.navigationItem setRightBarButtonItem:rightItem];
    
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTaped:)];
    
    [self.view addGestureRecognizer:tapRecognizer];
    

//    NSArray<CustomView*> *views = [DataSource.sharedInstance.views copy];
//
//    for (CustomView* view in views) {
//        view.frame = CGRectMake(0, 0, 100, 100);
//        [self.view addSubview:view];
//        view.center = self.view.center;
//        view.delegate = self;
//    }
}

- (void)addButtonClicked:(id) sender {
    ScrollViewController* svc = [[ScrollViewController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}

- (void)viewTaped:(UITapGestureRecognizer *)recognizer {
    self.title = @"Drag'n'Drop Strange Cats";
    }

- (void)setTitleAccordingToView:(nonnull CustomView *)view {
    self.title = view.urlDescription;
}

@end
