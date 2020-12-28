import 'package:bloc/bloc.dart';
import 'package:cinemabook/data/model/movie_model.dart';
import 'package:cinemabook/data/repository/movie_repository.dart';
import 'package:equatable/equatable.dart';
import '../../get_it.dart' as getIt;

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieRepository _movieRepository = getIt.getItInstance();

  MovieCubit(this._movieRepository) : super(MovieLoading());

  Future<void> loadMovies() async {
    print(_movieRepository.getMovies());
    try {
      emit(MovieLoading());
      // List<MoviesResultModel> moviesList = await getIt.getItInstance();
      final moviesList = await _movieRepository.getMovies();
      print(".....8989898989..................");
      print(moviesList);
      print(".....8989898989..................");
      emit(MovieLoaded(moviesList));
    } on Exception {
      emit(MovieError("Couldn't fetch movies. Is the device online?"));
    }
  }
}
