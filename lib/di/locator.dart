import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movieflix/data/data_sources/remote_data_source.dart';
import 'package:movieflix/data/repositories/movie_repository_impl.dart';
import 'package:movieflix/domain/repositories/movie_repository.dart';
import 'package:movieflix/presentation/homepage_viewmodel.dart';

final locator = GetIt.instance;

void setupLocator() {
  //homepage viewmodel
  locator.registerLazySingleton<HomePageViewModel>(
      () => HomePageViewModel(locator()));

  //repository
  locator.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(movieRemoteDataSource: locator()));

  //data source
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));

  //http client
  locator.registerLazySingleton(() => Client());
}
