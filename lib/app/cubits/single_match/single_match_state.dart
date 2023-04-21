part of 'single_match_cubit.dart';

enum SingleMatchStatus { initial, loading, loaded }

class SingleMatchState extends Equatable {
  final Event event;
  final SingleMatchStatus status;
  SingleMatchState({
    this.status = SingleMatchStatus.initial,
    Event? event,
  }) : event = event ?? Event.empty;

  SingleMatchState copyWith({
    SingleMatchStatus? status,
    Event? event,
  }) {
    return SingleMatchState(
      status: status ?? this.status,
      event: event ?? this.event,
    );
  }

  @override
  List<Object> get props => [event, status];
}
