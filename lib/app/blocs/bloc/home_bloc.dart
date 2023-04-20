// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'home_event.dart';
// part 'home_state.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   HomeBloc() : super(HomeInitial()) {
//     on<HomeEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favorite_sports_events/app/repositories/app_settings_repository/app_settings_repository.dart';
import 'package:favorite_sports_events/core/logger.dart';

import '../../../core/failure.dart';
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
      emit(state.copyWith(homeStatus: HomeStatus.loading));

      await _eventsRepo.getAllEvents(categories: event.selectedCategories, country: event.selectedCountry);

      try {} on Failure catch (_) {
        emit(state.copyWith(homeStatus: HomeStatus.error));
      }
    });
  }

  // Future<void> loadEvents() async {
  //   emit(state.copyWith(homeStatus: HomeStatus.loading));

  //   try {
  //     // final List<Event> events = await _eventsRepo.getAllEvents();

  //     emit(state.copyWith(events: events, homeStatus: HomeStatus.loaded));
  //   } on Failure catch (_) {
  //     emit(state.copyWith(homeStatus: HomeStatus.error));
  //   }
  // }
}
