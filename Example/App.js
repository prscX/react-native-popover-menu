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


const copy = require('./assets/copy.png')
const paste = require('./assets/paste.png')
const share = require('./assets/share.png')


export default class App extends Component<{}> {
  _onPress = () => {
    RNPopoverMenu.Show(this.ref, {
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
          <TouchableHighlight ref={ref => {
              this.ref = ref;
            }} onPress={() => {
              this._onPress();
            }}>
            <Text style={styles.textStyle}>{"Popover"}</Text>
          </TouchableHighlight>
        </ImageBackground>
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center"
  },
  backgroundImage: {
    flex: 1,
    width: null,
    height: null,
    resizeMode: "cover",
    justifyContent: "center",
    alignItems: "center"
  },
  textStyle: {
    color: '#FFFFFF'
  }
});
