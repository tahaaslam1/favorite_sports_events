part of 'app_settings_cubit.dart';

enum CountryStatus { initial, loaded, error }

class AppSettingsState extends Equatable {
  final Country selectedCountry;

  final CountryStatus countryStatus;

  final List<Category> selectedCategories;

  final List<Event> favoriteEvents;

  final List<Country> countries;

  const AppSettingsState({
    this.countries = const <Country>[],
    this.countryStatus = CountryStatus.initial,
    this.selectedCountry = Country.empty,
    this.selectedCategories = const <Category>[],
    this.favoriteEvents = const <Event>[],
  });

  AppSettingsState copyWith({
    CountryStatus? countryStatus,
    Country? selectedCountry,
    List<Category>? selectedCategories,
    List<Event>? favoriteEvents,
    List<Country>? countries,
  }) {
    return AppSettingsState(
      countryStatus: countryStatus ?? this.countryStatus,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      favoriteEvents: favoriteEvents ?? this.favoriteEvents,
      countries: countries ?? this.countries,
    );
  }

  @override
  List<Object?> get props => [selectedCountry, selectedCategories, favoriteEvents, countryStatus];

  // const Country.empty = Country(countryId: 0, countryName: 'Select Country');
}
