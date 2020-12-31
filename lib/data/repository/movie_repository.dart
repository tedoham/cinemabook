import 'package:cinemabook/data/core/api_client.dart';
import 'package:cinemabook/data/model/all_movie_model.dart';
import 'package:cinemabook/data/model/all_movie_result_model.dart';
import 'package:cinemabook/data/model/movie.dart';
import 'package:cinemabook/data/model/movie_detail_model.dart';
// import 'package:cinemabook/data/model/movie_model.dart';
// import 'package:cinemabook/data/model/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  /// Throws [NetworkException].
  // Future<List<Movie>> getMovies();
  Future<List<AllMovieModel>> getMovies();
  Future<MovieDetailModel> getMovieDetail(int id);
}

class MovieRepository extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRepository(this._client);

  @override
  Future<List<AllMovieModel>> getMovies() async {
    final response = await _client.get('discover/movie');

    print(response.toString());

    final movies = AllMoviesResultModel.fromJson(response).movies; //.movies;

    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    print("-----444----66-----8-88888------00000");
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response);
    print(movie);
    return movie;
  }
}
