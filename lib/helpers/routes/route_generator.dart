import 'package:flutter/material.dart';
import 'package:wtf_gym_assignment/helpers/routes/routes.dart';
import 'package:wtf_gym_assignment/ui/screens/gym_location_search_screen.dart';
import 'package:wtf_gym_assignment/ui/screens/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? routeName = settings.name;

    final Widget widget;
    switch (routeName) {
      case Routes.HOME:
        widget = const HomeScreen();
        break;

      case Routes.GYM_LOCATION_SEARCH:
        widget = GymLocationSearchScreen();
        break;

      default:
        widget = const SizedBox();
        break;
    }

    return MaterialPageRoute(
      builder: (_) => widget,
      settings: RouteSettings(name: routeName),
    );
  }
}
