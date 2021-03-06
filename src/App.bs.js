// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "bs-platform/lib/es6/curry.js";
import * as React from "react";
import * as Reanimated from "./Reanimated.bs.js";
import * as ReactNative from "react-native";
import * as ReanimatedView from "./ReanimatedView.bs.js";
import * as ReactNativeReanimated from "react-native-reanimated";

function animatedStyleUpdateExample(param) {
  var randomWidth = ReactNativeReanimated.default.useSharedValue(10, false);
  var config_easing = Curry._4(Reanimated.easing.bezier, 0.5, 0.01, 0, 1);
  var config = {
    duration: 500,
    easing: config_easing
  };
  var animatedStyle = ReactNativeReanimated.default.useAnimatedStyle(function (param) {
        return {
                width: ReactNativeReanimated.default.withTiming(randomWidth.value, config)
              };
      });
  return React.createElement(ReactNative.View, {
              style: {
                alignItems: "center",
                flex: 1,
                flexDirection: "column",
                justifyContent: "center"
              },
              children: null
            }, React.createElement(ReanimatedView.make, {
                  style: [
                    animatedStyle,
                    {
                      backgroundColor: "black",
                      height: 80,
                      margin: 30,
                      width: 100
                    }
                  ]
                }), React.createElement(ReactNative.Button, {
                  onPress: (function (param) {
                      randomWidth.value = Math.random() * 350;
                      
                    }),
                  title: "toggle"
                }));
}

var $$default = animatedStyleUpdateExample;

export {
  animatedStyleUpdateExample ,
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
