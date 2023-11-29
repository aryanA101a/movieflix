import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/constants.dart';
import 'package:movieflix/di/locator.dart';
import 'package:movieflix/domain/entities/movieItemEntity.dart';
import 'package:movieflix/domain/repositories/movie_repository.dart';
import 'package:movieflix/presentation/homepage_viewmodel.dart';
import 'package:movieflix/presentation/movie_detail_screen.dart';
import 'package:movieflix/presentation/movie_item_widget.dart';
import 'package:movieflix/presentation/movie_items_tab.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabs = [
    const MovieItemsTab(
      movieItemType: MovieItemType.nowPlaying,
    ),
    const MovieItemsTab(
      movieItemType: MovieItemType.topRated,
    )
  ];
  final MovieRepository movieRepository = locator<MovieRepository>();
  @override
  Widget build(BuildContext context) {
    var searchResults =
        context.select<HomePageViewModel, List<MovieItemEntity>>(
            (value) => value.searchResults);
    var showSearchResults = context
        .select<HomePageViewModel, bool>((value) => value.showSearchResults);

    log(showSearchResults.toString());
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: MovieFlixTopNavigationBar(
          searchTextFieldFocusNode: FocusNode(),
        ),
      ),
      child: Stack(
        children: [
          CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.movie_filter_rounded),
                    label: "Now Playing"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star_rounded),
                  label: "Top Rated",
                )
              ],
            ),
            tabBuilder: (context, index) {
              return tabs[index];
            },
          ),
          if (showSearchResults) SearchResults(searchResults: searchResults)
        ],
      ),
    );
  }
}

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
    required this.searchResults,
  });

  final List<MovieItemEntity> searchResults;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      height: double.infinity,
      child: ListView.builder(
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            var item = searchResults[index];
            return MovieItemWidget(
              imageUrl: item.poster,
              title: item.title,
              description: item.description,
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MovieDetailScreen(item),
                    ));
              },
            );
          }),
    );
  }
}

class MovieFlixTopNavigationBar extends StatefulWidget {
  const MovieFlixTopNavigationBar(
      {super.key, required this.searchTextFieldFocusNode});

  final FocusNode searchTextFieldFocusNode;
  @override
  State<MovieFlixTopNavigationBar> createState() =>
      _MovieFlixTopNavigationBarState();
}

class _MovieFlixTopNavigationBarState extends State<MovieFlixTopNavigationBar> {
  @override
  void initState() {
    widget.searchTextFieldFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var showSearchResults = context
        .select<HomePageViewModel, bool>((value) => value.showSearchResults);
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: CupertinoTextField(
            onChanged: (text) {
              if (text.isNotEmpty) {
                context.read<HomePageViewModel>().executeSearch(text);
              }
            },
            focusNode: widget.searchTextFieldFocusNode,
          ),
        ),
        if (showSearchResults)
          Expanded(
            flex: 1,
            child: CupertinoButton(
              padding: const EdgeInsets.all(0),
              child: const Text("Cancel"),
              onPressed: () {
                widget.searchTextFieldFocusNode.unfocus();
                locator<HomePageViewModel>().cancelSearch();
              },
            ),
          ),
      ],
    );
  }
}
