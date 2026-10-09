import 'package:flutter/material.dart';

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
        ..._buildDetailRows(),
      ],
    );
  }

  List<Widget> _buildDetailRows() {
    final List<Widget> rows = <Widget>[];

    void addRow(String label, String? value, IconData icon) {
      if (value != null && value.isNotEmpty) {
        rows.add(ProfileDetailRow(label: label, value: value, icon: icon));
      }
    }

    addRow('City', profile.city, Icons.location_city_outlined);
    addRow('Community', profile.community, Icons.people_outline);
    addRow('Profession', profile.profession, Icons.work_outline);
    addRow('Age', profile.age?.toString(), Icons.cake_outlined);
    addRow('Education', profile.education, Icons.school_outlined);
    addRow(
      'Degree',
      profile.degree?.toString(),
      Icons.workspace_premium_outlined,
    );
    addRow('About', profile.about, Icons.info_outline);

    return rows;
  }
}
