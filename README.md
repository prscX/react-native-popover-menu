

<p align="center">
  <img src="https://github.com/zawadz88/MaterialPopupMenu/raw/master/art/components_menus.png" width="256" />
</p>

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

```javascript
<RNPopover visible={this.state.visible} reference={this.ref}>
  <RNPopover.Menu label={"Editing"}>
    <RNPopover.Menu label={"Copy"} icon={copy} />
    <RNPopover.Menu label={"Paste"} icon={paste} />
  </RNPopover.Menu>
  <RNPopover.Menu >
    <RNPopover.Menu label={"Share"} icon={share} />
  </RNPopover.Menu>
</RNPopover>;
```

- API Way

```javascript
    RNPopoverMenu.Show(this.ref, {
      title: "",
      menus: [ ],
      onDone: selection => { },
      onCancel: () => { }
    });
```


## Props


| Prop              | Type       | Default | Note                                                                                                       |
| ----------------- | ---------- | ------- | ---------------------------------------------------------------------------------------------------------- |
| `title`       | `string`     |         | Title of popove section
| `tintColor: iOS`      | `string`     |         | Color of tint
| `perferedWidth: iOS`       | `number`     |         | Perfered Width of the Popover                                                            |
| `rowHeight: iOS`     | `number` |         | Height of the menu row                                                      |
| `menus` | `array` |         | Array of Menus                                                   |  |
| `onDone(sectionSelection, menuSelection)`    | `func`     |         | It is called when menu is selected                                        |  |
| `onCancel`      | `func`     |         | It is called when we close the popover



## Credits

- Android: [zawadz88/MaterialPopupMenu](https://github.com/zawadz88/MaterialPopupMenu)
- iOS: [liufengting/FTPopMenu](https://github.com/liufengting/FTPopMenu)

## Contribution
Contributions are welcome and are greatly appreciated! Every little bit helps, and credit will always be given.

## License
This library is provided under the MIT License.

RNBottomActionSheet @ Pranav Raj Singh Chauhan



## Other Contributions
- React Native - Spruce: [react-native-spruce](https://github.com/prscX/react-native-spruce)

![Screenshots](https://github.com/willowtreeapps/spruce-ios/raw/master/imgs/extensibility-tests.gif)

- React Native - App Tour Library: [react-native-taptargetview](https://github.com/prscX/react-native-taptargetview) & [react-native-material-showcase-ios](https://github.com/prscX/react-native-material-showcase-ios)

![Screenshots](https://github.com/KeepSafe/TapTargetView/raw/master/.github/video.gif)
![Screenshots](https://github.com/aromajoin/material-showcase-ios/raw/master/art/material-showcase.gif?raw=true)

- React Native - Bottom Action Sheet: [react-native-bottom-action-sheet](https://github.com/prscX/react-native-bottom-action-sheet)

![](https://github.com/rubensousa/BottomSheetBuilder/raw/master/screens/normal_demo.gif)


- React Native - Tooltips: [react-native-tooltips](https://github.com/prscX/react-native-tooltips)

![](https://camo.githubusercontent.com/add1764d27026b81adb117e07a10781c9abbde1b/687474703a2f2f692e696d6775722e636f6d2f4f4e383257526c2e676966)

- React Native - Shine Button: [react-native-shine-button](https://github.com/prscX/react-native-shine-button)

![Screenshots](https://raw.githubusercontent.com/ChadCSong/ShineButton/master/demo_shine_others.gif)

- React Native Iconic: [react-native-iconic](https://github.com/prscX/react-native-iconic)
![Screenshots](https://camo.githubusercontent.com/b18993cbfe91de8abdc0019dc9a6cd44707eec21/68747470733a2f2f6431337961637572716a676172612e636c6f756466726f6e742e6e65742f75736572732f3338313133332f73637265656e73686f74732f313639363538302f766266706f70666c6174627574746f6e332e676966)

- React Native Download Button: [react-native-download-button](https://github.com/prscX/react-native-download-button)

![](https://github.com/fenjuly/ArrowDownloadButton/raw/master/screenshots/arrowdownloadbutton.gif)

- React Native Siri Wave View: [react-native-siri-wave-view](https://github.com/prscX/react-native-siri-wave-view)

![](https://cdn.dribbble.com/users/341264/screenshots/2203511/wave.gif)

- React Native Material Shadows: [react-native-material-shadows](https://github.com/prscX/react-native-material-shadows)

![](
https://raw.githubusercontent.com/harjot-oberai/MaterialShadows/master/screens/cover.png
)

- React Native Gradient Blur View: [react-native-gradient-blur-view](https://github.com/prscX/react-native-gradient-blur-view)

![](
https://github.com/prscX/react-native-gradient-blur-view/raw/master/assets/hero.png
)

- React Native About Libraries: [react-native-about-libraries](https://github.com/prscX/react-native-about-libraries)

![](
https://github.com/prscX/react-native-about-libraries/raw/master/hero.png
)

- Visual Code Essential Plugins: [vs-essential-plugins](https://github.com/prscX/vs-essential-plugins)

![Screenshots](https://pbs.twimg.com/profile_images/922911523328081920/jEKFRPKV_400x400.jpg)

- Prettier Pack: [prettier-pack](https://github.com/prscX/prettier-pack)

![Screenshots](https://raw.githubusercontent.com/prettier/prettier-logo/master/images/prettier-banner-light.png)

