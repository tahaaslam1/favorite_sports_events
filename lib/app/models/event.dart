import 'package:equatable/equatable.dart';
import 'package:favorite_sports_events/app/models/category.dart';

import '../../core/logger.dart';

class Event extends Equatable {
  final int eventId;
  final DateTime eventStartTime;
  final String opp1;
  final String opp2;
  final Category eventCategory;

  const Event({
    required this.eventId,
    required this.eventStartTime,
    required this.opp1,
    required this.opp2,
    required this.eventCategory,
  });

  factory Event.fromJson(Map<String, dynamic> map, Category category) {
    logger.w(map['game_start']);
    return Event(
      eventId: map['game_id'],
      eventStartTime: DateTime.fromMillisecondsSinceEpoch(map['game_start'] * 1000),
      opp1: map['opp_1_name'],
      opp2: map['opp_2_name'],
      eventCategory: category,
    );
  }

  Event copyWith({
    int? eventId,
    DateTime? eventStartTime,
    String? opp1,
    String? opp2,
    Category? eventCategory,
  }) {
    return Event(
      eventId: eventId ?? this.eventId,
      eventStartTime: eventStartTime ?? this.eventStartTime,
      opp1: opp1 ?? this.opp1,
      opp2: opp2 ?? this.opp2,
      eventCategory: eventCategory ?? this.eventCategory,
    );
  }

  @override
  List<Object?> get props => [eventId, eventStartTime, opp1, opp2, eventCategory];
}
