import 'package:cinemabook/data/model/all_movie_model.dart';

class AllMoviesResultModel {
  List<AllMovieModel> movies;
  AllMovieModel movieDetail;

  AllMoviesResultModel({this.movies});

  AllMoviesResultModel.fromJson(Map<String, dynamic> json) {
    print("---------rrrr-----rrrrr---------");
    print(json.keys);
    print("---------rrrr-----rrrrr---------");
    if (json['results'] != null || json['adult'] != null) {
      movies = new List<AllMovieModel>();
      json['results'].forEach((v) {
        movies.add(new AllMovieModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['results'] = this.movies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
