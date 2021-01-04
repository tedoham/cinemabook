import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cinemabook/data/model/movie_detail.dart';
import 'package:cinemabook/data/repository/movie_repository.dart';
import 'package:equatable/equatable.dart';

import '../../exceptions.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieRepository movieRepository;
  MovieDetailModel movie;

  MovieDetailBloc({this.movieRepository}) : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(MovieDetailEvent event) async* {
    if (event is FetchMovieDetail) {
      yield MovieListLoading();
      try {
        movie = await movieRepository.getMovieDetail(event.movieId);
        print("%%%%%%--------^^^^----------");
        print(movie);
        print("%%%%%%--------^^^^----------");
        yield MovieListLoaded(movie: movie);
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
    }
  }
}
