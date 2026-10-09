abstract final class AppRoutes {
  static const String home = '/';
  static const String homeName = 'home';

  static const String profileDetails = '/profile/:id';
  static const String profileDetailsName = 'profileDetails';

  static String profileDetailsPath(String id) => '/profile/$id';
}
