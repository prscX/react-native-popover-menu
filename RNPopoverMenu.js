import React, { Component } from "react"
import { findNodeHandle, ViewPropTypes, NativeModules } from "react-native"
import PropTypes from "prop-types"

const { RNPopoverMenu } = NativeModules;


class PopoverMenu extends Component {
    static Show (ref, props) {
        if (props.title === undefined) props.title = ''
        if (props.tintColor === undefined) props.tintColor = ''
        if (props.perferedWidth === undefined) props.perferedWidth = 0
        if (props.rowHeight === undefined) props.rowHeight = 0
        if (props.menus === undefined) props.menus = []

        RNPopoverMenu.Show(
            findNodeHandle(ref),
            {...props},
            (selection) => {
                props.onDone && props.onDone(selection)
            },
            () => {
                props.onCancel && props.onCancel()
            }
        )
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
