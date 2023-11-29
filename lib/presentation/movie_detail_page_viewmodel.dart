import 'package:flutter/cupertino.dart';
import 'package:movieflix/domain/entities/movieDetailsEntity.dart';
import 'package:movieflix/domain/entities/movieItemEntity.dart';
import 'package:movieflix/domain/repositories/movie_repository.dart';

class MovieDetailPageViewModel extends ChangeNotifier {
  MovieDetailPageViewModel(this.movieRepository);
  final MovieRepository movieRepository;

  MovieDetailsEntity? _movieDetails;
  MovieDetailsEntity? get movieDetails => _movieDetails;

  fetchMovieDetails(int id) async {
    var result = await movieRepository.getMovieDetails(id);
    result.fold((l) {
      //handle exception
    }, (r) {
      _movieDetails = r;
      notifyListeners();
    });
  }

  void setInitialDetails(MovieItemEntity initialMovieDetails) {
    _movieDetails = MovieDetailsEntity(
      id: initialMovieDetails.id,
      title: initialMovieDetails.title,
      description: initialMovieDetails.description,
      poster: initialMovieDetails.poster,
    );
    fetchMovieDetails(initialMovieDetails.id);
  }
}
