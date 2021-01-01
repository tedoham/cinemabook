import 'package:cinemabook/data/core/api_client.dart';
import 'package:cinemabook/data/model/CinemaSeatStatus.dart';
import 'package:cinemabook/data/model/all_movie_model.dart';
import 'package:cinemabook/data/model/all_movie_result_model.dart';
import 'package:cinemabook/data/model/movie_detail_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

abstract class MovieRemoteDataSource {
  /// Throws [NetworkException].
  Future<List<AllMovieModel>> getMovies();
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<CinemaSeatStatus> getMovieDataFromXML(String id);
  // Future<String> getXML();
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
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response);
    print(movie);

    return movie;
  }

  @override
  Future<CinemaSeatStatus> getMovieDataFromXML(String id) async {
    final moviesListXml =
        await rootBundle.loadString("assets/cinemaSeatStatus.json");
    // final moviesListXml = await rootBundle.loadString("assets/schedules.json");

    // convert xml to json
    // final myTransformer = Xml2Json();
    // myTransformer.parse(moviesListXml);
    // final jsonFromXML = myTransformer.toParker();

    // final dataJson = await json.decode(jsonFromXML);
    List<dynamic> dataJson = await json.decode(moviesListXml);

    final movieJsonData =
        dataJson.map((d) => CinemaSeatStatus.fromJson(d)).toList();

    print(movieJsonData.length);

    final foundSeat = movieJsonData.singleWhere((element) => element.id == id);

    return foundSeat;
  }
}
