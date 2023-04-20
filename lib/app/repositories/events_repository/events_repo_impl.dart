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

  EventsRepoImpl({required LocalStorageService localStorageService, required HttpService httpService})
      : _httpService = httpService,
        _localStorageService = localStorageService;

  @override
  Future<void> getAllEvents({required List<Category> categories, required Country country}) async {
    List<Event> events = [];
    try {
      await Future.forEach(categories, (category) async {
        final Response response = await _httpService.request<Map<String, dynamic>>(RequestMethod.get, '${Endpoints.baseUrl}/events/${category.categoryId}/0/list/1000000/line/en', headers: {'Package': Secrets.apiSecretKey});
        events.addAll(response.data['body'].map<Event>((e) => Event.fromJson(e, category)).toList());
      });
      _events.clear();
      _events.addAll(events);
      logger.d(_events.length);
    } catch (e) {
      logger.e(e);
      throw Failure(message: kGenericErrorMessage);
    }
  }

  @override
  List<Event> get events => _events;
}
