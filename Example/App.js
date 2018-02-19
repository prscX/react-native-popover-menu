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

import RNPopover from 'react-native-popover-menu'

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

let copy
let paste
let share

if (Platform.OS === 'android') {
  copy = copyAndroid
  paste = pasteAndroid
  share = shareAndroid
} else if (Platform.OS === 'ios') {
  copy = copyIOS
  paste = pasteIOS
  share = shareIOS
}


export default class App extends Component<{}> {
  constructor (props) {
    super(props)

    this.state = {
      visible: false
    }
  }

  _onPress = (ref) => {

    let meunsIOS = 
        [{
          label: "Editing",
          menus: [
            {
              label: "Copy",
              icon: copy
            },
            {
              label: "Paste",
              icon: paste
            },
            {
              label: "Share",
              icon: share
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
              icon: copy
            },
            {
              label: "Paste",
              icon: paste
            }
          ]
        },
        {
          label: "Other",
          menus: [
            {
              label: "Share",
              icon: share
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

    RNPopover.Show(ref, { menus: menus, onDone: selection => {
        console.log("selected item index: " + selection);
      }, onCancel: () => {
        console.log("popover canceled");
      } });
  }

  _show (ref) {
    this.ref = ref

    this.setState({
      visible: true
    })
  }

  render() {
      let popover;
      if (Platform.OS === 'android') {
          popover = <RNPopover visible={this.state.visible} reference={this.ref} onDone={(mainMenuSelection, subMenuSelection) => {
                console.log("selection: " + mainMenuSelection + ', ' + subMenuSelection);
              }}>
              <RNPopover.Menu label={"Editing"}>
                <RNPopover.Menu label={"Copy"} icon={copy} />
                <RNPopover.Menu label={"Paste"} icon={paste} />
              </RNPopover.Menu>
              <RNPopover.Menu>
                <RNPopover.Menu label={"Share"} icon={share} />
              </RNPopover.Menu>
            </RNPopover>;
      } else if (Platform.OS === 'ios') {
          popover = <RNPopover visible={this.state.visible} reference={this.ref} onDone={(selection) => {
            console.log("selection: " + selection);
          }} >
              <RNPopover.Menu label={"Editing"}>
                <RNPopover.Menu label={"Copy"} icon={copy} />
                <RNPopover.Menu label={"Paste"} icon={paste} />
                <RNPopover.Menu label={"Share"} icon={share} />
              </RNPopover.Menu>
            </RNPopover>;        
      }


      return <ImageBackground source={require("./assets/dark.jpg")} style={styles.backgroundImage}>
            <Top style={styles.top} onPress={ref => {
                this._onPress(ref);
                // this._show(ref);
              }} />
            <Center style={styles.center} onPress={ref => {
                this._onPress(ref);
                // this._show(ref);
              }} />
            <Bottom style={styles.bottom} onPress={ref => {
                this._onPress(ref);
                // this._show(ref);
              }} />
              {popover}
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
