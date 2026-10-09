import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

// Full-viewport background used behind screen content.
// Paints a subtle vertical gradient that ties the screens to the app bar
// without competing with it. Wraps the body of every screen.
class AppBackground extends StatelessWidget {
  const AppBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              AppColors.backgroundGradientStart,
              AppColors.backgroundGradientEnd,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
