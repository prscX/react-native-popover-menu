/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TouchableHighlight,
  ImageBackground
} from "react-native";

import RNPopoverMenu from 'react-native-popover-menu'

import resolveAssetSource from "react-native/Libraries/Image/resolveAssetSource";

import Top from "./components/Top";
import Center from "./components/Center";
import Bottom from "./components/Bottom";


const copyIOS = require('./assets/copy_ios.png')
const copyAndroid = require("./assets/copy_android.png");

const pasteIOS = require('./assets/paste_ios.png')
const pasteAndroid = require("./assets/paste_android.png");

const shareIOS = require('./assets/share_ios.png')
const shareAndroid = require("./assets/share_android.png");

export default class App extends Component<{}> {
  _onPress = (ref) => {

    let meunsIOS = 
        [{
          label: "Editing",
          menus: [
            {
              label: "Copy",
              icon: resolveAssetSource(copyIOS)
            },
            {
              label: "Paste",
              icon: resolveAssetSource(pasteIOS)
            },
            {
              label: "Share",
              icon: resolveAssetSource(shareIOS)
            },
            {
              label: "Share me please"
            }
          ]
        }]

    let menusAndroid = [
        {
          label: "Editing",
          menus: [
            {
              label: "Copy",
              icon: resolveAssetSource(copyAndroid)
            },
            {
              label: "Paste",
              icon: resolveAssetSource(pasteAndroid)
            }
          ]
        },
        {
          label: "Other",
          menus: [
            {
              label: "Share",
              icon: resolveAssetSource(shareAndroid)
            }
          ]
        },
        {
          label: "",
          menus: [
            {
              label: "Share me please"
            }
          ]
        }
      ]

    let menus
    if (Platform.OS === 'android') {
      menus = menusAndroid;
    } else if (Platform.OS === 'ios') {
      menus = meunsIOS;
    }

    RNPopoverMenu.Show(ref, { menus: menus, onDone: selection => {
        console.log("selected item index: " + selection);
      }, onCancel: () => {
        console.log("popover canceled");
      } });
  }

  render() {
        return <ImageBackground source={require("./assets/dark.jpg")} style={styles.backgroundImage}>
            <Top style={styles.top} onPress={ref => {
                this._onPress(ref);
              }} />
            <Center style={styles.center} onPress={ref => {
                this._onPress(ref);
              }} />
            <Bottom style={styles.bottom} onPress={ref => {
                this._onPress(ref);
              }} />
          </ImageBackground>;
  }
}

const styles = StyleSheet.create({
  backgroundImage: {
    flex: 1,
    width: null,
    height: null,
    flexDirection: "column",
    justifyContent: "space-between"
  },
  textStyle: {
    color: "#FFFFFF"
  },
  top: {
    flex: 1
  },
  center: {
    flex: 1
  },
  bottom: {
    flex: 1
  }
});
