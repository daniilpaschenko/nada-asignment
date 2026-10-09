import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_dimens.dart';

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              fontSize: AppDimens.fontXs,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: AppDimens.xs),
          Text(
            value,
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
            hasConnection
                ? connectedThrough!
                : 'No connection yet',
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
