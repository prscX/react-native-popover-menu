
#import "RNPopoverMenu.h"

@implementation RNPopoverMenu

@synthesize bridge = _bridge;

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()


RCT_EXPORT_METHOD(Show:(nonnull NSNumber *)view props:(nonnull NSDictionary *)props onDone:(RCTResponseSenderBlock)onDone onCancel:(RCTResponseSenderBlock)onCancel) {
    UIViewController *vc = [UIApplication sharedApplication].delegate.window.rootViewController;

    UIView *target = [self.bridge.uiManager viewForReactTag: view];
    
    NSString *title = [props objectForKey: @"title"];
    NSString *tintColor = [props objectForKey: @"tintColor"];
    
    NSNumber *perferedWidth = [props objectForKey: @"perferedWidth"];
    NSNumber *rowHeight = [props objectForKey: @"rowHeight"];
    
    NSArray *menus = [props objectForKey: @"menus"];

    NSMutableArray *menuTitles = [[NSMutableArray alloc] init];
    NSMutableArray *menuIcons = [[NSMutableArray alloc] init];
    
    for (NSDictionary *menu in menus) {
        NSArray *subMenus = [menu objectForKey: @"menus"];
        title = [menu objectForKey: @"label"];
        
        for (NSDictionary *subMenu in subMenus) {
            [menuTitles addObject: [subMenu objectForKey: @"label"]];
            
            NSDictionary *icon = [subMenu objectForKey: @"icon"];
            if (icon == nil) {
                [menuIcons addObject: [NSNull null]];
                continue;
            }
            
            int width = [[icon objectForKey: @"width"] intValue];
            int height = [[icon objectForKey: @"height"] intValue];
            NSString *imagePath = [icon objectForKey: @"uri"];
            
            NSURL *url = [NSURL URLWithString: imagePath];
            NSData *data = [NSData dataWithContentsOfURL:url];
            
            UIImage *image = [[UIImage alloc] initWithCIImage: [CIImage imageWithData: data]];
            CGSize size = CGSizeMake(width, height);

            UIGraphicsBeginImageContext(size);
            [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
            UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            [menuIcons addObject: destImage];
        }
    }
    
    [FTPopMenu showFTMenuForViewController:vc
           fromView:target
              title: title
          menuArray: menuTitles
 menuImageNameArray: menuIcons
      perferedWidth: [perferedWidth longValue]
          rowHeight: [rowHeight longValue]
          tintColor:[UIColor clearColor]
          doneBlock:^(NSInteger selectedIndex) {
              onDone(@[[NSNumber numberWithLong: selectedIndex]]);
          } cancelBlock:^() {
              onCancel(@[]);
          }];
    
//    [FTPopMenu showFTMenuForViewController: vc fromView: target menuArray:menus doneBlock:^(NSInteger selectedIndex) {
//
//    } cancelBlock:^{
//
//    }];
}


@end
  
