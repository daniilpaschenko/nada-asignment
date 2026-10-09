import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_dimens.dart';
import '../../domain/entities/profile.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({required this.profile, this.onTap, super.key});

  final Profile profile;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final String? connectedThrough = profile.connectedThrough;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.lg),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      profile.name ?? 'Unknown name',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: AppDimens.fontMd,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppDimens.xs),
                    Text(
                      _subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: AppDimens.fontSm,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    if (connectedThrough != null &&
                        connectedThrough.isNotEmpty) ...<Widget>[
                      const SizedBox(height: AppDimens.sm),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(top: 2, right: AppDimens.xs),
                            child: Icon(
                              Icons.link,
                              size: AppDimens.iconSm,
                              color: AppColors.primary,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              connectedThrough,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: AppDimens.fontSm,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              if (onTap != null)
                const Padding(
                  padding: EdgeInsets.only(left: AppDimens.sm, top: AppDimens.xs),
                  child: Icon(
                    Icons.chevron_right,
                    size: AppDimens.iconMd,
                    color: AppColors.disabled,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String get _subtitle {
    final List<String> parts = <String>[];
    if (profile.age != null) {
      parts.add('${profile.age} years');
    }
    if (profile.city != null && profile.city!.isNotEmpty) {
      parts.add(profile.city!);
    }
    return parts.isEmpty ? 'No details' : parts.join(' · ');
  }
}
