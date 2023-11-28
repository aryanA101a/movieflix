import 'package:fpdart/fpdart.dart';
import 'package:movieflix/constants.dart';
import 'package:movieflix/data/models/movieItemResponse.dart';
import 'package:movieflix/domain/entities/movieDetailsEntity.dart';

abstract class MovieRepository {
  Future<Either<Exception, MovieItemResponse>> getMovieItems(int pageKey, MovieItemType movieItemType);
  Future<Either<Exception, MovieDetailsEntity>> getMovieDetails(int id);
}
