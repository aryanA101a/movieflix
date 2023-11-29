import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieflix/di/locator.dart';
import 'package:movieflix/presentation/homepage.dart';
import 'package:movieflix/presentation/homepage_viewmodel.dart';
import 'package:movieflix/presentation/movie_detail_page_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  setupLocator();
  runApp(const MovieFlix());
}

class MovieFlix extends StatelessWidget {
  const MovieFlix({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => locator<HomePageViewModel>(),
          ),
          ChangeNotifierProvider(
            create: (context) => locator<MovieDetailPageViewModel>(),
          ),
        ],
        child: const CupertinoApp(
          title: 'MovieFlix',
          home: HomePage(),
        ));
  }
}
