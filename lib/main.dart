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
    return const CupertinoApp(
      title: 'MovieFlix',
      home: HomePage(),
    );
  }
}
