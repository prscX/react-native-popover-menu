//
//  FTPopMenu.h
//  FTPopMenu
//
//  Created by liufengting https://github.com/liufengting on 16/6/2.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTPopMenu : NSObject

/**
 *  From any UIView
 */
+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                          fromView:(UIView *)sender
                         menuArray:(NSArray<NSString *> *)menuArray
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock;

+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                          fromView:(UIView *)sender
                             title:(NSString *)title
                         menuArray:(NSArray<NSString *> *)menuArray
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock;

+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                          fromView:(UIView *)sender
                             title:(NSString *)title
                         menuArray:(NSArray<NSString *> *)menuArray
                menuImageNameArray:(NSArray<NSString *> *)menuImageNameArray
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock;

+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                          fromView:(UIView *)sender
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
+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                 fromBarButtonItem:(UIBarButtonItem *)barButtonItem
                         menuArray:(NSArray<NSString *> *)menuArray
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock;

+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                 fromBarButtonItem:(UIBarButtonItem *)barButtonItem
                             title:(NSString *)title
                         menuArray:(NSArray<NSString *> *)menuArray
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock;

+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                 fromBarButtonItem:(UIBarButtonItem *)barButtonItem
                             title:(NSString *)title
                         menuArray:(NSArray<NSString *> *)menuArray
                menuImageNameArray:(NSArray<NSString *> *)menuImageNameArray
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock;


-(void)showForViewController:(UIViewController *)sourceViewController
           fromBarButtonItem:(UIBarButtonItem *)barButtonItem
                  senderView:(UIView *)sender
                       title:(NSString *)title
                   tintColor:(UIColor *)tintColor
               perferedWidth:(CGFloat )perferedWidth
                   rowHeight:(CGFloat )rowHeight
                   menuArray:(NSArray<NSString *> *)menuArray
          menuImageNameArray:(NSArray<NSString *> *)menuImageNameArray
                   doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                 cancelBlock:(void(^)())cancelBlock;



@end
