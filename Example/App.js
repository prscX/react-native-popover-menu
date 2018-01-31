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


const facebook = require('./assets/facebook.png')
const google = require('./assets/google.png')
const twitter = require('./assets/twitter.png')
const instagram = require('./assets/instagram.png')

export default class App extends Component<{}> {
  _onPress = () => {
    RNPopoverMenu.Show(this.ref, {
      title: "",
      menus: [
        {
          label: "Facebook",
          icon: resolveAssetSource(facebook)
        },
        {
          label: "Twitter",
          icon: resolveAssetSource(twitter)
        },
        {
          label: "Google",
          icon: resolveAssetSource(google)
        },
        {
          label: "Instagram",
          icon: resolveAssetSource(instagram)
        }
      ],
      onDone: (selection) => {
        console.log('selected item index: ' + selection)
      },
      onCancel: () => {
        console.log('popover canceled')
      }
    });
  }

  render() {
    // return <View contentContainerStyle={styles.container}>
        return <ImageBackground source={require("./assets/dark.jpg")} style={styles.backgroundImage}>
          <TouchableHighlight ref={ref => {
              this.ref = ref;
            }} onPress={() => {
              this._onPress();
            }}>
            <Text>{"Popover"}</Text>
          </TouchableHighlight>
        </ImageBackground>
      // </View>;
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
  }
});
