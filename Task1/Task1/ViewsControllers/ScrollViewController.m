//
//  ScrollViewController.m
//  Task1
//
//  Created by Roma on 6/3/19.
//  Copyright © 2019 Roman. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (assign, nonatomic) CGFloat contentWidth;
@property (assign, nonatomic) CGFloat contentHeigh;
@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Select Item";
    UIBarButtonItem *close = [[UIBarButtonItem alloc] initWithTitle:@"Close"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(closeClicked:)];
    [self.navigationItem setRightBarButtonItem:close];
    self.navigationItem.leftBarButtonItem=nil;
    self.navigationItem.hidesBackButton=YES;
    
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:
     @[
       [self.scrollView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:44],
       [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
       [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor],
       [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor]
       ]];
    
    NSMutableArray<CustomView*> *customViews = [NSMutableArray array];
    
    for (Item* item in [DataSource sharedInstance].items) {
        CustomView* view = [[CustomView alloc] initWithItem:item];
        if (item.image.size.width > self.contentWidth) {
        self.contentWidth = item.image.size.width;
        }
        self.contentHeigh += item.image.size.height + 20.f;
        UILabel* descriptionLable = [[UILabel alloc] init];
        [view addSubview:descriptionLable];
        descriptionLable.text = view.item.urlDescription;
        descriptionLable.textColor = [UIColor redColor];
        descriptionLable.font = [UIFont boldSystemFontOfSize:30.f];
        descriptionLable.textAlignment = NSTextAlignmentCenter;
        descriptionLable.translatesAutoresizingMaskIntoConstraints = NO;
        [descriptionLable.heightAnchor constraintEqualToConstant:30.f].active = YES;
        [descriptionLable.trailingAnchor constraintEqualToAnchor:view.trailingAnchor].active = YES;
        [descriptionLable.leadingAnchor constraintEqualToAnchor:view.leadingAnchor].active = YES;
        [descriptionLable.bottomAnchor constraintEqualToAnchor:view.bottomAnchor].active = YES;
        
        [self.scrollView addSubview:view];
        UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTaped:)];
        [view addGestureRecognizer:tapRecognizer];
        [customViews addObject:view];
    }
    
    for (CustomView* view in customViews) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [view.heightAnchor constraintEqualToConstant:view.item.image.size.height].active = YES;
        [view.widthAnchor constraintEqualToConstant:view.item.image.size.width].active = YES;
        
        if ([customViews indexOfObject:view] == 0) {
            [view.topAnchor constraintEqualToAnchor:view.superview.topAnchor constant: 20.f].active = YES;
            
            [view.bottomAnchor constraintEqualToAnchor:
             [customViews objectAtIndex:[customViews indexOfObject:view] + 1].topAnchor
                                              constant:-20.f].active = YES;
            
        } else if ([customViews indexOfObject:view] == customViews.count - 1) {
            [view.bottomAnchor constraintEqualToAnchor:view.superview.bottomAnchor constant: 20.f].active = YES;
        } else {
            CustomView* next = [customViews objectAtIndex:[customViews indexOfObject:view] + 1];
            [view.bottomAnchor constraintEqualToAnchor: next.topAnchor constant:-20.f].active = YES;
        }
    }
}

- (void)closeClicked:(id)send {
    [self.delegate restoreTitle];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewTaped:(UITapGestureRecognizer *)recognizer {
    [self.delegate restoreTitle];
    CustomView* view = (CustomView*)recognizer.view;
    [self.delegate passViewWithItem:view.item];
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.scrollView.contentSize = CGSizeMake(self.contentWidth, self.contentHeigh);

}



@end
