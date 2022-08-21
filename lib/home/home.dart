import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_api_in_bloc/home/bloc/home_bloc.dart';
import 'package:use_api_in_bloc/services/conectivity_serice.dart';
import 'package:use_api_in_bloc/services/post_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<PostService>(context),
        RepositoryProvider.of<ConectityServce>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("post api"),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(state.title),
                  Text(state.body),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context)
                              .add(LoadApiEvent());
                        },
                        child: const Text("load api"),
                      ),
                      ElevatedButton(
                        child: const Text("multiple"),
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context)
                              .add(LoadMultiplePostEvent());
                        },
                      ),
                    ],
                  ),
                ],
              );
            }
            if (state is NoInterntState) {
              return Text(state.message);
            }
            if (state is HomeMulipleLoadedState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        final posts = state.posts;
                        return ListTile(
                          title: Text(posts[index].title),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context).add(LoadApiEvent());
                      },
                      child: const Text("load api"),
                    ),
                  )
                ],
              );
            }
            return Container(
              child: ElevatedButton(
                child: const Text("multiple"),
                onPressed: () {
                  BlocProvider.of<HomeBloc>(context)
                      .add(LoadMultiplePostEvent());
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
