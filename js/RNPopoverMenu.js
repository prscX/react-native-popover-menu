import React, { PureComponent } from "react";
import { findNodeHandle, ViewPropTypes, NativeModules } from "react-native";
import PropTypes from "prop-types";

import RNImageHelper from "react-native-image-helper"

import { Menu } from "./Menu";

const { RNPopoverMenu } = NativeModules;

class Popover extends PureComponent {
  static propTypes = {
    ...ViewPropTypes,

    visible: PropTypes.bool,
    tintColor: PropTypes.string,
    textColor: PropTypes.string,
    textFontName: PropTypes.string,
    textFontSize: PropTypes.number,
    borderWidth: PropTypes.number,
    borderColor: PropTypes.string,
    separatorColor: PropTypes.string,
    menuWidth: PropTypes.number,
    rowHeight: PropTypes.number,
    textMargin: PropTypes.number,
    iconMargin: PropTypes.number,
    selectedRowBackgroundColor: PropTypes.string,
    roundedArrow: PropTypes.bool,
    menus: PropTypes.array,
    onDone: PropTypes.func,
    reference: PropTypes.object,
    theme: PropTypes.string,
    shadowColor: PropTypes.string,
    shadowOpacity: PropTypes.number,
    shadowRadius: PropTypes.number,
    shadowOffsetX: PropTypes.number,
    shadowOffsetY: PropTypes.number
  };

  static defaultProps = {
    visible: false,
    title: "",
    tintColor: "#FFFFFF",
    textColor: "",
    textFontName: "",
    textFontSize: 14,
    borderColor: "",
    separatorColor: "",
    borderWidth: 1,
    selectedRowBackgroundColor: '',
    roundedArrow: true,
    textMargin: 6,
    iconMargin: 6,
    menuWidth: 120,
    rowHeight: 40,
    menus: [],
    theme: "light",
    shadowColor: '#000000',
    shadowOpacity: 0,
    shadowRadius: 5,
    shadowOffsetX: 0,
    shadowOffsetY: 2
  };

  static Show(ref, props) {

    // unified default props handler
    Object.keys(Popover.defaultProps).map((id) => {
      if(props[id] === undefined) props[id] = Popover.defaultProps[id];
    });


    props.menus &&
      props.menus.forEach(menu => {
        menu.menus &&
          menu.menus.forEach(subMenu => {
            if (subMenu.icon && subMenu.icon.props) {
              subMenu.icon = subMenu.icon.props;

              let vectorIcon = RNImageHelper.Resolve(
                subMenu.icon.family,
                subMenu.icon.name
              );
              subMenu.icon = Object.assign({}, subMenu.icon, vectorIcon);
            } else if (subMenu.icon !== undefined) {
              subMenu.icon = {
                name: subMenu.icon,
                family: "",
                glyph: "",
                color: "",
                size: 0
              };
            }
          });

        if (menu.icon && menu.icon.props) {
          menu.icon = menu.icon.props;

          let vectorIcon = RNImageHelper.Resolve(menu.icon.family, menu.icon.name);
          menu.icon = Object.assign({}, menu.icon, vectorIcon);
        } else if (menu.icon !== undefined) {
          menu.icon = {
            name: menu.icon,
            family: "",
            glyph: "",
            color: "",
            size: 0
          };
        }
      });

    RNPopoverMenu.Show(
      findNodeHandle(ref),
      { ...props },
      (index, menuIndex) => {
        props.onDone && props.onDone(index, menuIndex);
      }
    );
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
            icon: item.props.icon
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
        textColor: this.props.textColor,
        textFontName: this.props.textFontName,
        textFontSize: this.props.textFontSize,
        borderWidth: this.props.borderWidth,
        borderColor: this.props.borderColor,
        menuWidth: this.props.menuWidth,
        rowHeight: this.props.rowHeight,
        textMargin: this.props.textMargin,
        iconMargin: this.props.iconMargin,
        roundedArrow: this.props.roundedArrow,
        selectedRowBackgroundColor: this.props.selectedRowBackgroundColor,
        menus: menus,
        theme: this.props.theme,
        separatorColor: this.props.separatorColor,
        shadowColor: this.props.shadowColor,
        shadowOpacity: this.props.shadowOpacity,
        shadowRadius: this.props.shadowRadius,
        shadowOffsetX: this.props.shadowOffsetX,
        shadowOffsetY: this.props.shadowOffsetY,
        onDone: this.props.onDone
      });
    }
  }

  render() {
    return null;
  }
}


Popover.Menu = Menu;

export default Popover;
