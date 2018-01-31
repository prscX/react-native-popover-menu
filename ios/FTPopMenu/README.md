# FTPopMenu

FTPopMenu. It's wrapped from UIPopoverViewController. Here are screenshots of it. You are welcome to download this repo, and change the code all you want.


<img src="/ScreenShots/ScreenShots1.png" width="400"/>

<img src="/ScreenShots/ScreenShots2.png" width="400"/>

<img src="/ScreenShots/ScreenShots3.png" width="400"/>

<img src="/ScreenShots/ScreenShots4.png" width="600"/>

<img src="/ScreenShots/ScreenShots5.png" width="600"/>

<img src="/ScreenShots/ScreenShots6.png" width="600"/>

# Usage
 
It provides two types of API to show menus.

## Show from UIBarButtonItem
 
 * Extension in `UIViewController+FTPopMenu.h`

```
// Extension normal
- (IBAction)barBottonItemNormalAction:(UIBarButtonItem *)sender {

    [self showFTMenuFromBarButtonItem:sender
                            menuArray:[self menuStringArray]
                            doneBlock:^(NSInteger selectedIndex) {
                                
                            } cancelBlock:^{
                                
                            }];
}
// Extension custom
- (IBAction)barBottonItemCustomAction:(UIBarButtonItem *)sender {

    [self showFTMenuFromBarButtonItem:sender
                                title:@""
                            menuArray:[self menuStringArray]
                   menuImageNameArray:[self menuImageStringArray]
                        perferedWidth:200
                            rowHeight:60
                            tintColor:[UIColor blackColor]
                            doneBlock:^(NSInteger selectedIndex) {
                                
                            }cancelBlock:^{
                              
                          	}];
}                         
```

 * Class Methods in `FTPopMenu.h`
 
```
// Class Method normal
- (IBAction)barBottonItemNormalAction:(UIBarButtonItem *)sender {

    [FTPopMenu showFTMenuForViewController:self
                         fromBarButtonItem:sender
                                 menuArray:[self menuStringArray]
                                 doneBlock:^(NSInteger selectedIndex) {
                                     
                                 } cancelBlock:^{
                                     
                                 }];
}

// Class Method custom
- (IBAction)barBottonItemCustomAction:(UIBarButtonItem *)sender {

    [FTPopMenu showFTMenuForViewController:self
                         fromBarButtonItem:sender
                                     title:@"I am title"
                                 menuArray:[self menuStringArray]
                        menuImageNameArray:[self menuStringArray]
                             preferedWidth:200
                                 rowHeight:50
                                 tintColor:[UIColor blackColor]
                                 doneBlock:^(NSInteger selectedIndex) {
                                     
                                 }cancelBlock:^{
                                   
                               	}];
}

```

## Show from UIView

 * Extension in `UIViewController+FTPopMenu.h`

```
// Extension normal
- (IBAction)buttonAction:(UIButton *)sender
{
    [self showFTMenuFromView:sender
                   menuArray:[self menuStringArray]
                   doneBlock:^(NSInteger selectedIndex) {
                       
                   }cancelBlock:^{
                       
                   }];
}
// Extension custom
- (IBAction)buttonAction:(UIButton *)sender
{
   [self showFTMenuFromView:sender
                      title:@""
                  menuArray:[self menuStringArray]
         menuImageNameArray:[self menuImageStringArray]
              perferedWidth:200
                  rowHeight:50
                  tintColor:[UIColor blackColor]
                  doneBlock:^(NSInteger selectedIndex) {
                      
                  }cancelBlock:^{
                      
                  }];
}                   
```

 * Class Methods in `FTPopMenu.h`
 
```
// Class Method normal
- (IBAction)buttonAction:(UIButton *)sender
{
    [FTPopMenu showFTMenuForViewController:self
                                  fromView:sender
                                 menuArray:[self menuStringArray]
                                 doneBlock:^(NSInteger selectedIndex) {
                                     
                                 } cancelBlock:^{
                                     
                                 }];

}

// Class Method custom
- (IBAction)buttonAction:(UIButton *)sender
{
   [FTPopMenu showFTMenuForViewController:self
                                 fromView:sender
                                    title:@"I am Title"
                                menuArray:[self menuStringArray]
                       menuImageNameArray:[self menuStringArray]
                            preferedWidth:200
                                rowHeight:60
                                tintColor:[UIColor blackColor]
                                doneBlock:^(NSInteger selectedIndex) {
                                    
                                }cancelBlock:^{
                                  
                              	}];
}
```




## Maybe you want use [FTPopOverMenu](https://github.com/liufengting/FTPopOverMenu) instead of `FTPopMenu`. It has more simple APIs.

<img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTPopOverMenu/screenshots.gif" width="600"/>


# License

`FTPopMenu` is available under the MIT license. See the LICENSE file for more info. 

