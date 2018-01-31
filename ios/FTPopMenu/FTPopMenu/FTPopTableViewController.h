//
//  FTPopTableViewController.h
//  FTPopMenu
//
//  Created by liufengting https://github.com/liufengting on 16/5/30.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FTPopMenuDoneBlock)(NSInteger selectedIndex);
typedef void(^FTPopMenuCancelBlock)();

@interface FTPopTableViewController : UITableViewController

@property (nonatomic, assign)UIBarButtonItem *barButtonItem;
@property (nonatomic, assign)UIView *sourceView;
@property (nonatomic, assign)CGFloat perferdWidth;
@property (nonatomic, assign)CGFloat rowHeight;
@property (nonatomic, strong)UIColor* tintColor;
@property (nonatomic, strong)UIColor* textColor;
@property (nonatomic, strong)NSString* titleString;
@property (nonatomic, strong)NSArray<NSString *>* menuStringArray;
@property (nonatomic, strong)NSArray<NSString *>* menuImageNameArray;

@property (nonatomic, assign)NSInteger selectedIndex;
@property (nonatomic, strong)FTPopMenuDoneBlock doneBlock;
@property (nonatomic, strong)FTPopMenuCancelBlock cancelBlock;

@end
