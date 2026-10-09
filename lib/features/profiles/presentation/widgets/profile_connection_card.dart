import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_dimens.dart';

class ProfileConnectionCard extends StatelessWidget {
  const ProfileConnectionCard({required this.connectedThrough, super.key});

  final String? connectedThrough;

  @override
  Widget build(BuildContext context) {
    final bool hasConnection =
        connectedThrough != null && connectedThrough!.isNotEmpty;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimens.lg),
      decoration: BoxDecoration(
        color: AppColors.highlightBackground,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        border: Border.all(
          color: AppColors.highlightBorder,
          width: AppDimens.borderWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                hasConnection ? Icons.link : Icons.link_off,
                size: AppDimens.iconSm,
                color: AppColors.primaryDark,
              ),
              const SizedBox(width: AppDimens.xs),
              Text(
                'Connected through',
                style: const TextStyle(
                  fontSize: AppDimens.fontXs,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryDark,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.sm),
          Text(
            hasConnection ? connectedThrough! : 'No connection yet.',
            style: const TextStyle(
              fontSize: AppDimens.fontMd,
              color: AppColors.textPrimary,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}
