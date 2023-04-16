import 'package:equatable/equatable.dart';
import 'package:favorite_sports_events/app/models/category.dart';
import 'package:favorite_sports_events/app/models/country.dart';
import 'package:favorite_sports_events/app/models/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/failure.dart';
import '../../repositories/country_repository/country_repository.dart';

part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  final CountryRepository _countryRepository;

  
  AppSettingsCubit({required CountryRepository countryRepository})
      : _countryRepository = countryRepository,
        super(const AppSettingsState());

  Future<void> loadCountries() async {
    // emit(state.copyWith())
    try {
      final countries = await _countryRepository.getCountries();

      emit(state.copyWith(countries: countries, countryStatus: CountryStatus.loaded));
    } on Failure catch (_) {
      emit(state.copyWith(countryStatus: CountryStatus.error));
    }
  }

  void updateSelectedCountry(Country? country) {
    emit(state.copyWith(selectedCountry: country));
  }
}
