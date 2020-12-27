import 'package:cinemabook/data/model/movies_result_model.dart';

abstract class GetMoviesRepository {
  /// Throws [NetworkException].
  Future<MoviesResultModel> getMovies();
}

class GetMovies implements GetMoviesRepository {
  @override
  Future<MoviesResultModel> getMovies() async {
     
  } 
} 
