import 'package:favorite_sports_events/app/cubits/settings/app_settings_cubit.dart';
import 'package:flutter/material.dart';

import '../app/presentation/screens/calendar/calendar_screen.dart';
import '../app/presentation/screens/category/category_screen.dart';
import '../app/presentation/screens/home/home_screen.dart';
import '../app/presentation/screens/location/location_screen.dart';
import '../app/presentation/screens/settings/settings_screen.dart';
import '../app/presentation/screens/single_match/single_match_screen.dart';

enum Routes { location, home, category, calendar, settings, singleMatch }

class _Paths {
  static const String location = '/';
  static const String home = '/home';
  static const String category = '/category';
  static const String calendar = '/calendar';
  static const String settings = '/settings';
  static const String singleMatch = '/single-match';

  static const Map<Routes, String> _pathMap = {
    Routes.location: _Paths.location,
    Routes.home: _Paths.home,
    Routes.category: _Paths.category,
    Routes.calendar: _Paths.calendar,
    Routes.settings: _Paths.settings,
    Routes.singleMatch: _Paths.singleMatch,
  };

  static String of(Routes route) => _pathMap[route] ?? location;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.location:
        return MaterialPageRoute(builder: (_) => const LocationScreen());
      case _Paths.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case _Paths.category:
        return MaterialPageRoute(builder: (_) => const CategoryScreen());
      case _Paths.calendar:
        return MaterialPageRoute(builder: (_) => const CalendarScreen());
      case _Paths.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case _Paths.singleMatch:
        return MaterialPageRoute(builder: (_) => const SingleMatchScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LocationScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) => state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) => state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;

  static navigate(AppSettingsStatus appSettingsStatus) {
    switch (appSettingsStatus) {
      case AppSettingsStatus.loaded:
        replaceWith(Routes.home);
        break;
      // case AppSettingsStatus.categorySelected:
      //   replaceWith(Routes.home);
      //   break;
      default:
        replaceWith(Routes.location);
    }
  }
}
