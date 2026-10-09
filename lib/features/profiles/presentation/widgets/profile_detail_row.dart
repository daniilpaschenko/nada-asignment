import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_dimens.dart';

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({
    required this.label,
    required this.value,
    required this.icon,
    this.compact = false,
    super.key,
  });

  final String label;
  final String value;
  final IconData icon;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return compact ? _buildCompact() : _buildRegular();
  }

  Widget _buildRegular() {
    return Container(
      padding: const EdgeInsets.all(AppDimens.lg),
      decoration: _cardDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _IconBadge(icon: icon),
          const SizedBox(width: AppDimens.md),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
    );
  }

  Widget _buildCompact() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.lg,
        vertical: AppDimens.md,
      ),
      decoration: _cardDecoration,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _IconBadge(icon: icon),
          const SizedBox(width: AppDimens.md),
          Column(
            mainAxisSize: MainAxisSize.min,
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
        ],
      ),
    );
  }

  BoxDecoration get _cardDecoration => BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppDimens.radiusMd),
    border: Border.all(color: AppColors.divider, width: AppDimens.borderWidth),
    boxShadow: const <BoxShadow>[
      BoxShadow(
        color: AppColors.cardShadow,
        blurRadius: AppDimens.cardShadowBlur,
        offset: Offset(0, AppDimens.cardShadowOffsetY),
      ),
    ],
  );
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
