import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_dimens.dart';

class ProfilesLoadingView extends StatelessWidget {
  const ProfilesLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class ProfilesEmptyView extends StatelessWidget {
  const ProfilesEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimens.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.search_off,
              size: AppDimens.iconLg,
              color: AppColors.disabled,
            ),
            SizedBox(height: AppDimens.lg),
            Text(
              'No profiles match',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimens.fontMd,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilesErrorView extends StatelessWidget {
  const ProfilesErrorView({
    required this.message,
    required this.onRetry,
    super.key,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.error_outline,
              size: AppDimens.iconLg,
              color: AppColors.error,
            ),
            const SizedBox(height: AppDimens.lg),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: AppDimens.fontMd,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppDimens.lg),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileNotFoundView extends StatelessWidget {
  const ProfileNotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimens.xl),
        child: Text(
          'This profile is not available',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: AppDimens.fontMd,
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
