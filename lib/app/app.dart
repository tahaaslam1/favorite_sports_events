import 'package:favorite_sports_events/core/app_navigator.dart';
import 'package:favorite_sports_events/services/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/logger.dart';
import 'cubits/settings/app_settings_cubit.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<AppSettingsCubit>(context, listen: false).loadUserSettings().then((value) => logger.d('loading user settings'));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppNavigator.navigatorKey,
        onGenerateRoute: AppNavigator.onGenerateRoute,

        // home: const SettingsScreen(),
        // builder: (context, child) {
        //   return BlocListener<AppSettingsCubit, AppSettingsState>(
        //     listener: (context, state) => AppNavigator.navigate(state.appSettingsStatus),
        //     child: child,
        //   );
        // },
      ),
      designSize: const Size(360, 640),
    );
  }
}
