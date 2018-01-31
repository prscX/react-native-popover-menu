
# react-native-popover-menu

## Getting started

`$ npm install react-native-popover-menu --save`

### Mostly automatic installation

`$ react-native link react-native-popover-menu`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-popover-menu` and add `RNPopoverMenu.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNPopoverMenu.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNPopoverMenuPackage;` to the imports at the top of the file
  - Add `new RNPopoverMenuPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-popover-menu'
  	project(':react-native-popover-menu').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-popover-menu/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-popover-menu')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNPopoverMenu.sln` in `node_modules/react-native-popover-menu/windows/RNPopoverMenu.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Popover.Menu.RNPopoverMenu;` to the usings at the top of the file
  - Add `new RNPopoverMenuPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNPopoverMenu from 'react-native-popover-menu';

// TODO: What to do with the module?
RNPopoverMenu;
```
  