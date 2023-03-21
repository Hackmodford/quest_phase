import 'package:flutter/animation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Animation<int> useAnimatedInt(int value, Duration duration) {
  final animationController = useAnimationController(duration: duration);
  return useValueChanged(value, (oldValue, oldResult) {
    final previousValue = oldResult?.value ?? oldValue;
    animationController.forward(from: 0);
    return IntTween(
      begin: previousValue,
      end: value,
    ).animate(animationController);
  }) ?? AlwaysStoppedAnimation(value);
}
