import React, { Component } from "react"
import { ViewPropTypes } from "react-native"

import PropTypes from "prop-types"


class Menu extends Component {

}

Menu.propTypes = {
  ...ViewPropTypes,

  label: PropTypes.string,
  icon: PropTypes.oneOfType([PropTypes.number, PropTypes.string, PropTypes.object])
};

Menu.defaultProps = {
};

export { Menu  };
