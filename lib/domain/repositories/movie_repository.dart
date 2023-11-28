import 'package:fpdart/fpdart.dart';
import 'package:movieflix/data/models/movieItemResponse.dart';
import 'package:movieflix/domain/entities/movieDetailsEntity.dart';
import 'package:movieflix/domain/entities/movieItemEntity.dart';

abstract class MovieRepository {
  Future<Either<Exception, MovieItemResponse>> getNowPlayingMovies(int pageKey);
  Future<Either<Exception, List<MovieItemEntity>>> getTopRatedMovies();
  Future<Either<Exception, MovieDetailsEntity>> getMovieDetails(int id);
}
