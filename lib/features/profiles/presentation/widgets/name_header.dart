import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_dimens.dart';
import '../../domain/entities/profile.dart';

class NameHeader extends StatelessWidget {
  const NameHeader({required this.profile, super.key});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: AppDimens.nameRevealDuration,
      curve: Curves.easeOutCubic,
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * AppDimens.nameRevealOffset),
            child: child,
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (_genderIcon != null) ...<Widget>[
            Padding(
              padding: const EdgeInsets.only(top: AppDimens.xs),
              child: Icon(
                _genderIcon,
                size: AppDimens.iconMd,
                color: _genderColor,
              ),
            ),
            const SizedBox(width: AppDimens.sm),
          ],
          Expanded(
            child: Text(
              profile.name ?? 'Unknown name',
              style: const TextStyle(
                fontSize: AppDimens.fontXl,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData? get _genderIcon => switch (profile.gender) {
    'M' => Icons.male,
    'F' => Icons.female,
    _ => null,
  };

  Color get _genderColor =>
      profile.gender == 'F' ? AppColors.genderFemale : AppColors.genderMale;
}
