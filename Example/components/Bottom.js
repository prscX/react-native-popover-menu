import React, { Component } from "react";
import { StyleSheet, View, Button } from "react-native";

class Bottom extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Button
          title={"Bottom Left"}
          ref={ref => {
            this.ref1 = ref
          }}
          onPress={() => {
              this.props.onPress(this.ref1)
          }}
        />
        <Button
          title={"Bottom Right"}
          ref={ref => {
            this.ref2 = ref
          }}
          onPress={() => {
            this.props.onPress(this.ref2)
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

export default Bottom;
