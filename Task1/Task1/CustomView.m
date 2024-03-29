//
//  CustomView.m
//  Task1
//
//  Created by Roma on 6/2/19.
//  Copyright © 2019 Roman. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

@property (assign, nonatomic) CGFloat oldX;
@property (assign, nonatomic) CGFloat oldY;
@property (assign, nonatomic) CGPoint oldCenter;

@end

@implementation CustomView

- (instancetype)initWithItem:(Item*)item{
    self = [super init];
    if (self) {
        _item = item;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect{
    [self.item.image drawInRect:rect];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    [self.delegate setTitleAccordingToView:self.item];
    CGPoint touchInSuper = [touches.anyObject locationInView:self.superview];
    self.oldX = touchInSuper.x;
    self.oldY = touchInSuper.y;
    self.oldCenter = self.center;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super  touchesMoved:touches withEvent:event];
    CGPoint touchInSuper = [touches.anyObject locationInView:self.superview];
    CGFloat difX = self.oldX - touchInSuper.x;
    CGFloat difY = self.oldY- touchInSuper.y;
    self.center = CGPointMake(self.oldCenter.x - difX, self.oldCenter.y - difY);
}



@end
