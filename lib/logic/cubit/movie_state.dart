part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {
  const MovieInitial();
  // MovieLoaded();
}

class MovieLoading extends MovieState {
  const MovieLoading();
}

class MovieLoaded extends MovieState {
  final List<Movie> moviesResultModel;
  const MovieLoaded(this.moviesResultModel);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovieLoaded && o.moviesResultModel == moviesResultModel;
  }

  @override
  int get hashCode => moviesResultModel.hashCode;
}

class MovieError extends MovieState {
  final String message;
  const MovieError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovieError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
