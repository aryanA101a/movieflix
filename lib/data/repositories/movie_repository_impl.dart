import 'package:fpdart/src/either.dart';
import 'package:movieflix/data/data_sources/remote_data_source.dart';
import 'package:movieflix/domain/entities/movieDetailsEntity.dart';
import 'package:movieflix/domain/entities/movieItemEntity.dart';
import 'package:movieflix/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  MovieRepositoryImpl({required this.movieRemoteDataSource});

  @override
  Future<Either<Exception, MovieDetailsEntity>> getMovieDetails(int id) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<MovieItemEntity>>> getNowPlayingMovies() async {
    try {
      final result = await movieRemoteDataSource.getNowPlayingMovies();
      return Right(result.map((e) => e.toEntity()).toList());
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<MovieItemEntity>>> getTopRatedMovies() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }
}
