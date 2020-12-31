part of 'moviedetail_bloc.dart';

abstract class MoviedetailState extends Equatable {
  const MoviedetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailLoading extends MoviedetailState {
  const MovieDetailLoading();

  @override
  List<Object> get props => [];
}

class MovieDetailLoaded extends MoviedetailState {
  final MovieDetailModel movie;

  const MovieDetailLoaded(this.movie);

  @override
  String toString() => 'MovieDetailLoaded { todos: $movie }';

  @override
  List<Object> get props => [movie];
}

class MovieDetailError extends MoviedetailState {
  final String message;
  const MovieDetailError(this.message);

  @override
  List<Object> get props => [message];
}
