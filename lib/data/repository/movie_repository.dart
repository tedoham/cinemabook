import 'package:cinemabook/data/core/api_client.dart';
import 'package:cinemabook/data/model/all_movie_model.dart';
import 'package:cinemabook/data/model/all_movie_result_model.dart';
import 'package:cinemabook/data/model/movie.dart';
// import 'package:cinemabook/data/model/movie_model.dart';
// import 'package:cinemabook/data/model/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  /// Throws [NetworkException].
  // Future<List<Movie>> getMovies();
  Future<List<AllMovieModel>> getMovies();
}

class MovieRepository extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRepository(this._client);

  @override
  Future<List<AllMovieModel>> getMovies() async {
    // Future<List<Movie>> getMovies() async {
    // final response = await _client.get('trending/movie/day');
    // final response = await _client.get('trending/movie/week');
    final response = await _client.get('discover/movie');
    // final response = await _client.get('movie/latest');
    // final response = await _client.get('movie/now_playing');
    // final response = await _client.get('movie/464052');
    print(response.toString());
    // print("======5645======");
    // final movies = MoviesResultModel.fromJson(response).movies;
    final movies = AllMoviesResultModel.fromJson(response).movies; //.movies;
    // final movies = AllMovieModel.fromJson(response); //.movies;
    // print(movies);
    // print("---------56------");
    return movies;
    // return null;
  }
}
