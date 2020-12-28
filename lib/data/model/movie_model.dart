import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  List<int> genreIds;
  String originalLanguage;
  String originalTitle;
  String posterPath;
  bool video;
  double voteAverage;
  int voteCount;
  String overview;
  String releaseDate;
  int id;
  String title;
  bool adult;
  String backdropPath;
  double popularity;
  String mediaType;

  Movie(
      {this.genreIds,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.overview,
      this.releaseDate,
      this.id,
      this.title,
      this.adult,
      this.backdropPath,
      this.popularity,
      this.mediaType});

  Movie.fromJson(Map<String, dynamic> json) {
    genreIds = json['genre_ids'].cast<int>();
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    id = json['id'];
    title = json['title'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genre_ids'] = this.genreIds;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['id'] = this.id;
    data['title'] = this.title;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        genreIds,
        originalLanguage,
        originalTitle,
        posterPath,
        video,
        voteAverage,
        voteCount,
        overview,
        releaseDate,
        id,
        title,
        adult,
        backdropPath,
        popularity,
        mediaType
      ];
}
