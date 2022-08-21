part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadApiEvent extends HomeEvent {}

class NointernetEvent extends HomeEvent {}

class LoadMultiplePostEvent extends HomeEvent {}
