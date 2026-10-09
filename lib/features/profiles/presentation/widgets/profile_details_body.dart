import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_dimens.dart';
import '../../domain/entities/profile.dart';
import 'name_header.dart';
import 'profile_connection_card.dart';
import 'profile_detail_row.dart';

class ProfileDetailsBody extends StatelessWidget {
  const ProfileDetailsBody({required this.profile, super.key});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimens.lg),
      children: <Widget>[
        NameHeader(profile: profile),
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