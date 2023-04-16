import 'package:dio/dio.dart';
import 'package:favorite_sports_events/app/models/country.dart';
import 'package:favorite_sports_events/app/repositories/country_repository/country_repository.dart';
import 'package:favorite_sports_events/core/endpoints.dart';
import 'package:favorite_sports_events/core/failure.dart';
import 'package:favorite_sports_events/core/logger.dart';
import 'package:favorite_sports_events/services/http_service.dart';

import '../../../core/constants.dart';
import '../../../services/local_storage_service.dart';

class CountryRepositoryImpl extends CountryRepository {
  final HttpService _httpService;
  final LocalStorageService _localStorageService;

  // final List<Country> _countries = [];

  CountryRepositoryImpl({required LocalStorageService localStorageService, required HttpService httpService})
      : _httpService = httpService,
        _localStorageService = localStorageService;

  @override
  List<Country> get countries => throw UnimplementedError();

  @override
  Future<List<Country>> getCountries() async {
    try {
      final Response response = await _httpService.request<Map<String, dynamic>>(RequestMethod.get, Endpoints.countriesUrl);

      logger.wtf(response);
      List<Country> countries = response.data['body'].map((e) => Country.fromJson(e)).toList();

      return countries.toSet().toList();
    } catch (e) {
      throw Failure(message: kGenericErrorMessage);
    }

    // return response ;
    return [Country(countryId: 1, countryName: 'Egypt')];
  }

  @override
  Future<Country> getUserSavedCountry() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserCountry(Country country) {
    throw UnimplementedError();
  }
}
