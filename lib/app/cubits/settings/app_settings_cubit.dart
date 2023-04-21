import 'package:equatable/equatable.dart';
import 'package:favorite_sports_events/app/models/category.dart';
import 'package:favorite_sports_events/app/models/country.dart';
import 'package:favorite_sports_events/app/models/event.dart';
import 'package:favorite_sports_events/app/repositories/events_repository/events_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/failure.dart';
import '../../../core/logger.dart';
import '../../repositories/app_settings_repository/app_settings_repository.dart';

part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  final AppSettingsRepository _appSettingsRepository;
  final EventsRepo _eventsRepo;

  AppSettingsCubit({required AppSettingsRepository appSettingsRepository, required EventsRepo eventsRepo})
      : _appSettingsRepository = appSettingsRepository,
        _eventsRepo = eventsRepo,
        super(AppSettingsState());

  Future<void> getFavEvents() async {
    // for (var i in _eventsRepo.favEvents) {
    //   logger.d(i);
    // }
    logger.d(_eventsRepo.favEvents.length);
    emit(state.copyWith(favoriteEvents: _eventsRepo.favEvents, appSettingsStatus: AppSettingsStatus.loaded));
  }

  Future<void> loadUserSettings() async {
    try {
      await loadCountries();

      await _appSettingsRepository.getUserSavedCategories();

      // await _eventsRepo.getAllFavEvents();

      Country userCountry = await _appSettingsRepository.getUserSavedCountry();

      if (userCountry == Country.empty) {
        emit(state.copyWith(appSettingsStatus: AppSettingsStatus.noSettings));
      } else if (userCountry != Country.empty) {
        emit(state.copyWith(selectedCountry: userCountry));
      }

      List<Category> userCategories = _appSettingsRepository.selectedCategories;

      if (userCategories.isNotEmpty) {
        emit(state.copyWith(selectedCategories: userCategories));
      }
    } catch (e) {
      emit(state.copyWith(appSettingsStatus: AppSettingsStatus.error));
    }
  }

  Future<void> loadCountries() async {
    if (_appSettingsRepository.countries.isNotEmpty) {
      emit(state.copyWith(countryStatus: CountryStatus.loaded, countries: _appSettingsRepository.countries));
    } else {
      try {
        final List<Country> countries = await _appSettingsRepository.getCountries();

        emit(state.copyWith(countries: countries, countryStatus: CountryStatus.loaded));
      } on Failure catch (_) {
        emit(state.copyWith(countryStatus: CountryStatus.error));
      }
    }
  }

  Future<void> updateSelectedCategories(Category category) async {
    await _appSettingsRepository.updateCategories(category);

    emit(state.copyWith(selectedCategories: _appSettingsRepository.selectedCategories));
  }

  bool isCategorySelected(Category category) {
    return _appSettingsRepository.selectedCategories.contains(category);
    // return state.selectedCategories.contains(category);
  }

  Future<void> updateSelectedCountry(Country? country) async {
    try {
      await _appSettingsRepository.saveUserCountry(country!);

      emit(state.copyWith(selectedCountry: _appSettingsRepository.selectedCountry));
    } on Failure catch (_) {
      emit(state.copyWith(countryStatus: CountryStatus.error));
    }
    emit(state.copyWith(selectedCountry: country));
  }
}
