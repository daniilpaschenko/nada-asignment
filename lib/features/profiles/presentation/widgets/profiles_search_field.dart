import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/profiles_providers.dart';

class ProfilesSearchField extends ConsumerWidget {
  const ProfilesSearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      textInputAction: TextInputAction.search,
      onChanged: (String value) =>
          ref.read(profilesSearchQueryProvider.notifier).updateQuery(value),
      decoration: const InputDecoration(
        hintText: 'Search by name or city...',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
