import 'package:cinemabook/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:cinemabook/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:cinemabook/data/core/api_client.dart';
import 'package:cinemabook/data/repository/movie_repository.dart';
import 'package:cinemabook/presentation/constants.dart';
import 'package:cinemabook/presentation/screens/movie_home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiClient _client = ApiClient(Client());
  MovieRepository movieRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              MovieListBloc(movieRepository: MovieRepository(_client)),
        ),
        BlocProvider(
          create: (context) =>
              MovieDetailBloc(movieRepository: MovieRepository(_client)),
        ),
      ],
      child: MaterialApp(
        title: 'Cinema Book',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
