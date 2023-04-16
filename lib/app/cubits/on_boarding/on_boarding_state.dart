part of 'on_boarding_cubit.dart';

abstract class OnBoardingState extends Equatable {
  final bool isUserOnBoarded;

  const OnBoardingState({this.isUserOnBoarded = false});

  @override
  List<Object> get props => [];
}

class OnBoardingInitial extends OnBoardingState {}
