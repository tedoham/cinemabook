import 'package:cinemabook/data/repository/movie_repository.dart';

import 'package:cinemabook/logic/bloc/movie_bloc.dart';
import 'package:cinemabook/presentation/constants.dart';
import 'package:cinemabook/presentation/screens/movie_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pedantic/pedantic.dart';
import 'get_it.dart' as getIt;
import 'logic/bloc/movie_detail_bloc/moviedetail_bloc.dart';

void main() {
  unawaited(getIt.init());
  // final ApiClient _client = ApiClient(Client());
  // MovieRepository movieRepository = getIt.getItInstance();
  // movieRepository.getMovies();
  // movieRepository.getMovies();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(movieRepository)..add(LoadMovies()),
        ),
        BlocProvider(
          create: (context) => MoviedetailBloc(movieRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cinema book',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
