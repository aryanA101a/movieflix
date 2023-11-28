import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieflix/constants.dart';
import 'package:movieflix/domain/entities/movieItemEntity.dart';
import 'package:movieflix/domain/repositories/movie_repository.dart';

class HomePageViewModel extends ChangeNotifier {
  HomePageViewModel(this.movieRepository) {
    init();
  }
  final MovieRepository movieRepository;

  void init() {
    _nowPlayingTabPagingController.addPageRequestListener((pageKey) {
      _fetchMovieItemsPage(
          pageKey: pageKey,
          movieItemType: MovieItemType.nowPlaying,
          pagingController: _nowPlayingTabPagingController);
    });
    _topRatedTabPagingController.addPageRequestListener((pageKey) {
      _fetchMovieItemsPage(
          pageKey: pageKey,
          movieItemType: MovieItemType.topRated,
          pagingController: _topRatedTabPagingController);
    });
  }

  void _fetchMovieItemsPage(
      {required int pageKey,
      required MovieItemType movieItemType,
      required PagingController pagingController}) async {
    log("fetch $movieItemType");
    var result = await movieRepository.getMovieItems(pageKey, movieItemType);
    result.fold(
      (l) {
        pagingController.error = l;
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
          pagingController.appendLastPage(
            newItems,
          );
        } else {
          pagingController.appendPage(newItems, pageKey + 1);
        }
      },
    );
  }

  bool _loading = false;
  bool get loading => _loading;

  List<MovieItemEntity> _nowPlayingMovies = [];
  List<MovieItemEntity> get nowPlayingMovies => _nowPlayingMovies;

  final PagingController<int, MovieItemEntity> _nowPlayingTabPagingController =
      PagingController(firstPageKey: 1);
  PagingController<int, MovieItemEntity> get nowPlayingTabPagingController =>
      _nowPlayingTabPagingController;

  final PagingController<int, MovieItemEntity> _topRatedTabPagingController =
      PagingController(firstPageKey: 1);
  PagingController<int, MovieItemEntity> get topRatedTabPagingController =>
      _topRatedTabPagingController;
}
