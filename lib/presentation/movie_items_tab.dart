import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieflix/constants.dart';
import 'package:movieflix/domain/entities/movieDetailsEntity.dart';
import 'package:movieflix/domain/entities/movieItemEntity.dart';
import 'package:movieflix/presentation/homepage_viewmodel.dart';
import 'package:movieflix/presentation/movie_detail_screen.dart';
import 'package:movieflix/presentation/movie_item_widget.dart';
import 'package:provider/provider.dart';

class MovieItemsTab extends StatelessWidget {
  const MovieItemsTab({super.key, required this.movieItemType});
  final MovieItemType movieItemType;

  @override
  Widget build(BuildContext context) {
    PagingController<int, MovieItemEntity> pagingController;
    switch (movieItemType) {
      case MovieItemType.nowPlaying:
        pagingController =
            context.read<HomePageViewModel>().nowPlayingTabPagingController;
      case MovieItemType.topRated:
        pagingController =
            context.read<HomePageViewModel>().topRatedTabPagingController;
    }

    return SafeArea(
      child: PagedListView<int, MovieItemEntity>(
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, index) {
            return Column(
              children: [
                MovieItemWidget(
                  imageUrl: item.poster,
                  title: item.title,
                  description: item.description,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => MovieDetailScreen(
                              item),
                        ));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
