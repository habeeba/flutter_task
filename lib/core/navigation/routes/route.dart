import 'package:flutter/material.dart';

import '../../../features/items/presentation/pages/items_page.dart';
import '../../constants/route_path_constants.dart';

class AppRoute {
  static Route? generateRoute(RouteSettings settings) {
    Map? arguments = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RoutePath.items:
        return MaterialPageRoute(builder: (_) => ItemsPage());
    }
    return null;
  }
}
