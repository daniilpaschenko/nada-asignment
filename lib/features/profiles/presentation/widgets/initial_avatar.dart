import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_dimens.dart';

class InitialAvatar extends StatelessWidget {
  const InitialAvatar({required this.name, super.key});

  final String? name;

  @override
  Widget build(BuildContext context) {
    final String initial =
        (name == null || name!.isEmpty) ? '?' : name!.trim()[0].toUpperCase();
    final Color color =
        AppColors.avatarPalette[(name?.hashCode ?? 0).abs() %
            AppColors.avatarPalette.length];

    return CircleAvatar(
      radius: AppDimens.avatarRadius,
      backgroundColor: color,
      child: Text(
        initial,
        style: const TextStyle(
          color: AppColors.onAvatar,
          fontSize: AppDimens.fontLg,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}