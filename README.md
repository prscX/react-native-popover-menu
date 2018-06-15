

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

> **Note:** Android SDK 27 > is supported


| **Android: [zawadz88/MaterialPopupMenu](https://github.com/zawadz88/MaterialPopupMenu)**             |
| ----------------- |
| <img src="https://github.com/zawadz88/MaterialPopupMenu/raw/master/art/sample_sections_light.png" height="600" />                  |


| **iOS: [liufengting/FTPopOverMenu](https://github.com/liufengting/FTPopOverMenu)**             |
| ----------------- |
| <img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTPopOverMenu/screenshots.gif" height="600" />                  |


## Getting started

`$ npm install react-native-popover-menu --save`

`$ react-native link react-native-popover-menu`

`$ react-native link react-native-vector-icons`

- **Android**

Please add below snippet into your app build.gradle

```

buildscript {
    repositories {
        jcenter()
        maven { url "https://maven.google.com" }
    }
    ...
}

allprojects {
    repositories {
        mavenLocal()
        jcenter()
        maven { url "https://maven.google.com" }
        ...
    }
}
```

> **Note:** This library is supported Android SDK 27 > above

- **iOS**

  - Run Command: cd `../node_modules/react-native-popover-menu/ios` && `pod install`. If it has error => try `pod repo update` then `pod install`



## Usage

```javascript
import RNPopoverMenu from 'react-native-popover-menu';

import Icon from 'react-native-vector-icons'

```

- React Way

```javascript

let copy = <Icon family={'FontAwesome'} name={'copy'} color={'#000000'} size={30} />
let paste = <Icon family={'FontAwesome'} name={'paste'} color={'#000000'} size={30} />
let share = <Icon family={'FontAwesome'} name={'share'} color={'#000000'} size={30} />

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


let copy = <Icon family={'FontAwesome'} name={'copy'} color={'#000000'} size={30} />
let paste = <Icon family={'FontAwesome'} name={'paste'} color={'#000000'} size={30} />
let share = <Icon family={'FontAwesome'} name={'share'} color={'#000000'} size={30} />

let menus = [
  {
    label: "Editing",
    menus: [
      { label: "Copy", icon: copy },
      { label: "Paste", icon: paste }
    ]
  },
  {
    label: "Other",
    menus: [
      { label: "Share", icon: share }
    ]
  },
  {
    label: "",
    menus: [
      { label: "Share me please" }
    ]
  }
]

RNPopoverMenu.Show(this.ref, {
  title: "",
  menus: menus,
  onDone: selection => { },
  onCancel: () => { }
});

```

> **Note:**
> - We have added `family` prop for `Icon` class, please make sure that you pass the props


## Props

- **Props: Generic**

| Prop              | Type       | Default | Note                                                                                                       |
| ----------------- | ---------- | ------- | ---------------------------------------------------------------------------------------------------------- |
| `title`       | `string`     |         | Title of popover section
| `menus` | `array` |         | Array of Menus                                                   |  |
| `onDone(sectionSelection, menuSelection)`    | `func`     |         | It is called when menu is selected                                        |  |
| `onCancel`      | `func`     |         | It is called when we close the popover


- **Props: Android**

| Prop              | Type       | Default | Note                                                                                                       |
| ----------------- | ---------- | ------- | ---------------------------------------------------------------------------------------------------------- |
| `theme`      | `string`     |   light      | Light & Dark theme support only on Android Platform

- **Props: iOS**


| Prop              | Type       | Default | Note                                                                                                       |
| ----------------- | ---------- | ------- | ---------------------------------------------------------------------------------------------------------- |
| `tintColor`      | `string`     |         | Color of tint
| `menuWidth`       | `number`     |         | Specify menu width of the Popover                                                            |
| `rowHeight`     | `number` |         | Height of the menu row                                                      |
| `rowHeight`     | `number` |         | Height of the menu row                                                      |
| `textMargin`     | `number` |         | Specify text margin from icon                                                      |
| `iconMargin`     | `number` |         | Specify icon margin from border                                                      |
| `selectedRowBackgroundColor`     | `string` |         | Specify selected row background color                                                      |
| `roundedArrow`     | `bool` |         | Specify whether rounded arrow required or not                                                     |
| `textColor`     | `string` |         | Specify text color                                                      |
| `borderColor`     | `string` |         | Specify border color                                                      |
| `borderWidth`     | `number` |         | Specify border width                                                      |
| `separatorColor`  | `string` |         | Specify the menu separator color                                          |
| `shadowColor`  | `string` |         | Specify the shadow color |
| `shadowOpacity`     | `float` |         | Specify shadow opacity between 0 and 1. 0 disables the shadow. |
| `shadowColor`     | `number` |         | Specify border width                                                      |
| `shadowRadius`     | `number` |         | Specify shadow radius                                                  |
| `shadowOffsetX`     | `number` |         | Specify the horizontal shadow offset |
| `shadowOffsetY`     | `number` |         | Specify the vertical shadow offset |


## Icons

- **RN Vector Icons:** It supports [react-native-vector-icons](https://github.com/oblador/react-native-vector-icons) library. Please find below snippet for the usage:

```javascript
	let facebook = <Icon family={'FontAwesome'} name={'facebook'} color={'#000000'} size={30} />

	<RNPopover.Menu label={"Facebook"} icon={facebook} />
```

> **Note:**
> - We have added `family` prop for `Icon` class, please make sure that you pass the props


- **Custom Icons**

> **Note:**
> Since we are using native libraries, we have not found a solution in order to render RN Images in production, therefore please copy all your image assets in platform specific folders:

- Android: Please copy your image assets in app resource drawable folder
- iOS: Please copy your image assets in app resources folder

> Please refer example application for the image usage.


## Credits

- Android: [zawadz88/MaterialPopupMenu](https://github.com/zawadz88/MaterialPopupMenu)
- iOS: [liufengting/FTPopOverMenu](https://github.com/liufengting/FTPopOverMenu)

## Contribution
Contributions are welcome and are greatly appreciated! Every little bit helps, and credit will always be given.

## License
This library is provided under the Apache 2 License.

RNPopoverMenu @ Pranav Raj Singh Chauhan

