//
//  FTPopMenu.m
//  FTPopMenu
//
//  Created by liufengting https://github.com/liufengting on 16/6/2.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "FTPopMenu.h"
#import "FTPopTableViewController.h"

@interface FTPopMenu ()

@end

@implementation FTPopMenu

+(instancetype)sharedInstance
{
    static FTPopMenu *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[FTPopMenu alloc] init];
    });
    return shared;
}
/**
 *  From any UIView
 */
+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                          fromView:(UIView *)sender
                         menuArray:(NSArray<NSString *> *)menuArray
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock
{
    [[self sharedInstance]showForViewController:sourceViewController
                              fromBarButtonItem:nil
                                     senderView:sender
                                          title:nil
                                      tintColor:nil
                                  perferedWidth:0
                                      rowHeight:0
                                      menuArray:menuArray
                             menuImageNameArray:nil
                                      doneBlock:doneBlock
                                    cancelBlock:cancelBlock];
}

+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                          fromView:(UIView *)sender
                             title:(NSString *)title
                         menuArray:(NSArray<NSString *> *)menuArray
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock
{
    [[self sharedInstance]showForViewController:sourceViewController
                              fromBarButtonItem:nil
                                     senderView:sender
                                          title:title
                                      tintColor:nil
                                  perferedWidth:0
                                      rowHeight:0
                                      menuArray:menuArray
                             menuImageNameArray:nil
                                      doneBlock:doneBlock
                                    cancelBlock:cancelBlock];
}

+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                          fromView:(UIView *)sender
                             title:(NSString *)title
                         menuArray:(NSArray<NSString *> *)menuArray
                menuImageNameArray:(NSArray<NSString *> *)menuImageNameArray
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock
{
    [[self sharedInstance]showForViewController:sourceViewController
                              fromBarButtonItem:nil
                                     senderView:sender
                                          title:title
                                      tintColor:nil
                                  perferedWidth:0
                                      rowHeight:0
                                      menuArray:menuArray
                             menuImageNameArray:menuImageNameArray
                                      doneBlock:doneBlock
                                    cancelBlock:cancelBlock];
}

+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                          fromView:(UIView *)sender
                             title:(NSString *)title
                         menuArray:(NSArray<NSString *> *)menuArray
                menuImageNameArray:(NSArray<NSString *> *)menuImageNameArray
                     perferedWidth:(CGFloat )perferedWidth
                         rowHeight:(CGFloat )rowHeight
                         tintColor:(UIColor *)tintColor
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock
{
    [[self sharedInstance]showForViewController:sourceViewController
                              fromBarButtonItem:nil
                                     senderView:sender
                                          title:title
                                      tintColor:tintColor
                                  perferedWidth:perferedWidth
                                      rowHeight:rowHeight
                                      menuArray:menuArray
                             menuImageNameArray:menuImageNameArray
                                      doneBlock:doneBlock
                                    cancelBlock:cancelBlock];
}
/**
 *  From any UIBarButtonItem
 */
+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                 fromBarButtonItem:(UIBarButtonItem *)barButtonItem
                         menuArray:(NSArray<NSString *> *)menuArray
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock
{
    [[self sharedInstance]showForViewController:sourceViewController
                              fromBarButtonItem:barButtonItem
                                     senderView:nil
                                          title:nil
                                      tintColor:nil
                                  perferedWidth:0
                                      rowHeight:0
                                      menuArray:menuArray
                             menuImageNameArray:nil
                                      doneBlock:doneBlock
                                    cancelBlock:cancelBlock];
}

+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                 fromBarButtonItem:(UIBarButtonItem *)barButtonItem
                             title:(NSString *)title
                         menuArray:(NSArray<NSString *> *)menuArray
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock
{
    [[self sharedInstance]showForViewController:sourceViewController
                              fromBarButtonItem:barButtonItem
                                     senderView:nil
                                          title:title
                                      tintColor:nil
                                  perferedWidth:0
                                      rowHeight:0
                                      menuArray:menuArray
                             menuImageNameArray:nil
                                      doneBlock:doneBlock
                                    cancelBlock:cancelBlock];
}

+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                 fromBarButtonItem:(UIBarButtonItem *)barButtonItem
                             title:(NSString *)title
                         menuArray:(NSArray<NSString *> *)menuArray
                menuImageNameArray:(NSArray<NSString *> *)menuImageNameArray
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock
{
    [[self sharedInstance]showForViewController:sourceViewController
                              fromBarButtonItem:barButtonItem
                                     senderView:nil
                                          title:title
                                      tintColor:nil
                                  perferedWidth:0
                                      rowHeight:0
                                      menuArray:menuArray
                             menuImageNameArray:menuImageNameArray
                                      doneBlock:doneBlock
                                    cancelBlock:cancelBlock];
}


+(void)showFTMenuForViewController:(UIViewController *)sourceViewController
                 fromBarButtonItem:(UIBarButtonItem *)barButtonItem
                             title:(NSString *)title
                         menuArray:(NSArray<NSString *> *)menuArray
                menuImageNameArray:(NSArray<NSString *> *)menuImageNameArray
                     perferedWidth:(CGFloat )perferedWidth
                         rowHeight:(CGFloat )rowHeight
                         tintColor:(UIColor *)tintColor
                         doneBlock:(void(^)(NSInteger selectedIndex))doneBlock
                       cancelBlock:(void(^)())cancelBlock
{
    [[self sharedInstance]showForViewController:sourceViewController
                              fromBarButtonItem:barButtonItem
                                     senderView:nil
                                          title:title
                                      tintColor:tintColor
                                  perferedWidth:perferedWidth
                                      rowHeight:rowHeight
                                      menuArray:menuArray
                             menuImageNameArray:menuImageNameArray
                                      doneBlock:doneBlock
                                    cancelBlock:cancelBlock];
}






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
                 cancelBlock:(void(^)())cancelBlock
{
    FTPopTableViewController *popMenuViewController = [[FTPopTableViewController alloc] initWithStyle:UITableViewStylePlain];
    popMenuViewController.barButtonItem = barButtonItem;
    popMenuViewController.sourceView = sender;
    popMenuViewController.titleString = title;
    popMenuViewController.rowHeight = rowHeight;
    popMenuViewController.perferdWidth = perferedWidth;
    popMenuViewController.tintColor = tintColor;
    popMenuViewController.menuStringArray = menuArray;
    popMenuViewController.menuImageNameArray = menuImageNameArray;
    popMenuViewController.doneBlock = doneBlock;
    popMenuViewController.cancelBlock = cancelBlock;
    [sourceViewController presentViewController:popMenuViewController
                                       animated:YES
                                     completion:^{
                                         
                                     }];
}


@end
