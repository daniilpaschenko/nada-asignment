import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/error_mapper.dart';
import '../../domain/entities/profile.dart';
import 'profiles_status_views.dart';

// Renders the standard loading / error / data states for the profiles async
// value. Reused by the list and the details screens so the error mapping and
// the retry behaviour live in one place.
class ProfilesAsyncView extends StatelessWidget {
  const ProfilesAsyncView({
    required this.value,
    required this.dataBuilder,
    required this.onRetry,
    super.key,
  });

  final AsyncValue<List<Profile>> value;
  final Widget Function(List<Profile> profiles) dataBuilder;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: dataBuilder,
      loading: ProfilesLoadingView.new,
      error: (Object error, StackTrace stackTrace) => ProfilesErrorView(
        message: mapExceptionToFailure(error).message,
        onRetry: onRetry,
      ),
    );
  }
}
