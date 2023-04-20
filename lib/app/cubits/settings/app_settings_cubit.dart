import 'package:equatable/equatable.dart';
import 'package:favorite_sports_events/app/models/category.dart';
import 'package:favorite_sports_events/app/models/country.dart';
import 'package:favorite_sports_events/app/models/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/failure.dart';
import '../../../core/logger.dart';
import '../../repositories/app_settings_repository/app_settings_repository.dart';

part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  final AppSettingsRepository _appSettingsRepository;

  AppSettingsCubit({required AppSettingsRepository countryRepository})
      : _appSettingsRepository = countryRepository,
        super(AppSettingsState());

  Future<void> loadUserSettings() async {
    await loadCountries();
    // await loadCategories();
    await _appSettingsRepository.getUserSavedCategories();

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
    // if (_appSettingsRepository.selectedCategories.contains(category)) {
    //   _appSettingsRepository.selectedCategories.remove(category);
    //   emit(state.copyWith(selectedCategories: _appSettingsRepository.selectedCategories));
    //   logger.d(state);
    // } else {
    //   _appSettingsRepository.selectedCategories.add(category);
    //   emit(state.copyWith(selectedCategories: _appSettingsRepository.selectedCategories));
    //   logger.w(state);
    // }
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
