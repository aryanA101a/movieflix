import 'package:fpdart/src/either.dart';
import 'package:movieflix/constants.dart';
import 'package:movieflix/data/data_sources/remote_data_source.dart';
import 'package:movieflix/data/models/movieItemResponse.dart';
import 'package:movieflix/domain/entities/movieDetailsEntity.dart';
import 'package:movieflix/domain/entities/movieItemEntity.dart';
import 'package:movieflix/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  MovieRepositoryImpl({required this.movieRemoteDataSource});

  @override
  Future<Either<Exception, MovieDetailsEntity>> getMovieDetails(int id)async{
    try {
      final result = await movieRemoteDataSource.getMovieDetails(id);
      return Right(result.toEntity());
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, MovieItemResponse>> getMovieItems(
      int pageKey,MovieItemType movieItemType) async {
    try {
      final result = await movieRemoteDataSource.getNowPlayingMovies(pageKey,movieItemType);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

}
