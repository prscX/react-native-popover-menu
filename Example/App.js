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


const copy = require('./assets/copy.png')
const paste = require('./assets/paste.png')
const share = require('./assets/share.png')

export default class App extends Component<{}> {
  _onPress = (ref) => {
    RNPopoverMenu.Show(ref, {
      title: "",
      menus: [
        {
          label: "Editing",
          menus: [
            {
              label: "Copy",
              icon: resolveAssetSource(copy)
            },
            {
              label: "Paste",
              icon: resolveAssetSource(paste)
            }
          ]
        },
        {
          label: "Other",
          menus: [
            {
              label: "Share",
              icon: resolveAssetSource(share)
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
      ],
      onDone: selection => {
        console.log("selected item index: " + selection);
      },
      onCancel: () => {
        console.log("popover canceled");
      }
    });
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
