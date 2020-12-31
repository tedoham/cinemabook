part of 'moviedetail_bloc.dart';

abstract class MoviedetailEvent extends Equatable {
  const MoviedetailEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieDetail extends MoviedetailEvent {
  final int movieId;

  const LoadMovieDetail(this.movieId);
}
