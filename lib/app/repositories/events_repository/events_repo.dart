import '../../models/category.dart';
import '../../models/country.dart';
import '../../models/event.dart';

abstract class EventsRepo {
  Future<void> getAllEvents({required List<Category> categories, required Country country});

  List<Event> get events;

  List<Event> get favEvents;

  Future<Event> addEventToFavorite({required Event event});

  Future<void> getAllFavEvents();
}
