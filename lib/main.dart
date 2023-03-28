import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/db/app_database.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:food_app/rest/api/api_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiRepository>(create: (context) => ApiRepository()),
        RepositoryProvider<AppDatabase>(create: (context) => AppDatabase()),
      ],
      child: MaterialApp(
        title: 'Chop Chop',
        theme: ThemeData(
          primarySwatch: Colors.green,
          brightness: Brightness.light,
        ),
        home: HomePage(),
      ),
    );
  }
}
