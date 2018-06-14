
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
    NSString *textColor = [props objectForKey: @"textColor"];
    NSString *borderColor = [props objectForKey: @"borderColor"];
    NSNumber *borderWidth = [props objectForKey: @"borderWidth"];
    NSNumber *textMargin = [props objectForKey: @"textMargin"];
    NSNumber *iconMargin = [props objectForKey: @"iconMargin"];
    NSString *selectedRowBackgroundColor = [props objectForKey: @"selectedRowBackgroundColor"];
    NSNumber *roundedArrow = [props objectForKey: @"roundedArrow"];
    
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
            
            [menuIcons addObject: [self generateVectorIcon: icon]];
        }
    }
    
    UIColor *tintColr;
    if ([tintColor length] > 0) {
        tintColr = [RNPopoverMenu colorFromHexCode: tintColor];
    } else {
        tintColr = [UIColor clearColor];
    }

    UIColor *textColr;
    if ([textColor length] > 0) {
        textColr = [RNPopoverMenu colorFromHexCode: textColor];
    }

    UIColor *selectedRowBackgroundColr;
    if ([selectedRowBackgroundColor length] > 0) {
        selectedRowBackgroundColr = [RNPopoverMenu colorFromHexCode: selectedRowBackgroundColor];
    }
    
    UIColor *borderColr;
    if ([borderColor length] > 0) {
        borderColr = [RNPopoverMenu colorFromHexCode: borderColor];
    } else {
        borderColr = [UIColor clearColor];
    }
    

    FTPopOverMenuConfiguration *configuration = [FTPopOverMenuConfiguration defaultConfiguration];
    configuration.menuRowHeight = [rowHeight longValue];
    configuration.menuWidth = [menuWidth longValue];
    configuration.textColor = textColr;
    configuration.menuTextMargin = [textMargin longValue];
    configuration.menuIconMargin = [iconMargin longValue];
    configuration.selectedCellBackgroundColor = selectedRowBackgroundColr;
    configuration.allowRoundedArrow = [roundedArrow boolValue];
//    configuration.textFont = ...
    configuration.tintColor = tintColr;
    configuration.borderColor = borderColr;
    configuration.borderWidth = [borderWidth longValue];
//    configuration.textAlignment = ...
//    configuration.ignoreImageOriginalColor = ...;// set 'ignoreImageOriginalColor' to YES, images color will be same as textColor
//    configuration.allowRoundedArrow = ...// Default is 'NO', if sets to 'YES', the arrow will be drawn with round corner.

    [FTPopOverMenu showForSender:target withMenuArray:menuTitles imageArray:menuIcons doneBlock:^(NSInteger selectedIndex) {
        onDone(@[[NSNumber numberWithLong: selectedIndex]]);
    } dismissBlock:^{
        onCancel(@[]);
    }];
}

- (UIImage *) generateVectorIcon: (NSDictionary *) icon {
    NSString *family = [icon objectForKey: @"family"];
    NSString *name = [icon objectForKey: @"name"];
    NSString *glyph = [icon objectForKey: @"glyph"];
    NSNumber *size = [icon objectForKey: @"size"];
    NSString *color = [icon objectForKey: @"color"];

    if (name != nil && [name length] > 0 && [name containsString: @"."]) {
        return [UIImage imageNamed: name];
    }
    
    UIColor *uiColor = [RNPopoverMenu colorFromHexCode: color];
    CGFloat screenScale = RCTScreenScale();
    
    UIFont *font = [UIFont fontWithName:family size:[size floatValue]];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:glyph attributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: uiColor}];
    
    CGSize iconSize = [attributedString size];
    UIGraphicsBeginImageContextWithOptions(iconSize, NO, 0.0);
    [attributedString drawAtPoint:CGPointMake(0, 0)];
    
    UIImage *iconImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return iconImage;
}

- (UIImage *) generateAssetsIcon {
    return nil;
}


+ (UIColor *) colorFromHexCode:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
  
