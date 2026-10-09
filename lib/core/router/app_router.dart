import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/profiles/presentation/screens/profile_details_screen.dart';
import '../../features/profiles/presentation/screens/profiles_list_screen.dart';
import '../themes/app_dimens.dart';
import 'app_routes.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutes.home,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.homeName,
        builder: (BuildContext context, GoRouterState state) =>
            const ProfilesListScreen(),
      ),
      GoRoute(
        path: AppRoutes.profileDetails,
        name: AppRoutes.profileDetailsName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final int profileId =
              int.tryParse(state.pathParameters['id'] ?? '') ?? -1;
          return CustomTransitionPage<void>(
            transitionDuration: AppDimens.routeTransitionDuration,
            transitionsBuilder:
                (
                  BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child,
                ) {
                  return FadeTransition(
                    opacity: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeIn,
                    ),
                    child: child,
                  );
                },
            child: ProfileDetailsScreen(profileId: profileId),
          );
        },
      ),
    ],
  );
}
