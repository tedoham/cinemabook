part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class LoadMovies extends MovieEvent {}

class UpdateMovies extends MovieEvent {
  final List<AllMovieModel> movies;

  const UpdateMovies(this.movies);
}
