import '../../models/country.dart';

abstract class CountryRepository {
  Future<List<Country>> getCountries();

  List<Country> get countries;

  Future<void> saveUserCountry(Country country);

  Future<Country> getUserSavedCountry();

  
}
