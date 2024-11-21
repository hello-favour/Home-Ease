import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

Widget animationFunction(
  index,
  child, {
  Duration? listAnimation,
  Duration? slideDuration,
  Duration? slideDelay,
}) {
  return AnimationConfiguration.staggeredList(
    position: index,
    duration: listAnimation ?? const Duration(milliseconds: 800),
    child: SlideAnimation(
      duration: slideDuration ?? const Duration(milliseconds: 500),
      delay: slideDelay ?? const Duration(milliseconds: 50),
      child: FadeInAnimation(
        child: child,
      ),
    ),
  );
}
