import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cinemabook/data/model/movie_model.dart';
import 'package:cinemabook/data/repository/movie_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../get_it.dart' as getIt;

part 'movie_event.dart';
part 'movie_state.dart';

// MovieRepository movieRepository = getIt.getItInstance();
// movieRepository.getMovies();

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc(this.movieRepository) : super(MovieLoading());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is LoadMovies) {
      yield* _mapLoadMoviesToState();
    } else if (event is UpdateMovies) {
      yield* _mapMoviesUpdateToState(event);
    }
  }

  Stream<MovieState> _mapLoadMoviesToState() async* {
    try {
      MovieRepository repositoryInstance = getIt.getItInstance();
      final moviesList = await repositoryInstance.getMovies();
      // final moviesList = await this.movieRepository.getMovies();

      print("kjfksljflksjf----------------sdfsdfsdfsdfsdf");
      print(moviesList.toList());
      print("kjfksljflksjf----------------sdfsdfsdfsdfsdf");
      yield MovieLoaded(moviesList);
    } catch (_) {
      yield MovieError("error");
    }
  }

  Stream<MovieState> _mapMoviesUpdateToState(UpdateMovies event) async* {
    print("------44-4-4-4-4-4-4-----------");
    print(event);
    print("------44-4-4-4-4-4-4-----------");
    yield MovieLoaded(event.movies);
  }
}
