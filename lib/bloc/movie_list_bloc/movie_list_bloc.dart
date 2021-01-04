import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cinemabook/data/model/movies_list.dart';
import 'package:cinemabook/data/repository/movie_repository.dart';
import 'package:cinemabook/exceptions.dart';
import 'package:equatable/equatable.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final MovieRepository movieRepository;
  MovieListModel movies;

  MovieListBloc({this.movieRepository}) : super(MovieListInitial());

  @override
  Stream<MovieListState> mapEventToState(MovieListEvent event) async* {
    switch (event) {
      case MovieListEvent.fetchMovies:
        yield MovieListLoading();
        try {
          movies = await movieRepository.getMovies();
          print("%%%%%%--------^^^^----------");
          print(movies.results);
          print("%%%%%%--------^^^^----------");
          yield MovieListLoaded(movies: movies.results);
        } on SocketException {
          yield MovieListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield MovieListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield MovieListError(
            error: InvalidFormatException('Invalid Response Format'),
          );
        } catch (e) {
          yield MovieListError(
            error: UnknownException('Unknown Error'),
          );
        }
        break;
    }
  }
}
