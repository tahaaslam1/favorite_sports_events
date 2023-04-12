import 'package:favorite_sports_events/presentation/screens/location_screen/location_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FavoriteSportsEvents());
}

class FavoriteSportsEvents extends StatelessWidget {
  const FavoriteSportsEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LocationScreen(),
    );
  }
}
