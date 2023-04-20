import 'package:favorite_sports_events/app/models/category.dart';

class CategoriesData {
  static const List<Category> categories = [
    Category(
      categoryId: 1,
      categoryName: 'Football',
      categoryIcon: 'assets/images/football.png',
    ),
    Category(
      categoryId: 2,
      categoryName: 'Hokey',
      categoryIcon: 'assets/images/IceHockey.png',
    ),
    Category(
      categoryId: 3,
      categoryName: 'Basketball',
      categoryIcon: 'assets/images/Basketball.png',
    ),
    Category(
      categoryId: 4,
      categoryName: 'Tennis',
      categoryIcon: 'assets/images/Tennis.png',
    ),
    // Category(categoryId: 2, categoryName: 'Cybersport'),
    // Category(categoryId: 3, categoryName: 'Rugby'),
    // Category(categoryId: 1, categoryName: 'Volleyball'),
  ];
}
