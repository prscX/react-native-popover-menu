

<p align="center">
  <img src="https://github.com/zawadz88/MaterialPopupMenu/raw/master/art/components_menus.png" width="300" height="300" />
</p>

<p align="center">
  <a href="https://www.npmjs.com/package/react-native-popover-menu"><img src="http://img.shields.io/npm/v/react-native-popover-menu.svg?style=flat" /></a>
  <a href="https://github.com/prscX/react-native-popover-menu/pulls"><img alt="PRs Welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" /></a>
  <a href="https://github.com/prscX/react-native-popover-menu#License"><img src="https://img.shields.io/npm/l/react-native-popover-menu.svg?style=flat" /></a>
</p>


# React Native: Popover Menu
This library is a ReactNative bridge around native popup/popover menus. It allows you to create simple popup menus.

| **Android: [zawadz88/MaterialPopupMenu](https://github.com/zawadz88/MaterialPopupMenu)**             |
| ----------------- |
| <img src="https://github.com/zawadz88/MaterialPopupMenu/raw/master/art/sample_sections_light.png" width="600" height="300" />                  |


| **iOS: [liufengting/FTPopMenu](https://github.com/liufengting/FTPopMenu)**             |
| ----------------- |
| <img src="https://github.com/liufengting/FTPopMenu/raw/master/ScreenShots/ScreenShots1.png" width="600" height="300" />                  |


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

| [awesome-react-native-native-modules](https://github.com/prscX/awesome-react-native-native-modules)              |
| ----------------- |
| <img src="https://github.com/prscX/awesome-react-native-native-modules/raw/master/assets/hero.png" width="600" height="300" />                  |


| [react-native-spruce](https://github.com/prscX/react-native-spruce)              |
| ----------------- |
| <img src="https://github.com/willowtreeapps/spruce-ios/raw/master/imgs/extensibility-tests.gif" width="600" height="300" />                  |


| [react-native-taptargetview](https://github.com/prscX/react-native-taptargetview) & [react-native-material-showcase-ios](https://github.com/prscX/react-native-material-showcase-ios)              |
| ----------------- |
| <img src="https://github.com/KeepSafe/TapTargetView/raw/master/.github/video.gif" width="600" height="600" />  |


| [react-native-bottom-action-sheet](https://github.com/prscX/react-native-bottom-action-sheet)              |
| ----------------- |
| <img src="https://github.com/rubensousa/BottomSheetBuilder/raw/master/screens/normal_demo.gif" width="600" height="600" />                  |



| [react-native-tooltips](https://github.com/prscX/react-native-tooltips)             |
| ----------------- |
| <img src="https://camo.githubusercontent.com/add1764d27026b81adb117e07a10781c9abbde1b/687474703a2f2f692e696d6775722e636f6d2f4f4e383257526c2e676966" width="600" height="300" />                  |


| [react-native-shine-button](https://github.com/prscX/react-native-shine-button)             |
| ----------------- |
| <img src="https://raw.githubusercontent.com/ChadCSong/ShineButton/master/demo_shine_others.gif" width="600" height="300" />                  |


| [react-native-iconic](https://github.com/prscX/react-native-iconic)             |
| ----------------- |
| <img src="https://camo.githubusercontent.com/b18993cbfe91de8abdc0019dc9a6cd44707eec21/68747470733a2f2f6431337961637572716a676172612e636c6f756466726f6e742e6e65742f75736572732f3338313133332f73637265656e73686f74732f313639363538302f766266706f70666c6174627574746f6e332e676966" width="600" height="300" />                  |


| [react-native-download-button](https://github.com/prscX/react-native-download-button)             |
| ----------------- |
| <img src="https://github.com/fenjuly/ArrowDownloadButton/raw/master/screenshots/arrowdownloadbutton.gif" width="600" height="600" />                  |


| [react-native-siri-wave-view](https://github.com/prscX/react-native-siri-wave-view)             |
| ----------------- |
| <img src="https://cdn.dribbble.com/users/341264/screenshots/2203511/wave.gif" width="600" height="300" />                  |


|  [react-native-material-shadows](https://github.com/prscX/react-native-material-shadows)             |
| ----------------- |
| <img src="https://raw.githubusercontent.com/harjot-oberai/MaterialShadows/master/screens/cover.png" width="600" height="300" />                  |


|  [react-native-gradient-blur-view](https://github.com/prscX/react-native-gradient-blur-view)             |
| ----------------- |
| <img src="https://github.com/prscX/react-native-gradient-blur-view/raw/master/assets/hero.png" width="600" height="300" />                  |


|  [react-native-about-libraries](https://github.com/prscX/react-native-about-libraries)             |
| ----------------- |
| <img src="https://github.com/prscX/react-native-about-libraries/raw/master/hero.png" width="600" height="600" />                  |



|  [vs-essential-plugins](https://github.com/prscX/vs-essential-plugins)             |
| ----------------- |
| <img src="https://pbs.twimg.com/profile_images/922911523328081920/jEKFRPKV_400x400.jpg" width="600" height="300" />                  |


|  [prettier-pack](https://github.com/prscX/prettier-pack)             |
| ----------------- |
| <img src="https://raw.githubusercontent.com/prettier/prettier-logo/master/images/prettier-banner-light.png" width="600" height="300" />                  |
