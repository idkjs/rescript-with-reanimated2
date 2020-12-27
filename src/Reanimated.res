type rec easingFunction = (~value: float) => float

module EasingStatic = {
  type t = {
    linear: easingFunction,
    ease: easingFunction,
    quad: easingFunction,
    cubic: easingFunction,
    poly: (~n: float) => easingFunction,
    sin: easingFunction,
    circle: easingFunction,
    exp: easingFunction,
    elastic: (~bounciness: option<float>=?, unit) => easingFunction,
    back: (~s: option<float>=?, unit) => easingFunction,
    bounce: easingFunction,
    bezier: (~x1: float, ~y1: float, ~x2: float, ~y2: float) => easingFunction,
    @bs.as("in")
    in_: (~easing: easingFunction) => easingFunction,
    out: (~easing: easingFunction) => easingFunction,
    inOut: (~easing: easingFunction) => easingFunction,
  }
  @bs.scope("default") @bs.module("react-native-reanimated")
  external easing: t = "Easing"
}
let easing = EasingStatic.easing

module SharedValue = {
  type t<'a> = {mutable value: 'a}
}
module AnimationObject = {
  // phantom type. An animation object can wrap a specific type, we need to
  // parameterize it to make sure the types are sound.
  type t<'a>
  // everything that accepts an animation object also accepts the original value
  // so to have a single type we can just cast to identity
  external make: 'a => t<'a> = "%identity"
}
module AnimatedStyle = {
  type t

  // normal styles are also valid animated styles
  external make: ReactNative.Style.t => t = "%identity"

  @bs.obj
  external style: (~width: AnimationObject.t<ReactNative.Style.size>=?, unit) => t = ""
}

@bs.scope("default") @bs.module("react-native-reanimated")
external createAnimatedComponent: 'a => 'a = "createAnimatedComponent"

@bs.scope("default") @bs.module("react-native-reanimated")
external useSharedValue: ('a, ~shouldRebuild: bool=?) => SharedValue.t<'a> = "useSharedValue"

type animatedStyleArg = unit => AnimatedStyle.t

@bs.scope("default") @bs.module("react-native-reanimated")
external useAnimatedStyle: animatedStyleArg => ReactNative.Style.t = "useAnimatedStyle"

type withTimingConfig = {
  duration: float,
  easing: easingFunction,
}
// type withTiming = (
//   ~toValue: float,
//   ~userConfig: option<withTimingConfig>=?,
//   ~callback: option<(~isFinished: bool) => unit>=?,
//   unit,
// ) => float
type callback = (~isFinished: bool) => unit
@bs.scope("default") @bs.module("react-native-reanimated")
external withTiming: (
  float,
  withTimingConfig,
) => AnimationObject.t<ReactNative.Style.size> = "withTiming"
