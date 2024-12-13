import 'dart:developer';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;

  const TabNavigator(
      {super.key, required this.navigatorKey, required this.child});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        log("Route::$settings");
        return MaterialPageRoute(
          builder: (context) => child,
        );
      },
    );
  }
}
