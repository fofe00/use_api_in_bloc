import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_api_in_bloc/home/home.dart';
import 'package:use_api_in_bloc/services/post_services.dart';

import 'services/conectivity_serice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'use api with bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => PostService(),
          ),
          RepositoryProvider(
            create: (context) => ConectityServce(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
