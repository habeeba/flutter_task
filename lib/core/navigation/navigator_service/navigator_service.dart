import 'package:flutter/material.dart';

/// A utility class for managing navigation in a Flutter application.
/// This class provides static methods to perform common navigation tasks
/// such as pushing named routes, replacing routes, and popping routes.
/// It uses a [GlobalKey<NavigatorState>] to access the current state of the [Navigator].
class AppNavigator {
  /// A [GlobalKey] used to access the [NavigatorState] of the app.
  /// This key should be assigned to the `navigatorKey` property of the
  /// [MaterialApp] or [CupertinoApp] widget in your app.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Returns the current [NavigatorState] using the [navigatorKey].
  /// This is used internally by the other methods to perform navigation actions.
  static NavigatorState get _navigator => navigatorKey.currentState!;

  /// Navigates to a named route and optionally passes arguments to the route.
  ///
  /// - [routeName]: The name of the route to navigate to.
  /// - [arguments]: Optional arguments to pass to the route.
  ///
  /// Returns a [Future] that completes with the result of the route when it is popped.
  static Future<T?> pushNamed<T>(
    String routeName, {
    Object? arguments,
  }) {
    return _navigator.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  /// Replaces the current route with a named route and optionally passes arguments
  /// to the new route.
  ///
  /// - [routeName]: The name of the route to navigate to.
  /// - [arguments]: Optional arguments to pass to the new route.
  ///
  /// Returns a [Future] that completes with the result of the new route when it is popped.
  static Future<T?> pushReplacementNamed<T>(
    String routeName, {
    Object? arguments,
  }) {
    return _navigator.pushReplacementNamed<T, dynamic>(
      routeName,
      arguments: arguments,
    );
  }

  /// Navigates to a named route and removes all the previous routes until the
  /// given predicate returns true.
  ///
  /// - [routeName]: The name of the route to navigate to.
  /// - [predicate]: A function that determines whether to remove a route from the stack.
  /// - [arguments]: Optional arguments to pass to the new route.
  ///
  /// Returns a [Future] that completes with the result of the new route when it is popped.
  static Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return _navigator.pushNamedAndRemoveUntil<T>(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  /// Pops the current route off the navigator, optionally returning a result
  /// to the previous route.
  ///
  /// - [result]: Optional result to return to the previous route.
  static void pop<T>([T? result]) {
    return _navigator.pop<T>(result);
  }

  /// Checks whether the navigator can pop the current route.
  ///
  /// Returns `true` if the navigator can pop the current route, otherwise `false`.
  static bool canPop() {
    return _navigator.canPop();
  }
}
