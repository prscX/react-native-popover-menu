
#import "RNPopoverMenu.h"

@implementation RNPopoverMenu

@synthesize bridge = _bridge;

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()


RCT_EXPORT_METHOD(Show:(nonnull NSNumber *)view props:(nonnull NSDictionary *)props onDone:(RCTResponseSenderBlock)onDone) {
    UIViewController *vc = [UIApplication sharedApplication].delegate.window.rootViewController;

    UIView *target = [self.bridge.uiManager viewForReactTag: view];
    
    NSString *title = [props objectForKey: @"title"];
    NSString *tintColor = [props objectForKey: @"tintColor"];
    NSString *textColor = [props objectForKey: @"textColor"];
    NSString *borderColor = [props objectForKey: @"borderColor"];
    NSNumber *borderWidth = [props objectForKey: @"borderWidth"];
    NSNumber *textMargin = [props objectForKey: @"textMargin"];
    NSNumber *iconMargin = [props objectForKey: @"iconMargin"];
    NSString *selectedRowBackgroundColor = [props objectForKey: @"selectedRowBackgroundColor"];
    NSNumber *roundedArrow = [props objectForKey: @"roundedArrow"];
    NSString *separatorColor = [props objectForKey: @"separatorColor"];
    NSString *shadowColor = [props objectForKey: @"shadowColor"];
    NSNumber *shadowOpacity = [props objectForKey: @"shadowOpacity"];
    NSNumber *shadowRadius = [props objectForKey: @"shadowRadius"];
    NSNumber *shadowOffsetX = [props objectForKey: @"shadowOffsetX"];
    NSNumber *shadowOffsetY = [props objectForKey: @"shadowOffsetY"];

    NSString *textFontName = [props objectForKey: @"textFontName"];
    NSNumber *textFontSize = [props objectForKey: @"textFontSize"];
    
    NSNumber *menuWidth = [props objectForKey: @"menuWidth"];
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
            
            [menuIcons addObject: [RNImageHelper GenerateImage: icon]];
        }
    }
    
    UIColor *tintColr;
    if ([tintColor length] > 0) {
        tintColr = [RNImageHelper ColorFromHexCode: tintColor];
    } else {
        tintColr = [UIColor clearColor];
    }

    UIColor *textColr;
    if ([textColor length] > 0) {
        textColr = [RNImageHelper ColorFromHexCode: textColor];
    }

    UIColor *selectedRowBackgroundColr;
    if ([selectedRowBackgroundColor length] > 0) {
        selectedRowBackgroundColr = [RNImageHelper ColorFromHexCode: selectedRowBackgroundColor];
    }
    
    UIColor *borderColr;
    if ([borderColor length] > 0) {
        borderColr = [RNImageHelper ColorFromHexCode: borderColor];
    } else {
        borderColr = [UIColor clearColor];
    }

    UIColor *separatorColr;
    if ([separatorColor length] > 0) {
        separatorColr = [RNImageHelper ColorFromHexCode: separatorColor];
    } else {
        separatorColr = [UIColor grayColor];
    }

    UIColor *shadowColr;
    if ([shadowColor length] > 0) {
        shadowColr = [RNImageHelper ColorFromHexCode: shadowColor];
    } else {
        shadowColr = [UIColor blackColor];
    }

    UIFont *textFont;

    if ([textFontName length] > 0) {
        if ([textFontSize floatValue] > 0) {
            textFont = [UIFont fontWithName:textFontName size:[textFontSize floatValue]];
        }
        else {
            textFont = [UIFont fontWithName:textFontName size:14.f];
        }
    }
    else {
        if ([textFontSize floatValue] > 0) {
            textFont = [UIFont systemFontOfSize:[textFontSize floatValue]];
        }
        else {
            textFont = [UIFont systemFontOfSize:14.f];
        }
    }

    FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
    configuration.menuRowHeight = [rowHeight longValue];
    configuration.menuWidth = [menuWidth longValue];
    configuration.textColor = textColr;
    configuration.menuTextMargin = [textMargin longValue];
    configuration.menuIconMargin = [iconMargin longValue];
    configuration.selectedCellBackgroundColor = selectedRowBackgroundColr;
    configuration.allowRoundedArrow = [roundedArrow boolValue];
    configuration.textFont = textFont;
    configuration.backgroundColor = tintColr;
    configuration.borderColor = borderColr;
    configuration.borderWidth = [borderWidth longValue];
    configuration.separatorColor = separatorColr;
    configuration.shadowColor = shadowColr;
    configuration.shadowOpacity = [shadowOpacity floatValue];
    configuration.shadowRadius = [shadowRadius longValue];
    configuration.shadowOffsetX = [shadowOffsetX longValue];
    configuration.shadowOffsetY = [shadowOffsetY longValue];

//    configuration.textAlignment = ...
//    configuration.ignoreImageOriginalColor = ...;// set 'ignoreImageOriginalColor' to YES, images color will be same as textColor
//    configuration.allowRoundedArrow = ...// Default is 'NO', if sets to 'YES', the arrow will be drawn with round corner.

    [FTPopOverMenu showForSender:target withMenuArray:menuTitles imageArray:menuIcons configuration: configuration doneBlock:^(NSInteger selectedIndex) {
        onDone(@[[NSNumber numberWithLong: selectedIndex]]);
    } dismissBlock:^{
    }];
}

@end
