import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/failure.dart';
import '../../../core/logger.dart';
import '../../models/category.dart';
import '../../models/country.dart';
import '../../models/event.dart';
import '../../repositories/events_repository/events_repo.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final EventsRepo _eventsRepo;

  HomeBloc({required EventsRepo eventRepo})
      : _eventsRepo = eventRepo,
        super(const HomeState()) {
    on<FetchEventsList>((event, emit) async {
      try {
        emit(state.copyWith(homeStatus: HomeStatus.loading));
        await _eventsRepo.getAllEvents(categories: event.selectedCategories, country: event.selectedCountry);

        await _eventsRepo.getAllFavEvents();
        emit(state.copyWith(homeStatus: HomeStatus.loaded, events: _eventsRepo.events, firstDay: _eventsRepo.events.first.eventStartTime));
      } on Failure catch (_) {
        emit(state.copyWith(homeStatus: HomeStatus.error));
      }
    });

    on<FilterEventsByDate>((event, emit) async {
      //try {
      // emit(state.copyWith(homeStatus: HomeStatus.loading));
      // await _eventsRepo.getAllEvents(categories: state.selectedCategories, country: state.selectedCountry, date: event.dateSelected);

      // await _eventsRepo.getAllFavEvents();
      emit(state.copyWith(homeStatus: HomeStatus.loaded, events: _eventsRepo.events.where((element) => element.eventStartTime.isAfter(event.dateSelected)).toList()));
      // } on Failure catch (_) {
      //   emit(state.copyWith(homeStatus: HomeStatus.error));
      // }
    });
  }
}
