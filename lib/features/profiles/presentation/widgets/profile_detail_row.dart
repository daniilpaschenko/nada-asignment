import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_dimens.dart';

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({
    required this.label,
    required this.value,
    required this.icon,
    super.key,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.md),
      child: Container(
        padding: const EdgeInsets.all(AppDimens.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          border: Border.all(
            color: AppColors.divider,
            width: AppDimens.borderWidth,
          ),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: AppDimens.cardShadowBlur,
              offset: Offset(0, AppDimens.cardShadowOffsetY),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _IconBadge(icon: icon),
            const SizedBox(width: AppDimens.md),
            Expanded(
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
            ),
          ],
        ),
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  const _IconBadge({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.iconBadgeSize,
      height: AppDimens.iconBadgeSize,
      decoration: BoxDecoration(
        color: AppColors.highlightBackground,
        borderRadius: BorderRadius.circular(AppDimens.radiusSm),
      ),
      child: Icon(icon, size: AppDimens.iconSm, color: AppColors.primary),
    );
  }
}
