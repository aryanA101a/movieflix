import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/di/locator.dart';
import 'package:movieflix/domain/entities/movieItemEntity.dart';
import 'package:movieflix/presentation/homepage.dart';
import 'package:movieflix/presentation/homepage_viewmodel.dart';
import 'package:movieflix/presentation/movie_item_widget.dart';
import 'package:provider/provider.dart';

class NowPlayingTab extends StatelessWidget {
  const NowPlayingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var loading =
        context.select<HomePageViewModel, bool>((value) => value.loading);
    var nowPlayingMovies =
        context.select<HomePageViewModel, List<MovieItemEntity>>(
            (value) => value.nowPlayingMovies);
    log(loading.toString());
    return SafeArea(
        child: loading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: nowPlayingMovies.length,
                itemBuilder: (context, index) {
                  var movieItem = nowPlayingMovies[index];
                  return MovieItemWidget(
                      imageUrl: movieItem.poster,
                      title: movieItem.title,
                      description: movieItem.description);
                })
        // Column(
        //   children: [
        //     MovieItemWidget(
        //       imageUrl:
        //           "https://image.tmdb.org/t/p/w342/8QtDhh8mnGUEyrJsaeb3kYgDRaA.jpg",
        //       title: "title",
        //       subtitle: "subtitle",
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             CupertinoPageRoute(
        //                 builder: (context) => MovieDetailScreen()));
        //       },
        //     ),
        //   ],
        // ),
        );
  }
}
