import React, { PureComponent } from "react";
import { findNodeHandle, ViewPropTypes, NativeModules } from "react-native";
import PropTypes from "prop-types";

import RNVectorHelper from './RNVectorHelper'

import { Menu } from "./Menu";

const { RNPopoverMenu } = NativeModules;

class Popover extends PureComponent {
  static propTypes = {
    ...ViewPropTypes,

    visible: PropTypes.bool,
    tintColor: PropTypes.string,
    textColor: PropTypes.string,
    borderWidth: PropTypes.number,
    borderColor: PropTypes.string,
    menuWidth: PropTypes.number,
    rowHeight: PropTypes.number,
    textMargin: PropTypes.number,
    iconMargin: PropTypes.number,
    selectedRowBackgroundColor: PropTypes.string,
    roundedArrow: PropTypes.bool,
    menus: PropTypes.array,
    onDone: PropTypes.func,
    onCancel: PropTypes.func,
    reference: PropTypes.object,
    theme: PropTypes.string
  };

  static defaultProps = {
    visible: false,
    title: "",
    tintColor: "",
    textColor: "",
    borderColor: "",
    borderWidth: 1,
    selectedRowBackgroundColor: '',
    roundedArrow: true,
    textMargin: 6,
    iconMargin: 6,
    menuWidth: 120,
    rowHeight: 40,
    menus: [],
    theme: "light"
  };

  static Show(ref, props) {
    if (props.title === undefined) props.title = Popover.defaultProps.title;
    if (props.tintColor === undefined)
      props.tintColor = Popover.defaultProps.tintColor;
    if (props.textColor === undefined)
      props.textColor = Popover.defaultProps.textColor;
    if (props.menuWidth === undefined)
      props.menuWidth = Popover.defaultProps.menuWidth;
    if (props.rowHeight === undefined)
      props.rowHeight = Popover.defaultProps.rowHeight;
    if (props.textMargin === undefined)
      props.textMargin = Popover.defaultProps.textMargin;
    if (props.iconMargin === undefined) props.iconMargin = Popover.defaultProps.iconMargin;
    if (props.roundedArrow === undefined) props.roundedArrow = Popover.defaultProps.roundedArrow;
    if (props.selectedRowBackgroundColor === undefined) props.selectedRowBackgroundColor = Popover.defaultProps.selectedRowBackgroundColor;
    if (props.menus === undefined) props.menus = Popover.defaultProps.menus;
    if (props.theme === undefined) props.theme = Popover.defaultProps.theme;
    if (props.borderWidth === undefined) props.borderWidth = Popover.defaultProps.borderWidth;
    if (props.borderColor === undefined) props.borderColor = Popover.defaultProps.borderColor;

    props.menus &&
      props.menus.forEach(menu => {
        menu.menus &&
          menu.menus.forEach(subMenu => {
            if (subMenu.icon && subMenu.icon.props) {
              subMenu.icon = subMenu.icon.props;

              let glyph = RNVectorHelper.Resolve(
                subMenu.icon.family,
                subMenu.icon.name
              );
              subMenu.icon = Object.assign({}, subMenu.icon, {
                glyph: glyph
              });
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

          let glyph = RNVectorHelper.Resolve(menu.icon.family, menu.icon.name);
          menu.icon = Object.assign({}, menu.icon, { glyph: glyph });
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
      },
      () => {
        props.onCancel && props.onCancel();
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
        onDone: this.props.onDone,
        onCancel: this.props.onCancel
      });
    }
  }

  render() {
    return null;
  }
}


Popover.Menu = Menu;

export default Popover;
