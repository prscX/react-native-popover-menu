

<center>
	<img src="https://github.com/zawadz88/MaterialPopupMenu/raw/master/art/components_menus.png" />
</center>

# React Native: Popover Menu
This library is a ReactNative bridge around native popup/popover menus. It allows you to create simple popup menus.

- **Android: [zawadz88/MaterialPopupMenu](https://github.com/zawadz88/MaterialPopupMenu)**

![](https://github.com/zawadz88/MaterialPopupMenu/raw/master/art/sample_sections_light.png)

- **iOS: [liufengting/FTPopMenu](https://github.com/liufengting/FTPopMenu)**

![](https://github.com/liufengting/FTPopMenu/raw/master/ScreenShots/ScreenShots1.png)

Before we dive into on how to use this library. We would like to thank all the contributor of [zawadz88/MaterialPopupMenu](https://github.com/zawadz88/MaterialPopupMenu) & [liufengting/FTPopMenu](https://github.com/liufengting/FTPopMenu) libraries for providing such a awesome nice, cool library

## Getting started

`$ npm install react-native-popover-menu --save`

`$ react-native link react-native-popover-menu`



## Usage
```javascript
import RNPopoverMenu from 'react-native-popover-menu';

```

- React Way


- API Way

```javascript
    RNPopoverMenu.Show(this.ref, {
      title: "",
      menus: [ ],
      onDone: selection => { },
      onCancel: () => { }
    });
```



## Credits
- Android: [zawadz88/MaterialPopupMenu](https://github.com/zawadz88/MaterialPopupMenu)
- iOS: [liufengting/FTPopMenu](https://github.com/liufengting/FTPopMenu)

## Contribution
Contributions are welcome and are greatly appreciated! Every little bit helps, and credit will always be given.

