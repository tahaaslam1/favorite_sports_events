import '../../models/category.dart';
import '../../models/country.dart';

abstract class AppSettingsRepository {
  Future<List<Country>> getCountries();

  List<Country> get countries;

  List<Category> get selectedCategories;

  Country get selectedCountry;

  Future<void> saveUserCountry(Country country);

  Future<Country> getUserSavedCountry();

  Future<void> getUserSavedCategories();
  Future<void> updateCategories(Category category);
}
