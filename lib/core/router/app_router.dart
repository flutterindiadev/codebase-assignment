import 'package:assignment/features/users/presentation/pages/user_details_screen.dart';
import 'package:assignment/features/users/presentation/pages/user_list_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String userDetails = '/user-details';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (_) => const UserListScreen(),
          settings: settings,
        );

      case userDetails:
        final userId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => UserDetailsScreen(userId: userId),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
