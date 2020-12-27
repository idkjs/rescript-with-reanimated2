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
  }
@bs.scope("default") @bs.module("react-native-reanimated")

external easing: t = "Easing"
}
let easing = EasingStatic.easing
// module Easing = EasingStatic
// module Value2: {
//   type t;
//   let string: string => t;
//   let number: int => t;
//   let boolean: bool => t;
// } = {
//   @unboxed
//   type rec t =
//     | Any('a): t;
//   let string = (v: string) => Any(v);
//   let number = (v: int) => Any(v);
//   let boolean = (v: bool) => Any(v);
// };
// // module Value2: {
// //   type t;
// //   let string: string => t;
// //   let number: int => t;
// //   let boolean: bool => t;
// // } = {
// //   @unboxed
// //   type rec t =
// //     | Any('a): t;
// //   let string = (v: string) => Any(v);
// //   let number = (v: int) => Any(v);
// //   let boolean = (v: bool) => Any(v);
// // };
// type value = Value2.t;
module Value = {
  type t

  @bs.scope("default") @bs.module("react-native-reanimated") @bs.new
  external make: float => t = "Value"
  external makeFromValue: t => t = "Value"
  external toAnimated: float => t = "%identity"
  external intToAnimated: int => t = "%identity"
  external boolToAnimated: bool => t = "%identity"
}

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
  type transform
  type offset
  @bs.obj
  external offset: (~height: AnimationObject.t<float>, ~width: AnimationObject.t<float>) => offset =
    ""

  // normal styles are also valid animated styles
  external make: ReactNative.Style.t => t = "%identity"

  // tried to iomplement most styles that are "animatable"
  // can be expanded to have more.
  @bs.obj
  external style: (
    ~overlayColor: AnimationObject.t<ReactNative.Color.t>=?,
    ~tintColor: AnimationObject.t<ReactNative.Color.t>=?,
    ~color: AnimationObject.t<ReactNative.Color.t>=?,
    ~fontSize: AnimationObject.t<float>=?,
    ~letterSpacing: AnimationObject.t<float>=?,
    ~lineHeight: AnimationObject.t<float>=?,
    ~textDecorationColor: AnimationObject.t<ReactNative.Color.t>=?,
    ~textShadowColor: AnimationObject.t<ReactNative.Color.t>=?,
    ~textShadowRadius: AnimationObject.t<float>=?,
    ~textShadowOffset: offset=?,
    ~backgroundColor: AnimationObject.t<ReactNative.Color.t>=?,
    ~borderBottomColor: AnimationObject.t<ReactNative.Color.t>=?,
    ~borderBottomEndRadius: AnimationObject.t<float>=?,
    ~borderBottomLeftRadius: AnimationObject.t<float>=?,
    ~borderBottomRightRadius: AnimationObject.t<float>=?,
    ~borderBottomStartRadius: AnimationObject.t<float>=?,
    ~borderBottomWidth: AnimationObject.t<float>=?,
    ~borderColor: AnimationObject.t<ReactNative.Color.t>=?,
    ~borderEndColor: AnimationObject.t<ReactNative.Color.t>=?,
    ~borderEndWidth: AnimationObject.t<float>=?,
    ~borderLeftColor: AnimationObject.t<ReactNative.Color.t>=?,
    ~borderLeftWidth: AnimationObject.t<float>=?,
    ~borderRadius: AnimationObject.t<float>=?,
    ~borderRightColor: AnimationObject.t<ReactNative.Color.t>=?,
    ~borderRightWidth: AnimationObject.t<float>=?,
    ~borderStartColor: AnimationObject.t<ReactNative.Color.t>=?,
    ~borderStartWidth: AnimationObject.t<float>=?,
    ~borderTopColor: AnimationObject.t<ReactNative.Color.t>=?,
    ~borderTopEndRadius: AnimationObject.t<float>=?,
    ~borderTopLeftRadius: AnimationObject.t<float>=?,
    ~borderTopRightRadius: AnimationObject.t<float>=?,
    ~borderTopStartRadius: AnimationObject.t<float>=?,
    ~borderTopWidth: AnimationObject.t<float>=?,
    ~borderWidth: AnimationObject.t<float>=?,
    ~elevation: AnimationObject.t<float>=?,
    ~opacity: AnimationObject.t<float>=?,
    ~transform: array<transform>=?,
    ~shadowColor: AnimationObject.t<ReactNative.Color.t>=?,
    ~shadowOffset: offset=?,
    ~shadowOpacity: AnimationObject.t<float>=?,
    ~shadowRadius: AnimationObject.t<float>=?,
    ~aspectRatio: AnimationObject.t<float>=?,
    ~bottom: AnimationObject.t<ReactNative.Style.size>=?,
    ~_end: AnimationObject.t<ReactNative.Style.size>=?,
    ~flex: AnimationObject.t<float>=?,
    ~flexBasis: AnimationObject.t<ReactNative.Style.margin>=?,
    ~flexGrow: AnimationObject.t<float>=?,
    ~flexShrink: AnimationObject.t<float>=?,
    ~height: AnimationObject.t<ReactNative.Style.size>=?,
    ~left: AnimationObject.t<ReactNative.Style.size>=?,
    ~margin: AnimationObject.t<ReactNative.Style.margin>=?,
    ~marginBottom: AnimationObject.t<ReactNative.Style.margin>=?,
    ~marginEnd: AnimationObject.t<ReactNative.Style.margin>=?,
    ~marginHorizontal: AnimationObject.t<ReactNative.Style.margin>=?,
    ~marginLeft: AnimationObject.t<ReactNative.Style.margin>=?,
    ~marginRight: AnimationObject.t<ReactNative.Style.margin>=?,
    ~marginStart: AnimationObject.t<ReactNative.Style.margin>=?,
    ~marginTop: AnimationObject.t<ReactNative.Style.margin>=?,
    ~marginVertical: AnimationObject.t<ReactNative.Style.margin>=?,
    ~maxHeight: AnimationObject.t<ReactNative.Style.size>=?,
    ~maxWidth: AnimationObject.t<ReactNative.Style.size>=?,
    ~minHeight: AnimationObject.t<ReactNative.Style.size>=?,
    ~minWidth: AnimationObject.t<ReactNative.Style.size>=?,
    ~padding: AnimationObject.t<ReactNative.Style.size>=?,
    ~paddingBottom: AnimationObject.t<ReactNative.Style.size>=?,
    ~paddingEnd: AnimationObject.t<ReactNative.Style.size>=?,
    ~paddingHorizontal: AnimationObject.t<ReactNative.Style.size>=?,
    ~paddingLeft: AnimationObject.t<ReactNative.Style.size>=?,
    ~paddingRight: AnimationObject.t<ReactNative.Style.size>=?,
    ~paddingStart: AnimationObject.t<ReactNative.Style.size>=?,
    ~paddingTop: AnimationObject.t<ReactNative.Style.size>=?,
    ~paddingVertical: AnimationObject.t<ReactNative.Style.size>=?,
    ~right: AnimationObject.t<ReactNative.Style.size>=?,
    ~start: AnimationObject.t<ReactNative.Style.size>=?,
    ~top: AnimationObject.t<ReactNative.Style.size>=?,
    ~width: AnimationObject.t<ReactNative.Style.size>=?,
    unit,
  ) => t = ""
}
@bs.scope("default") @bs.module("react-native-reanimated")
external createAnimatedComponent: 'a => 'a = "createAnimatedComponent"

@bs.scope("default") @bs.module("react-native-reanimated")
external useSharedValue: ('a, ~shouldRebuild: bool=?) => SharedValue.t<'a> = "useSharedValue"

type animatedStyleArg = unit => AnimatedStyle.t
@bs.scope("default") @bs.module("react-native-reanimated")
external useAnimatedStyle: animatedStyleArg => ReactNative.Style.t = "useAnimatedStyle"
@bs.scope("default") @bs.module("react-native-reanimated")
external useAnimatedStyle1: (animatedStyleArg, array<'a>) => ReactNative.Style.t =
  "useAnimatedStyle"

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

@bs.scope("default") @bs.module("react-native-reanimated")
external withTiming: (float,withTimingConfig)=> AnimationObject.t<ReactNative.Style.size> = "withTiming"
