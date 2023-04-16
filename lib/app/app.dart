import 'package:favorite_sports_events/core/app_navigator.dart';
import 'package:favorite_sports_events/services/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppNavigator.navigatorKey,
        onGenerateRoute: AppNavigator.onGenerateRoute,
        // home: const SettingsScreen(),
      ),
      designSize: const Size(360, 640),
    );
  }
}
