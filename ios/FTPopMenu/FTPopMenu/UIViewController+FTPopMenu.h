//
//  UIViewController+FTPopMenu.h
//  FTPopMenu
//
//  Created by liufengting https://github.com/liufengting on 16/6/2.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (FTPopMenu)


/**
 *  From any UIView
 */
-(void)showFTMenuFromView:(UIView *)sender
                menuArray:(NSArray<NSString *> *)menuArray
                     doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                   cancelBlock:(void(^)())cancelBlock;

-(void)showFTMenuFromView:(UIView *)sender
                    title:(NSString *)title
                menuArray:(NSArray<NSString *> *)menuArray
                     doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                   cancelBlock:(void(^)())cancelBlock;

-(void)showFTMenuFromView:(UIView *)sender
                    title:(NSString *)title
                menuArray:(NSArray<NSString *> *)menuArray
       menuImageNameArray:(NSArray<NSString *> *)menuImageNameArray
                     doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                   cancelBlock:(void(^)())cancelBlock;

-(void)showFTMenuFromView:(UIView *)sender
                    title:(NSString *)title
                menuArray:(NSArray<NSString *> *)menuArray
       menuImageNameArray:(NSArray<NSString *> *)menuImageNameArray
            perferedWidth:(CGFloat )perferedWidth
                rowHeight:(CGFloat )rowHeight
                tintColor:(UIColor *)tintColor
                     doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                   cancelBlock:(void(^)())cancelBlock;
/**
 *  From any UIBarButtonItem
 */
-(void)showFTMenuFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                         menuArray:(NSArray<NSString *> *)menuArray
                              doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                            cancelBlock:(void(^)())cancelBlock;

-(void)showFTMenuFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                             title:(NSString *)title
                         menuArray:(NSArray<NSString *> *)menuArray
                              doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                            cancelBlock:(void(^)())cancelBlock;

-(void)showFTMenuFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                             title:(NSString *)title
                         menuArray:(NSArray<NSString *> *)menuArray
                menuImageNameArray:(NSArray<NSString *> *)menuImageNameArray
                              doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                            cancelBlock:(void(^)())cancelBlock;


-(void)showFTMenuFromBarButtonItem:(UIBarButtonItem *)barButtonItem
                             title:(NSString *)title
                         menuArray:(NSArray<NSString *> *)menuArray
                menuImageNameArray:(NSArray<NSString *> *)menuImageNameArray
                     perferedWidth:(CGFloat )perferedWidth
                         rowHeight:(CGFloat )rowHeight
                         tintColor:(UIColor *)tintColor
                              doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                            cancelBlock:(void(^)())cancelBlock;

@end
