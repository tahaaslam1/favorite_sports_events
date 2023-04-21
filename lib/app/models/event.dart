import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:favorite_sports_events/app/models/category.dart';
import 'package:favorite_sports_events/app/models/country.dart';

class Event extends Equatable {
  final int eventId;
  final DateTime eventStartTime;
  final String opp1;
  final String opp2;
  final Category eventCategory;
  final Country country;
  final bool isFav;

  Event({
    required this.isFav,
    required this.eventId,
    DateTime? eventStartTime,
    // required this.eventStartTime,
    required this.opp1,
    required this.opp2,
    required this.eventCategory,
    required this.country,
  }) : eventStartTime = eventStartTime ?? DateTime.now();

  factory Event.fromJson(Map<String, dynamic> map, Category category, Country country) {
    return Event(
      eventId: map["game_id"] ?? -1,
      eventStartTime: DateTime.fromMillisecondsSinceEpoch(map['game_start'] * 1000),
      opp1: map["opp_1_name_ru"] ?? '',
      opp2: map["opp_2_name_ru"] ?? '',
      eventCategory: category,
      country: Country.fromJson2(map['country_id'], map['country_name'] ?? ''),
      isFav: false,
    );
  }

  static Map<String, dynamic> toMap(Event event) {
    return {
      'game_id': event.eventId,
      'game_start': event.eventStartTime.millisecondsSinceEpoch,
      'opp_1_name_ru': event.opp1,
      'opp_2_name_ru': event.opp2,
      'category': {
        'category_id': event.eventCategory.categoryId,
        'category_name': event.eventCategory.categoryName,
        'category_icon': event.eventCategory.categoryIcon,
      },
      'country': {
        'country_id': event.country.countryId,
        'country_name': event.country.countryName,
      },
      'isFav': true,
    };
  }

  static String encode(List<Event> events) => json.encode(
        events.map<Map<String, dynamic>>((event) => Event.toMap(event)).toList(),
      );

  static List<Event> decode(String events) => (json.decode(events) as List<dynamic>).map<Event>((item) => Event.fromJson2(item)).toList();

  factory Event.fromJson2(Map<String, dynamic> map) {
    return Event(
      eventId: map["game_id"] ?? -1,
      eventStartTime: DateTime.fromMillisecondsSinceEpoch(map['game_start']),
      opp1: map["opp_1_name_ru"] ?? '',
      opp2: map["opp_2_name_ru"] ?? '',
      eventCategory: Category(
        categoryIcon: map['category']['category_icon'] ?? '',
        categoryId: map['category']['category_id'] ?? '',
        categoryName: map['category']['category_name'] ?? '',
      ),
      country: Country.fromJson2(
        map['country']['country_id'],
        map['country']['country_name'] ?? '',
      ),
      isFav: map['isFav'],
    );
  }

  Event copyWith({
    int? eventId,
    DateTime? eventStartTime,
    String? opp1,
    String? opp2,
    Category? eventCategory,
    Country? country,
    bool? isFav,
  }) {
    return Event(
      eventId: eventId ?? this.eventId,
      eventStartTime: eventStartTime ?? this.eventStartTime,
      opp1: opp1 ?? this.opp1,
      opp2: opp2 ?? this.opp2,
      eventCategory: eventCategory ?? this.eventCategory,
      country: country ?? this.country,
      isFav: isFav ?? this.isFav,
    );
  }

  static var empty = Event(eventId: 0, opp1: '-', opp2: '-', country: Country.empty, isFav: false, eventCategory: Category.empty);

  @override
  List<Object?> get props => [eventId, eventStartTime, opp1, opp2, eventCategory, country, isFav];
}
