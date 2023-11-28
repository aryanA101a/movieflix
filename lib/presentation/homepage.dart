import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/constants.dart';
import 'package:movieflix/di/locator.dart';
import 'package:movieflix/domain/repositories/movie_repository.dart';
import 'package:movieflix/presentation/movie_items_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _searchTextFieldFocusNode = FocusNode();
  final tabs = [const MovieItemsTab(movieItemType: MovieItemType.nowPlaying,), const MovieItemsTab(movieItemType: MovieItemType.topRated,)];
  final MovieRepository movieRepository = locator<MovieRepository>();

  handleSearchTextFieldFocus() {
    if (_searchTextFieldFocusNode.hasFocus) {
      _searchTextFieldFocusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _searchTextFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: MovieFlixTopNavigationBar(
            searchTextFieldFocusNode: _searchTextFieldFocusNode),
      ),
      child: GestureDetector(
        onTap: handleSearchTextFieldFocus,
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.movie_filter_rounded), label: "Now Playing"),
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
      ),
    );
  }
}

class MovieFlixTopNavigationBar extends StatefulWidget {
  const MovieFlixTopNavigationBar({
    super.key,
    required FocusNode searchTextFieldFocusNode,
  }) : _searchTextFieldFocusNode = searchTextFieldFocusNode;

  final FocusNode _searchTextFieldFocusNode;

  @override
  State<MovieFlixTopNavigationBar> createState() =>
      _MovieFlixTopNavigationBarState();
}

class _MovieFlixTopNavigationBarState extends State<MovieFlixTopNavigationBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      handleSearchTextFieldFocusChanges();
    });
  }

  void handleSearchTextFieldFocusChanges() {
    widget._searchTextFieldFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget._searchTextFieldFocusNode.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: CupertinoTextField(
            focusNode: widget._searchTextFieldFocusNode,
          ),
        ),
        widget._searchTextFieldFocusNode.hasFocus
            ? Expanded(
                flex: 1,
                child: CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  child: const Text("Cancel"),
                  onPressed: () {},
                ),
              )
            : Container(
                width: 0,
              ),
      ],
    );
  }
}


