class AllMovieModel {
  bool adult;
  String backdropPath;
  int budget;
  List<Genres> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  int revenue;
  int runtime;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  AllMovieModel(
      {this.adult,
      this.backdropPath,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  AllMovieModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] == null ? null : json["adult"];
    backdropPath = json['backdrop_path'] == null ? null : json["backdrop_path"];
    budget = json['budget'] == null ? null : json["budget"];
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
    homepage = json['homepage'] == null ? null : json["homepage"];
    id = json['id'];
    imdbId = json['imdb_id'] == null ? null : json["imdb_id"];
    originalLanguage =
        json['original_language'] == null ? null : json["original_language"];
    originalTitle =
        json['original_title'] == null ? null : json["original_title"];
    overview = json['overview'] == null ? null : json["overview"];
    popularity =
        json['popularity'] == null ? null : json["popularity"].toDouble();
    posterPath = json['poster_path'] == null ? null : json["poster_path"];
    releaseDate = json['release_date'] == null ? null : json["release_date"];
    revenue = json['revenue'] == null ? null : json["revenue"];
    runtime = json['runtime'] == null ? null : json["runtime"];
    status = json['status'] == null ? null : json["status"];
    tagline = json['tagline'] == null ? null : json["tagline"];
    title = json['title'] == null ? null : json["title"];
    video = json['video'] == null ? null : json["video"];
    voteAverage =
        json['vote_average'] == null ? null : json["vote_average"].toDouble();
    voteCount = json['vote_count'] == null ? null : json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult == null ? null : adult;
    data['backdrop_path'] = this.backdropPath == null ? null : backdropPath;
    data['budget'] = this.budget == null ? null : budget;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this.homepage == null ? null : homepage;
    data['id'] = this.id;
    data['imdb_id'] = this.imdbId == null ? null : imdbId;
    data['original_language'] =
        this.originalLanguage == null ? null : originalLanguage;
    data['original_title'] = this.originalTitle == null ? null : originalTitle;
    data['overview'] = this.overview == null ? null : overview;
    data['popularity'] = this.popularity == null ? null : popularity;
    data['poster_path'] = this.posterPath == null ? null : posterPath;
    data['release_date'] = this.releaseDate == null ? null : releaseDate;
    data['revenue'] = this.revenue == null ? null : revenue;
    data['runtime'] = this.runtime == null ? null : runtime;
    data['status'] = this.status == null ? null : status;
    data['tagline'] = this.tagline == null ? null : tagline;
    data['title'] = this.title == null ? null : title;
    data['video'] = this.video == null ? null : video;
    data['vote_average'] = this.voteAverage == null ? null : voteAverage;
    data['vote_count'] = this.voteCount == null ? null : voteCount;
    return data;
  }
}

class Genres {
  int id;
  String name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
