import 'package:fpdart/fpdart.dart';
import 'package:movieflix/domain/entities/movieDetailsEntity.dart';
import 'package:movieflix/domain/entities/movieItemEntity.dart';

abstract class MovieRepository {
  Future<Either<Exception, List<MovieItemEntity>>> getNowPlayingMovies();
  Future<Either<Exception, List<MovieItemEntity>>> getTopRatedMovies();
  Future<Either<Exception, MovieDetailsEntity>> getMovieDetails(int id);
}
