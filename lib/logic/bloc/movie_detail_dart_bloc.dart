import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_dart_event.dart';
part 'movie_detail_dart_state.dart';

class MovieDetailDartBloc extends Bloc<MovieDetailDartEvent, MovieDetailDartState> {
  MovieDetailDartBloc() : super(MovieDetailDartInitial());

  @override
  Stream<MovieDetailDartState> mapEventToState(
    MovieDetailDartEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
