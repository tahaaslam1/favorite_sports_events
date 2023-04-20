import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int categoryId;
  final String categoryName;
  final String categoryIcon;
  // final bool isSelected;

  const Category({required this.categoryIcon, required this.categoryId, required this.categoryName});

  Category copyWith({
    int? categoryId,
    String? categoryName,
    String? categoryIcon,
    // bool? isSelected,
  }) {
    return Category(
      categoryIcon: categoryIcon ?? this.categoryIcon,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      // isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [categoryIcon, categoryId, categoryName];
}
