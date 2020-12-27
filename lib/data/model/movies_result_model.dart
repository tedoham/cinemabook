import 'package:cinemabook/data/model/movie_model.dart';

class MoviesResultModel {
  List<Movie> movie;

  MoviesResultModel({this.movie});

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    if (json['Movie'] != null) {
      movie = new List<Movie>();
      json['Movie'].forEach((v) {
        movie.add(new Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movie != null) {
      data['Movie'] = this.movie.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
