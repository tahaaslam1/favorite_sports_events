import 'package:equatable/equatable.dart';
import 'package:favorite_sports_events/app/models/category.dart';

class Event extends Equatable {
  final String eventId;
  final DateTime eventStartTime;
  final String oop1;
  final String oop2;
  final Category eventCategory;
  final bool isFav;

  const Event({required this.eventId, required this.eventStartTime, required this.oop1, required this.oop2, required this.eventCategory, required this.isFav});

  @override
  List<Object?> get props => [eventId, eventStartTime, oop1, oop2, eventCategory, isFav];

  Event copyWith({
    String? eventId,
    DateTime? eventStartTime,
    String? oop1,
    String? oop2,
    Category? eventCategory,
    bool? isFav,
  }) {
    return Event(
      eventId: eventId ?? this.eventId,
      eventStartTime: eventStartTime ?? this.eventStartTime,
      oop1: oop1 ?? this.oop1,
      oop2: oop2 ?? this.oop2,
      eventCategory: eventCategory ?? this.eventCategory,
      isFav: isFav ?? this.isFav,
    );
  }
}
