import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'data/core/api_client.dart';
import 'data/repository/movie_repository.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRepository(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepository(getItInstance()));
}
