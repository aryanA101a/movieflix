import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieflix/di/locator.dart';
import 'package:movieflix/presentation/homepage.dart';
import 'package:movieflix/presentation/homepage_viewmodel.dart';
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
    return ChangeNotifierProvider(
      create: (context) => locator<HomePageViewModel>(),
      child: CupertinoApp(
        title: 'MovieFlix',
        home: HomePage(),
      ),
    );
  }
}
