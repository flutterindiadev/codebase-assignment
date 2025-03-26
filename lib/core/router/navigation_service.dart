import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Create a global navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Provider for the NavigationService
final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService(navigatorKey);
});

class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey;

  NavigationService(this._navigatorKey);

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> replaceTo(String routeName, {dynamic arguments}) {
    return _navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  void goBack() {
    _navigatorKey.currentState!.pop();
  }

  Future<dynamic> navigateToAndRemoveUntil(String routeName,
      {dynamic arguments}) {
    return _navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
}
