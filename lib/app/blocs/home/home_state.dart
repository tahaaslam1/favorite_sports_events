part of 'home_bloc.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStatus homeStatus;

  final List<Event> events;

  final DateTime? firstDay;

  // final DateTime? dateSelected;

  const HomeState({
    // this.dateSelected,
    this.firstDay,
    this.homeStatus = HomeStatus.initial,
    this.events = const <Event>[],
  });

  HomeState copyWith({
    HomeStatus? homeStatus,
    List<Event>? events,
    DateTime? dateSelected,
    DateTime? firstDay,
  }) {
    return HomeState(
      firstDay: firstDay ?? this.firstDay,
      homeStatus: homeStatus ?? this.homeStatus,
      events: events ?? this.events,
      // dateSelected: dateSelected ?? this.dateSelected,
    );
  }

  @override
  List<Object> get props => [homeStatus, events];
}
