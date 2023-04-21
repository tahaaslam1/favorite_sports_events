import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/event.dart';
import '../../repositories/events_repository/events_repo.dart';

part 'single_match_state.dart';

class SingleMatchCubit extends Cubit<SingleMatchState> {
  final EventsRepo _eventsRepo;

  SingleMatchCubit({required EventsRepo eventRepo})
      : _eventsRepo = eventRepo,
        super(SingleMatchState());

  void getSingleMatch(int eventId) {
    state.copyWith(status: SingleMatchStatus.loading);

    final Event event = _eventsRepo.events.firstWhere((element) => element.eventId == eventId);

    emit(state.copyWith(event: event, status: SingleMatchStatus.loaded));
  }

  void addEventToFav(Event event) async {
    Event updatedEvent = await _eventsRepo.addEventToFavorite(event: event);

    emit(state.copyWith(event: updatedEvent, status: SingleMatchStatus.loaded));
  }
}
