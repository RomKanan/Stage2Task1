//
//  ViewController.m
//  Task1
//
//  Created by Roma on 6/2/19.
//  Copyright © 2019 Roman. All rights reserved.
//

#import "ViewController.h"



@interface ViewController () <UIGestureRecognizerDelegate>
@property (strong, nonatomic) NSMutableArray<CustomView*> *addedViews;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:165.f/256.f green:216.f/256.f blue:151.f/256.f alpha:1];
    self.addedViews = [NSMutableArray array];
   
    self.title = @"Drag'n'Drop Strange Cats";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonClicked:)];
    
    [self.navigationItem setRightBarButtonItem:rightItem];
    
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTaped:)];
    tapRecognizer.delegate = self;
    [self.view addGestureRecognizer:tapRecognizer];
}

- (void)addButtonClicked:(id) sender {
    ScrollViewController* svc = [[ScrollViewController alloc] init];
    svc.delegate = self;
    [self.navigationController pushViewController:svc animated:YES];
}

- (void)viewTaped:(UITapGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        self.title = @"Drag'n'Drop Strange Cats";
    }
}

- (void)setTitleAccordingToView:(nonnull Item *)item {
    self.title = item.urlDescription;
}

-(void)passViewWithItem:(Item*)item {
    BOOL new = YES;
    for (CustomView* view in self.addedViews) {
        if ([view.item.urlDescription isEqual:item.urlDescription]) {
            [self.view bringSubviewToFront:view];
            view.center = self.view.center;
            new = NO;
        }
    }
    if (new) {
        CustomView* view = [[CustomView alloc] initWithItem:item];
        view.delegate = self;
        view.frame = CGRectMake(0, 0, 100, 100);
        view.center = self.view.center;
        [self.view addSubview:view];
        [self.addedViews addObject:view];
    }
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if([touch.view isKindOfClass:[CustomView class]]){
        return NO;
    }
    
    return YES;
}

-(void)restoreTitle{
    self.title = @"Drag'n'Drop Strange Cats";
}


@end
