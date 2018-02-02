import React, { Component } from "react";
import { StyleSheet, View, Button } from "react-native";

class Center extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Button
          title={"Center Left"}
          ref={ref => {
            this.ref1 = ref
          }}
          onPress={() => {
            this.props.onPress(this.ref1)
          }}
        />
        <Button
          title={"Center Center"}
          ref={ref => {
            this.ref2 = ref
          }}
          onPress={() => {
            this.props.onPress(this.ref2)
          }}
        />
        <Button
          title={"Center Right"}
          ref={ref => {
            this.ref3 = ref
          }}
          onPress={() => {
            this.props.onPress(this.ref3)
          }}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flexDirection: "row",
    justifyContent: "space-between"
  }
});

export default Center;
