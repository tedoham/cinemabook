import 'package:cinemabook/data/core/api_client.dart';
import 'package:cinemabook/data/model/movie_model.dart';
import 'package:cinemabook/data/model/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  /// Throws [NetworkException].
  Future<List<Movie>> getMovies();
}

class MovieRepository extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRepository(this._client);

  @override
  Future<List<Movie>> getMovies() async {
    final response = await _client.get('trending/movie/day');
    // print(response);
    // print("======5645======");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    print("---------56------");
    return movies;
  }
}
