
#import "RNPopoverMenu.h"

@implementation RNPopoverMenu

@synthesize bridge = _bridge;

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()


RCT_EXPORT_METHOD(Show:(nonnull NSNumber *)view props:(nonnull NSDictionary *)props) {
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
        [menuTitles addObject: [menu objectForKey: @"label"]];

        NSDictionary *icon = [menu objectForKey: @"icon"];
        
        int width = [[icon objectForKey: @"width"] intValue];
        int height = [[icon objectForKey: @"height"] intValue];
        NSString *imagePath = [icon objectForKey: @"uri"];
        
        NSURL *url = [NSURL URLWithString: imagePath];
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        UIImage *image = [[UIImage alloc] initWithCIImage: [CIImage imageWithData: data]];
        [menuIcons addObject: image];
    }
    
    [FTPopMenu showFTMenuForViewController:vc
           fromView:target
              title: title
          menuArray: menuTitles
 menuImageNameArray: menuIcons
      perferedWidth: 0
          rowHeight: 0
          tintColor:[UIColor clearColor]
          doneBlock:^(NSInteger selectedIndex) {

          } cancelBlock:^{

          }];
    
//    [FTPopMenu showFTMenuForViewController: vc fromView: target menuArray:menus doneBlock:^(NSInteger selectedIndex) {
//
//    } cancelBlock:^{
//
//    }];
}


@end
  
