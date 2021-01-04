part of 'movie_list_bloc.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

class MovieListInitial extends MovieListState {}

class MovieListLoading extends MovieListState {}

class MovieListLoaded extends MovieListState {
  final List<Result> movies;

  MovieListLoaded({this.movies});
}

class MovieListError extends MovieListState {
  final error;

  MovieListError({this.error});
}
