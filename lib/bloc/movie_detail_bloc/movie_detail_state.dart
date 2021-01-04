part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieListLoading extends MovieDetailState {}

class MovieListLoaded extends MovieDetailState {
  final MovieDetailModel movie;

  MovieListLoaded({this.movie});
}

class MovieListError extends MovieDetailState {
  final error;

  MovieListError({this.error});
}
