import 'package:dio/dio.dart';
import 'package:favorite_sports_events/app/models/country.dart';
import 'package:favorite_sports_events/app/repositories/app_settings_repository/app_settings_repository.dart';
import 'package:favorite_sports_events/core/endpoints.dart';
import 'package:favorite_sports_events/core/failure.dart';
import 'package:favorite_sports_events/core/logger.dart';
import 'package:favorite_sports_events/core/secrets.dart';
import 'package:favorite_sports_events/services/http_service.dart';

import '../../../core/constants.dart';
import '../../../services/local_storage_service.dart';
import '../../models/category.dart';
import '../../presentation/screens/category/data/categories_data.dart';

class AppSettingsRepositoryImpl extends AppSettingsRepository {
  final HttpService _httpService;
  final LocalStorageService _localStorageService;
  final List<Country> _countries = [];
  Country _selectedCountry = Country.empty;

  final List<String> _selectedCategories = [];

  AppSettingsRepositoryImpl({required LocalStorageService localStorageService, required HttpService httpService})
      : _httpService = httpService,
        _localStorageService = localStorageService;

  @override
  Future<List<Country>> getCountries() async {
    try {
      final Response response = await _httpService.request<Map<String, dynamic>>(RequestMethod.get, Endpoints.countriesUrl, headers: {'Package': Secrets.apiSecretKey});

      List<Country> countries = response.data['body'].map<Country>((e) => Country.fromJson(e)).toList();
      _countries.addAll(countries.toSet().toList());
      return countries.toSet().toList();
    } catch (e) {
      logger.e(e);
      throw Failure(message: kGenericErrorMessage);
    }
  }

  @override
  Future<Country> getUserSavedCountry() async {
    try {
      final String countryName = await _localStorageService.getString('country');
      if (countryName.isEmpty) {
        _selectedCountry = Country.empty;
      } else {
        for (var element in _countries) {
          if (element.countryName == countryName) {
            _selectedCountry = element;
          }
        }
      }
      return _selectedCountry;
    } catch (_) {
      throw Failure(message: kGenericErrorMessage);
    }
  }

  @override
  Future<void> saveUserCountry(Country country) async {
    try {
      if (_selectedCountry == Country.empty) {
        _selectedCountry = country;
        await _localStorageService.addString('country', country.countryName);
        return;
      } else if (_selectedCountry == country) {
        return;
      } else {
        await _localStorageService.removeString('country');
        _selectedCountry = country;
        await _localStorageService.addString('country', country.countryName);
        return;
      }
    } catch (_) {
      throw Failure(message: kGenericErrorMessage);
    }
  }

  @override
  List<Country> get countries => _countries;

  @override
  List<Category> get selectedCategories {
    List<Category> categories = [];

    for (var i in _selectedCategories) {
      for (var j in CategoriesData.categories) {
        if (i == j.categoryName) {
          categories.add(j);
        }
      }
    }
    return categories;
  }

  @override
  Country get selectedCountry => _selectedCountry;

  @override
  Future<void> updateCategories(Category category) async {
    try {
      if (_selectedCategories.contains(category.categoryName)) {
        _selectedCategories.remove(category.categoryName);
        await _localStorageService.removeStringListItem('categories', category.categoryName);
      } else {
        _selectedCategories.add(category.categoryName);
        await _localStorageService.addStringListItem('categories', category.categoryName);
      }
    } catch (_) {
      throw Failure(message: kGenericErrorMessage);
    }
  }

  @override
  Future<void> getUserSavedCategories() async {
    try {
      List<String> userCategories = await _localStorageService.getStringList('categories');
      _selectedCategories.clear();
      _selectedCategories.addAll(userCategories);
    } catch (_) {
      throw Failure(message: kGenericErrorMessage);
    }
  }
}
