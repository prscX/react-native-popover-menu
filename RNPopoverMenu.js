import React, { Component } from "react"
import { findNodeHandle, ViewPropTypes, NativeModules } from "react-native"
import PropTypes from "prop-types"

const { RNPopoverMenu } = NativeModules;


class PopoverMenu extends Component {
    static Show (ref, props) {
        RNPopoverMenu.Show(findNodeHandle(ref), {...props})
    }

    componentDidMount () {
        
    }

    render () {
        return null
    }
}


PopoverMenu.propTypes = {
    ...ViewPropTypes,

    title: PropTypes.string,
    tintColor: PropTypes.string,
    perferedWidth: PropTypes.number,
    rowHeight: PropTypes.number,
    menus: PropTypes.object,
    onDone: PropTypes.func,
    onCancel: PropTypes.func
}

PopoverMenu.defaultProps = {
}

export default PopoverMenu

// Props
// - Title
// - TintColor
// - PerferedWidth
// - RowHeight
// - menus: {
//     label, icon
// }
// - onDone
// - onCancel