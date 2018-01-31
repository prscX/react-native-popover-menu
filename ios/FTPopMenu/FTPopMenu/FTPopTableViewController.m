//
//  FTPopTableViewController.m
//  FTPopMenu
//
//  Created by liufengting https://github.com/liufengting on 16/5/30.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "FTPopTableViewController.h"

static NSString * const FTPopTableViewControllerCellIdentifier = @"FTPopTableViewControllerCellIdentifier";

@interface FTPopTableViewController () <UIPopoverPresentationControllerDelegate,UIAdaptivePresentationControllerDelegate>

@end

@implementation FTPopTableViewController

-(instancetype)init
{
    self = [self initWithStyle:UITableViewStylePlain];
    return self;
}
-(instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self setUp];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}
-(void)setUp
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.modalPresentationStyle = UIModalPresentationPopover;
    self.popoverPresentationController.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
}

-(CGFloat)rowHeight
{
    if (_rowHeight <= 0) {
        _rowHeight = 40.f;
    }
    return _rowHeight;
}
-(UIColor *)tintColor
{
    if (!_tintColor) {
        _tintColor = [UIColor clearColor];
    }
    return _tintColor;
}

-(UIColor *)textColor
{
    if (!_textColor) {
        _textColor = [UIColor whiteColor];
    }
    return _textColor;
}
-(CGFloat)perferdWidth
{
    if (_perferdWidth <= 0) {
        _perferdWidth = 140.f;
    }
    return _perferdWidth;
}

-(CGFloat)tableviewHeaderViewHeight
{
    if (self.titleString.length) {
        return 30.f;
    }
    return 0.01f;
}

-(CGFloat)contentHeight
{
    return self.tableviewHeaderViewHeight + (self.menuStringArray.count)*self.rowHeight;
}

-(UIPopoverArrowDirection)perferArrowDirection
{
    UIPopoverArrowDirection direction = UIPopoverArrowDirectionUp;
    if (self.sourceView) {
        CGRect sourceFrame = self.sourceView.frame;
        CGFloat centerX = sourceFrame.origin.x + sourceFrame.size.width/2;
        CGFloat centerY = sourceFrame.origin.y + sourceFrame.size.height/2;
        if (centerY > [UIScreen mainScreen].bounds.size.height/2) {
            if (centerX < self.perferdWidth/2 ) {
                direction = UIPopoverArrowDirectionLeft;
            }else if ([UIScreen mainScreen].bounds.size.width - centerX < self.perferdWidth/2){
                direction = UIPopoverArrowDirectionRight;
            }else{
                direction = UIPopoverArrowDirectionDown;
            }
        }
    }
    return direction;
}


#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuStringArray count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [self tableviewHeaderViewHeight];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rowHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.titleString.length) {
        UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, [self tableviewHeaderViewHeight])];
        header.backgroundColor = [UIColor clearColor];
        header.textColor = self.textColor;
        header.font = [UIFont boldSystemFontOfSize:14];
        header.textAlignment = NSTextAlignmentCenter;
        header.text = _titleString;
        return header;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FTPopTableViewControllerCellIdentifier];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.menuStringArray[indexPath.row];
    cell.textLabel.textColor = self.textColor;
    if (self.menuStringArray.count - 1 >= indexPath.row) {
//        cell.imageView.image = [UIImage imageNamed:self.menuImageNameArray[indexPath.row]];

        if ([self.menuImageNameArray[indexPath.row] class] == [UIImage class]) {
            cell.imageView.image = self.menuImageNameArray[indexPath.row];
        } else if ([self.menuImageNameArray[indexPath.row] class] == [NSString class]) {
            cell.imageView.image = self.menuImageNameArray[indexPath.row];
        }
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedIndex = indexPath.row;
    [self dismiss];
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController {
    
    _selectedIndex = -1;
    if (self.barButtonItem) {
        self.popoverPresentationController.barButtonItem = self.barButtonItem;
    } else {
        self.popoverPresentationController.sourceView = self.sourceView;
        self.popoverPresentationController.sourceRect = self.sourceView.bounds;
    }
    self.preferredContentSize = CGSizeMake(self.perferdWidth,[self contentHeight]);

    
    self.popoverPresentationController.permittedArrowDirections = [self perferArrowDirection];
    self.popoverPresentationController.passthroughViews = nil;
    self.popoverPresentationController.popoverLayoutMargins = UIEdgeInsetsMake(40, 0, 0, 0);
    self.popoverPresentationController.backgroundColor = self.tintColor;
  
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
    return YES;
}

- (void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView  * __nonnull * __nonnull)view {
    if (view != NULL) {
        *view = self.sourceView;
    }
    
    if (rect) {
        *rect = self.sourceView.bounds;
    }
}
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{

}


#pragma mark - UIAdaptivePresentationControllerDelegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
        return UIModalPresentationFullScreen;
    } else {
        return UIModalPresentationNone;
    }
}

- (UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style {
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller.presentedViewController];
    return navController;
}


#pragma mark - Actions

- (void)dismiss {
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 if (_selectedIndex >= 0) {
                                     if (self.doneBlock) {
                                         self.doneBlock(_selectedIndex);
                                     }
                                 }else{
                                     if (self.cancelBlock) {
                                         self.cancelBlock();
                                     }
                                 }
                             }];
}



@end
