import 'package:favorite_sports_events/presentation/screens/calendar_screen/calendar_screen.dart';
import 'package:favorite_sports_events/presentation/screens/settings_screen/settings_screen.dart';
import 'package:favorite_sports_events/presentation/screens/single_match_screen/single_match_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const FavoriteSportsEvents()));
  runApp(const FavoriteSportsEvents());
}

class FavoriteSportsEvents extends StatelessWidget {
  const FavoriteSportsEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SettingsScreen(),
      ),
      designSize: const Size(360, 640),
    );
  }
}
