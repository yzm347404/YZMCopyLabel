//
//  UICopyLabel.m
//  CopyLabelText
//
//  Created by 杨振民 on 16/5/18.
//  Copyright © 2016年 杨振民. All rights reserved.
//

#import "YZMCopyLabel.h"

@implementation YZMCopyLabel

//绑定事件
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self attachTapHandler];
    }
    return self;
}

//同上
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self attachTapHandler];
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

// 可以响应的方法
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(copy:) || action == @selector(cut:)|| action == @selector(paste:));
}

//UILabel默认是不接收事件的，我们需要自己添加touch事件
-(void)attachTapHandler
{
    self.userInteractionEnabled = YES;  //用户交互的总开关
    UILongPressGestureRecognizer *touch = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:touch];

}

//默认有copy
-(void)handleTap:(UIGestureRecognizer*) recognizer
{
#pragma mark -- 这一块不需要
//    UIMenuItem *copy = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copy:)];
//    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copy, nil]];
//    UIMenuItem *cunItem = [[UIMenuItem alloc] initWithTitle:@"剪切" action:@selector(cut:)];
//    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:cunItem, nil]];
    [self becomeFirstResponder];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];
}

//针对于响应方法的实现
-(void)copy:(id)sender
{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}

- (void)cut:(id)sender
{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
    self.text = nil;
    [self setNeedsDisplay];
}

- (void)paste:(id)sender
{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    self.text = pboard.string;
    [self setNeedsDisplay];
}

@end
