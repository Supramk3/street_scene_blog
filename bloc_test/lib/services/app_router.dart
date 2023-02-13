import 'package:bloc_test/screens/tabs_screen.dart';
import 'package:bloc_test/screens/pending_screen.dart';
import 'package:flutter/material.dart';

import '../screens/recycle_bin.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );

      case TabsScreen.id:
        return MaterialPageRoute(
          builder: (_) => TabsScreen(),
        );
      default:
        return null;
    }
  }
}
