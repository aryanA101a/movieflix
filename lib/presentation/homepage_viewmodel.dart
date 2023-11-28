import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieflix/domain/entities/movieItemEntity.dart';
import 'package:movieflix/domain/repositories/movie_repository.dart';

class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel(this.movieRepository) {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchNowPlayingMoviesPage(pageKey: pageKey);
    });
  }

  final MovieRepository movieRepository;

  void _fetchNowPlayingMoviesPage({required int pageKey}) async {
    var result = await movieRepository.getNowPlayingMovies(pageKey);
    result.fold(
      (l) {
        _pagingController.error = l;
      },
      (r) {
        var newItems = r.results
            .filter(
              (t) => !(t.posterPath == null ||
                  (t.title == null && t.originalTitle == null) ||
                  t.overview == null),
            )
            .map((e) => e.toEntity())
            .toList();
        final isLastPage = r.totalPages == pageKey;

        if (isLastPage) {
          _pagingController.appendLastPage(
            newItems,
          );
        } else {
          _pagingController.appendPage(newItems, pageKey + 1);
        }
      },
    );
  }

  bool _loading = false;
  bool get loading => _loading;

  List<MovieItemEntity> _nowPlayingMovies = [];
  List<MovieItemEntity> get nowPlayingMovies => _nowPlayingMovies;

  final PagingController<int, MovieItemEntity> _pagingController =
      PagingController(firstPageKey: 1);
  PagingController<int, MovieItemEntity> get pagingController =>
      _pagingController;
}
