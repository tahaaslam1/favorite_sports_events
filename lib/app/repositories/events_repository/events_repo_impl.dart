import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:favorite_sports_events/app/models/event.dart';

import 'package:favorite_sports_events/app/models/country.dart';

import 'package:favorite_sports_events/app/models/category.dart';
import 'package:favorite_sports_events/core/failure.dart';
import 'package:favorite_sports_events/core/logger.dart';

import '../../../core/constants.dart';
import '../../../core/endpoints.dart';
import '../../../core/secrets.dart';
import '../../../services/http_service.dart';
import '../../../services/local_storage_service.dart';
import 'events_repo.dart';

class EventsRepoImpl extends EventsRepo {
  final HttpService _httpService;
  final LocalStorageService _localStorageService;

  final List<Event> _events = [];

  final List<Event> _favoriteEvents = [];

  EventsRepoImpl({required LocalStorageService localStorageService, required HttpService httpService})
      : _httpService = httpService,
        _localStorageService = localStorageService;

  @override
  Future<void> getAllEvents({required List<Category> categories, required Country country}) async {
    List<Event> events = [];
    try {
      final List<Response> responses = await Future.wait(categories.map((category) async {
        final Response response = await _httpService.request<Map<String, dynamic>>(RequestMethod.get, '${Endpoints.baseUrl}/events/${category.categoryId}/0/list/1000000/line/en', headers: {'Package': Secrets.apiSecretKey});
        return response;
      }));

      for (var response in responses) {
        events.addAll(response.data['body'].map<Event>((e) => Event.fromJson(e, categories.firstWhere((element) => element.categoryId == e['sport_id']), country)).toList());
      }

      _events.clear();

      events.removeWhere((element) => element.country != country);

      events.removeWhere((element) => element.opp1.isEmpty || element.opp2.isEmpty);

      events.sort((a, b) => a.eventStartTime.compareTo(b.eventStartTime));

      _events.addAll(events);
    } catch (e) {
      logger.e('In get all events');
      logger.e(e);
      throw Failure(message: kGenericErrorMessage);
    }
  }

  @override
  List<Event> get events => _events;

  @override
  Future<Event> addEventToFavorite({required Event event}) async {
    try {
      if (_favoriteEvents.where((element) => element.eventId == event.eventId).toList().isNotEmpty) {
        logger.wtf('true');
        // logger.w(
        _favoriteEvents.removeWhere((element) => element.eventId == event.eventId);
        //  );

        await _localStorageService.removeString('fav_events');

        if (_favoriteEvents.isNotEmpty) {
          final String encodedData = Event.encode(_favoriteEvents);

          await _localStorageService.addString('fav_events', encodedData);
        }
      } else {
        logger.wtf('false');
        _favoriteEvents.add(event);

        await _localStorageService.removeString('fav_events');

        final String encodedData = Event.encode(_favoriteEvents);

        await _localStorageService.addString('fav_events', encodedData);
      }

      int index = _events.indexWhere((element) => element.eventId == event.eventId);

      _events[index] = event.copyWith(isFav: !event.isFav);

      return _events[index];
    } catch (e) {
      logger.e('In add event to favorite');
      logger.e(e);
      throw Failure(message: kGenericErrorMessage);
    }
  }

  @override
  Future<void> getAllFavEvents() async {
    try {
      final String favEvents = await _localStorageService.getString('fav_events');

      if (favEvents.isNotEmpty) {
        final List<Event> events = Event.decode(favEvents);

        _favoriteEvents.clear();

        _favoriteEvents.addAll(events);
      }

      for (var i in _favoriteEvents) {
        logger.w('fav');
        logger.w(i);
        for (var j in _events) {
          logger.w('all');
          logger.w(j);

          if (i.eventId == j.eventId) {
            int index = _events.indexWhere((element) => element.eventId == i.eventId);

            _events[index] = i;
            logger.wtf(i);
            logger.w(j);
          }
        }
      }
    } catch (e) {
      logger.e('In get all fav events');
      logger.e(e);
      throw Failure(message: kGenericErrorMessage);
    }
  }

  @override
  List<Event> get favEvents => _favoriteEvents;
}
