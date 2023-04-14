import 'package:favorite_sports_events/app/models/category.dart';
import 'package:favorite_sports_events/app/models/event.dart';

class ApplicationSetting {
  final String? selectedCountry;

  final List<Category>? selectedCategories;

  final List<Event>? favoriteEvents;

  ApplicationSetting({this.favoriteEvents, this.selectedCategories, this.selectedCountry});
}
