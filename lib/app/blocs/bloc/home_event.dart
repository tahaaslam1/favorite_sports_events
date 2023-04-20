part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchEventsList extends HomeEvent {
  final Country selectedCountry;

  final List<Category> selectedCategories;

  const FetchEventsList({
    required this.selectedCountry,
    required this.selectedCategories,
  });
}
