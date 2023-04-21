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

class FilterEventsByDate extends HomeEvent {
  final DateTime dateSelected;

  const FilterEventsByDate({required this.dateSelected});
}

// class AddEventToFavorite extends HomeEvent {
//   final Event event;

//   const AddEventToFavorite({required this.event});
// }
