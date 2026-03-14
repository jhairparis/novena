import 'package:flutter/material.dart';

/// Helper class to manage navigation with better support for predictive back gesture
class NavigationHelper {
  /// Navigate to a new page with proper route management
  static Future<T?> push<T extends Object?>(
    BuildContext context,
    Widget page, {
    String? routeName,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute<T>(
        builder: (context) => page,
        settings: routeName != null ? RouteSettings(name: routeName) : null,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  /// Navigate to a new page and replace the current one
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    BuildContext context,
    Widget page, {
    String? routeName,
    TO? result,
  }) {
    return Navigator.pushReplacement<T, TO>(
      context,
      MaterialPageRoute<T>(
        builder: (context) => page,
        settings: routeName != null ? RouteSettings(name: routeName) : null,
      ),
      result: result,
    );
  }

  /// Pop the current page with optional result
  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context, result);
    }
  }

  /// Check if we can pop the current route
  static bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }

  /// Pop until a certain route
  static void popUntil(BuildContext context, RoutePredicate predicate) {
    Navigator.popUntil(context, predicate);
  }

  /// Pop to the root route
  static void popToRoot(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
