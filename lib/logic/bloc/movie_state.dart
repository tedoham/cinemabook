part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

// class MovieInitial extends MovieState {
//   const MovieInitial();
// }

class MovieLoading extends MovieState {
  const MovieLoading();

  @override
  List<Object> get props => [];
}

class MovieLoaded extends MovieState {
  final List<Movie> movies;
  const MovieLoaded(this.movies);

  @override
  String toString() => 'MoviesLoaded { todos: $movies }';

  @override
  List<Object> get props => [movies];
}

class MovieError extends MovieState {
  final String message;
  const MovieError(this.message);

  @override
  List<Object> get props => [message];
}
