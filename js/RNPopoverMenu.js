import React, { Component } from "react";
import { findNodeHandle, ViewPropTypes, NativeModules } from "react-native";
import PropTypes from "prop-types";
import { is } from "immutable";
import resolveAssetSource from "react-native/Libraries/Image/resolveAssetSource";

import { Menu } from "./Menu";

const { RNPopoverMenu } = NativeModules;

class Popover extends Component {
  static Show(ref, props) {
    if (props.title === undefined) props.title = "";
    if (props.tintColor === undefined) props.tintColor = "";
    if (props.perferedWidth === undefined) props.perferedWidth = 0;
    if (props.rowHeight === undefined) props.rowHeight = 0;
    if (props.menus === undefined) props.menus = [];

    props.menus &&
      props.menus.forEach(menu => {
        menu.menus &&
          menu.menus.forEach(subMenu => {
            if (subMenu.icon && typeof subMenu.icon === "number") {
              subMenu.icon = resolveAssetSource(subMenu.icon);
            }
          });

        if (menu.icon && typeof menu.icon === "number") {
          menu.icon = resolveAssetSource(menu.icon);
        }
      });

    RNPopoverMenu.Show(
      findNodeHandle(ref),
      { ...props },
      (index, menuIndex) => {
        props.onDone && props.onDone(index, menuIndex);
      },
      () => {
        props.onCancel && props.onCancel();
      }
    );
  }

  shouldComponentUpdate(nextProps, nextState) {
    if (is(this.props, nextProps)) {
      return false;
    } else {
      return true;
    }
  }

  componentDidMount() {
    this._show();
  }

  componentDidUpdate() {
    this._show();
  }

  _show() {
    let menus = [];

    React.Children.map(
      this.props.children,
      (mainItem, mainIndex, mainItems) => {
        let subMenus = [];
        React.Children.map(mainItem.props.children, (item, index, items) => {
          subMenus.push({
            label: item.props.label,
            icon:
              item.props.icon === undefined
                ? undefined
                : resolveAssetSource(item.props.icon)
          });
        });

        menus.push({
          label: mainItem.props.label,
          menus: subMenus
        });
      }
    );

    if (this.props.visible) {
      Popover.Show(this.props.reference, {
        tintColor: this.props.tintColor,
        perferedWidth: this.props.perferedWidth,
        rowHeight: this.props.rowHeight,
        menus: menus,
        onDone: this.props.onDone,
        onCancel: this.props.onCancel
      });
    }
  }

  render() {
    return null;
  }
}

Popover.propTypes = {
  ...ViewPropTypes,

  visible: PropTypes.bool,
  tintColor: PropTypes.string,
  perferedWidth: PropTypes.number,
  rowHeight: PropTypes.number,
  menus: PropTypes.array,
  onDone: PropTypes.func,
  onCancel: PropTypes.func,
  reference: PropTypes.object
};

Popover.defaultProps = {
  visible: false
};

Popover.Menu = Menu;

export default Popover;
