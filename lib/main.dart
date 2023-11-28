import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/homepage.dart';

void main() {
  runApp(const MovieFlix());
}

class MovieFlix extends StatelessWidget {
  const MovieFlix({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'MovieFlix',
      theme: CupertinoThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      home: const HomePage(),
    );
  }
}
