

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


| **iOS: [liufengting/FTPopMenu](https://github.com/liufengting/FTPopMenu)**             |
| ----------------- |
| <img src="https://github.com/liufengting/FTPopMenu/raw/master/ScreenShots/ScreenShots1.png" height="600" />                  |


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
        google()
    }
    ...
}

allprojects {
    repositories {
        mavenLocal()
        jcenter()
        google()
        ...
    }
}
```

> **Note:** This library is supported Android SDK 27 > above


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
| `perferedWidth`       | `number`     |         | Prefered Width of the Popover                                                            |
| `rowHeight`     | `number` |         | Height of the menu row                                                      |



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
- iOS: [liufengting/FTPopMenu](https://github.com/liufengting/FTPopMenu)

## Contribution
Contributions are welcome and are greatly appreciated! Every little bit helps, and credit will always be given.

## License
This library is provided under the Apache 2 License.

RNPopoverMenu @ Pranav Raj Singh Chauhan

