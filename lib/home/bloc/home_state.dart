// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final int userId;
  final int id;
  final String title;
  final String body;
  const HomeLoadedState({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  @override
  List<Object> get props => [];
}

class HomeMulipleLoadedState extends HomeState {
  final List<Post> posts;
  const HomeMulipleLoadedState({
    required this.posts,
  });
  @override
  List<Object> get props => [posts];
}

class NoInterntState extends HomeState {
  final String message;

  const NoInterntState({required this.message});
  @override
  List<Object> get props => [message];
}
