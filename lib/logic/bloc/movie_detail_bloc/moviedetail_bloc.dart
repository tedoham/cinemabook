import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cinemabook/data/model/movie_detail_model.dart';
import 'package:cinemabook/data/repository/movie_repository.dart';
import 'package:equatable/equatable.dart';
import '../../../get_it.dart' as getIt;

part 'moviedetail_event.dart';
part 'moviedetail_state.dart';

class MoviedetailBloc extends Bloc<MoviedetailEvent, MoviedetailState> {
  final MovieRepository movieRepository;

  MoviedetailBloc(this.movieRepository) : super(MovieDetailLoading());

  @override
  Stream<MoviedetailState> mapEventToState(
    MoviedetailEvent event,
  ) async* {
    print("----------hhhhhhhh--------------");
    print(event);
    print("----------hhhhhhhh--------------");
    if (event is LoadMovieDetail) {
      yield* _mapLoadDetailMoviesToState(event.movieId);
    }
  }

  Stream<MoviedetailState> _mapLoadDetailMoviesToState(int id) async* {
    print("----------hhhhhhhh22--------------");
    print(id);
    print("----------hhhhhhhh22--------------");
    try {
      MovieRepository repositoryInstance = getIt.getItInstance();
      final movieDetail = await repositoryInstance.getMovieDetail(id);
      yield MovieDetailLoaded(movieDetail);
    } catch (_) {
      yield MovieDetailError("error");
    }
  }
}
