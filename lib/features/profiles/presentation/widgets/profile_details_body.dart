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
        ..._buildDetailSections(),
      ],
    );
  }

  List<Widget> _buildDetailSections() {
    final List<List<_ProfileField>> groups = <List<_ProfileField>>[
      <_ProfileField>[
        _ProfileField('City', profile.city, Icons.location_city_outlined),
        _ProfileField('Community', profile.community, Icons.people_outline),
      ],
      <_ProfileField>[
        _ProfileField('Education', profile.education, Icons.school_outlined),
        _ProfileField(
          'Degree',
          profile.degree?.toString(),
          Icons.workspace_premium_outlined,
          compact: true,
        ),
      ],
      <_ProfileField>[
        _ProfileField(
          'Age',
          profile.age?.toString(),
          Icons.cake_outlined,
          compact: true,
        ),
        _ProfileField('Profession', profile.profession, Icons.work_outline),
      ],
      <_ProfileField>[
        _ProfileField('About', profile.about, Icons.info_outline),
      ],
    ];

    final List<Widget> sections = <Widget>[];
    for (final List<_ProfileField> group in groups) {
      final List<_ProfileField> visible = group
          .where(
            (_ProfileField field) =>
                field.value != null && field.value!.isNotEmpty,
          )
          .toList();
      if (visible.isNotEmpty) {
        sections.add(_DetailSection(cards: visible));
      }
    }
    return sections;
  }
}

class _DetailSection extends StatelessWidget {
  const _DetailSection({required this.cards});

  final List<_ProfileField> cards;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.md),
      child: cards.length == 1
          ? ProfileDetailRow(
              label: cards[0].label,
              value: cards[0].value!,
              icon: cards[0].icon,
            )
          : IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _pairChild(cards[0]),
                  const SizedBox(width: AppDimens.md),
                  _pairChild(cards[1]),
                ],
              ),
            ),
    );
  }

  Widget _pairChild(_ProfileField field) {
    if (field.compact) {
      return _card(field);
    }
    return Expanded(child: _card(field));
  }

  Widget _card(_ProfileField field) {
    return ProfileDetailRow(
      label: field.label,
      value: field.value!,
      icon: field.icon,
      compact: field.compact,
    );
  }
}

class _ProfileField {
  const _ProfileField(
    this.label,
    this.value,
    this.icon, {
    this.compact = false,
  });

  final String label;
  final String? value;
  final IconData icon;
  final bool compact;
}
