import 'package:favorite_sports_events/app/models/category.dart';

class Event {
  final String eventId;
  final DateTime eventStartTime;
  final String oop1;
  final String oop2;
  final Category eventCategory;
  final bool isFav;

  Event({required this.eventId, required this.eventStartTime, required this.oop1, required this.oop2, required this.eventCategory, required this.isFav});
}
