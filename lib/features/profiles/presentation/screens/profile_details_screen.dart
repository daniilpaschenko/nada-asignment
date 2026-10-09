import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/error_mapper.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_dimens.dart';
import '../../../../core/widgets/responsive_content.dart';
import '../../domain/entities/profile.dart';
import '../providers/profiles_providers.dart';
import '../widgets/profile_detail_row.dart';
import '../widgets/profiles_status_views.dart';

class ProfileDetailsScreen extends ConsumerWidget {
  const ProfileDetailsScreen({required this.profileId, super.key});

  final int profileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Profile>> profilesAsync = ref.watch(profilesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile details')),
      body: SafeArea(
        child: profilesAsync.when(
          data: (List<Profile> profiles) {
            final Profile? profile = ref.watch(profileByIdProvider(profileId));
            if (profile == null) {
              return const ProfileNotFoundView();
            }
            return ResponsiveContent(
              child: _ProfileDetailsBody(profile: profile),
            );
          },
          loading: ProfilesLoadingView.new,
          error: (Object error, StackTrace stackTrace) => ProfilesErrorView(
            message: mapExceptionToFailure(error).message,
            onRetry: () => ref.read(profilesProvider.notifier).retry(),
          ),
        ),
      ),
    );
  }
}

class _ProfileDetailsBody extends StatelessWidget {
  const _ProfileDetailsBody({required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimens.lg),
      children: <Widget>[
        _NameHeader(profile: profile),
        const SizedBox(height: AppDimens.lg),
        ProfileConnectionCard(connectedThrough: profile.connectedThrough),
        const SizedBox(height: AppDimens.lg),
        ..._buildChips(),
        const SizedBox(height: AppDimens.md),
        ..._buildDetailRows(),
      ],
    );
  }

  List<Widget> _buildChips() {
    final List<Widget> chips = <Widget>[];

    void addChip(String? value, IconData icon) {
      if (value != null && value.isNotEmpty) {
        chips.add(
          Chip(
            avatar: Icon(
              icon,
              size: AppDimens.iconSm,
              color: AppColors.primary,
            ),
            label: Text(
              value,
              style: const TextStyle(
                fontSize: AppDimens.fontSm,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: AppColors.background,
            side: const BorderSide(color: AppColors.divider),
            labelPadding: const EdgeInsets.symmetric(
              horizontal: AppDimens.xs,
            ),
          ),
        );
      }
    }

    addChip(profile.city, Icons.location_city_outlined);
    addChip(profile.community, Icons.people_outline);
    addChip(profile.profession, Icons.work_outline);

    if (chips.isEmpty) {
      return const <Widget>[];
    }
    return <Widget>[
      Wrap(
        spacing: AppDimens.sm,
        runSpacing: AppDimens.sm,
        children: chips,
      ),
    ];
  }

  List<Widget> _buildDetailRows() {
    final List<Widget> rows = <Widget>[];

    void addRow(String label, String? value) {
      if (value != null && value.isNotEmpty) {
        rows.add(ProfileDetailRow(label: label, value: value));
      }
    }

    addRow('Age', profile.age?.toString());
    addRow('Education', profile.education);
    addRow('Degree', profile.degree?.toString());
    addRow('About', profile.about);

    return rows;
  }
}

class _NameHeader extends StatelessWidget {
  const _NameHeader({required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Row(
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