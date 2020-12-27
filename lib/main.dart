import 'dart:html';

import 'package:cinemabook/data/core/api_client.dart';
import 'package:cinemabook/data/repository/movie_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  final ApiClient _client = ApiClient(Client());
  MovieRepository movieRepository = MovieRepository(_client);
  movieRepository.getMovies();
  // runApp(MyApp());
}


