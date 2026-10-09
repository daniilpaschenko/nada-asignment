import 'package:flutter/material.dart';

import '../themes/app_dimens.dart';

// Slides its child in from an offset. Used for route bodies so the content
// flies in while the app bar fades.
class SlideFadeIn extends StatelessWidget {
  const SlideFadeIn({
    required this.child,
    this.beginOffset = const Offset(0.25, 0),
    this.duration = AppDimens.routeTransitionDuration,
    this.curve = Curves.easeOutCubic,
    super.key,
  });

  final Widget child;
  final Offset beginOffset;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween<Offset>(begin: beginOffset, end: Offset.zero),
      duration: duration,
      curve: curve,
      builder: (BuildContext context, Offset value, Widget? child) {
        return FractionalTranslation(translation: value, child: child);
      },
      child: child,
    );
  }
}
