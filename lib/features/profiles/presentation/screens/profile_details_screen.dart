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
        Text(
          profile.name ?? 'Unknown name',
          style: const TextStyle(
            fontSize: AppDimens.fontXl,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppDimens.lg),
        ProfileConnectionCard(connectedThrough: profile.connectedThrough),
        const SizedBox(height: AppDimens.lg),
        ..._buildDetailRows(),
      ],
    );
  }

  List<Widget> _buildDetailRows() {
    final List<Widget> rows = <Widget>[];

    void addRow(String label, String? value) {
      if (value != null && value.isNotEmpty) {
        rows.add(ProfileDetailRow(label: label, value: value));
      }
    }

    addRow('Age', profile.age?.toString());
    addRow('Gender', _genderLabel(profile.gender));
    addRow('City', profile.city);
    addRow('Community', profile.community);
    addRow('Profession', profile.profession);
    addRow('Education', profile.education);
    addRow('Degree', profile.degree?.toString());
    addRow('About', profile.about);

    return rows;
  }

  String? _genderLabel(String? gender) {
    switch (gender) {
      case 'M':
        return 'Male';
      case 'F':
        return 'Female';
      default:
        return gender;
    }
  }
}
