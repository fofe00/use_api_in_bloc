import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:use_api_in_bloc/services/conectivity_serice.dart';
import 'package:use_api_in_bloc/services/post_services.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PostService _postService;
  final ConectityServce _conectityServce;
  HomeBloc(this._postService, this._conectityServce)
      : super(HomeLoadingState()) {
    _conectityServce.connnectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print('no internet ');
        add(NointernetEvent());
      } else {
        add(LoadApiEvent());
        print('yarr internet ');
      }
    });

    on<LoadApiEvent>((event, emit) async {
      emit(HomeLoadingState());
      if (await _conectityServce.getStateConnection()) {
        final post = await _postService.getPost();
        emit(HomeLoadedState(
          userId: post.userId,
          id: post.id,
          title: post.title,
          body: post.body,
        ));
      } else {
        emit(const NoInterntState(message: "no internet"));
      }
    });

    on<LoadMultiplePostEvent>((event, emit) async {
      emit(HomeLoadingState());
      if (await _conectityServce.getStateConnection()) {
        final posts = await _postService.getPosts();
        emit(HomeMulipleLoadedState(posts: posts));
      } else {
        emit(const NoInterntState(message: "no internet"));
      }
    });

    on<NointernetEvent>((event, emit) async {
      print("qdffsdfsdfsd");
      emit(const NoInterntState(message: "no internet connection !"));
    });
  }
}
