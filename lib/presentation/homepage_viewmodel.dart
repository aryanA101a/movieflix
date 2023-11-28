import 'package:flutter/material.dart';
import 'package:movieflix/domain/entities/movieItemEntity.dart';
import 'package:movieflix/domain/repositories/movie_repository.dart';

class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel(MovieRepository movieRepository) {
    fetchNowPlayingMovies(movieRepository);
  }

  void fetchNowPlayingMovies(MovieRepository movieRepository) async {
    _loading = true;
    notifyListeners();
    var result = await movieRepository.getNowPlayingMovies();
    result.fold(
      (l) {
        //todo:handle exception
      },
      (r) => _nowPlayingMovies = r,
    );
    _loading = false;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;

  List<MovieItemEntity> _nowPlayingMovies = [];
  List<MovieItemEntity> get nowPlayingMovies => _nowPlayingMovies;
}
