open ReactNative


open Reanimated
export animatedStyleUpdateExample = () => {
  let randomWidth = useSharedValue(10., ~shouldRebuild=false)

  let config:withTimingConfig = {
    duration: 500.,
    easing: easing.bezier(~x1=0.5, ~y1=0.01, ~x2=0., ~y2=1.),
  }

  let animatedStyle = useAnimatedStyle(() => {
    open AnimatedStyle
    style(~width=withTiming(randomWidth.value, config), ())
  })

  <View
    style={Style.style(
      ~flex=1.,
      ~alignItems=#center,
      ~justifyContent=#center,
      ~flexDirection=#column,
      (),
    )}>
    <ReanimatedView
      style={Style.array([
        animatedStyle,
        Style.style(
          ~width=Style.dp(100.),
          ~height=Style.dp(80.),
          ~backgroundColor="black",
          ~margin=30.->Style.dp,
          (),
        ),
      ])}
    />
    <Button
      title="toggle"
      onPress={_ => {
        randomWidth.value = Js.Math.random() *. 350.
      }}
    />
  </View>
}

let default = animatedStyleUpdateExample
