import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = "Wish";
    final description =
        "Asha, a sharp-witted idealist, makes a wish so powerful that it is answered by a cosmic force – a little ball of boundless energy called Star. Together, Asha and Star confront a most formidable foe - the ruler of Rosas, King Magnifico - to save her community and prove that when the will of one courageous human connects with the magic of the stars, wondrous things can happen.";
    final year = "2014";
    final userScore = 6.8;
    final runtime = 136;
    final categories = ["category1"];
    final budget = 175000000;
    final revenue = 49000000;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                    "https://image.tmdb.org/t/p/original/8QtDhh8mnGUEyrJsaeb3kYgDRaA.jpg"))),
        child: ListView(children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .7,
          ),
          MovieDetailWidget(
            title: title,
            userScore: userScore,
            year: year,
            categories: categories,
            runtime: runtime,
            description: description,
            budget: budget,
            revenue: revenue,
          )
        ]),
      ),
    );
  }
}

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({
    super.key,
    required this.title,
    required this.userScore,
    required this.year,
    required this.categories,
    required this.runtime,
    required this.description,
    required this.budget,
    required this.revenue,
  });

  final String title;
  final double userScore;
  final String year;
  final List<String> categories;
  final int runtime;
  final String description;
  final int budget;
  final int revenue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      // height: 300,
      decoration: const BoxDecoration(color: Colors.black87),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: const TextStyle(
                      color: CupertinoColors.systemGrey4,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "♛ ${(userScore * 10).toInt()}%",
                style: const TextStyle(
                  color: CupertinoColors.systemGrey2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "$year ‧ ${categories.first} ‧ ${runtime ~/ 60}h ${runtime % 60}m ",
            style: const TextStyle(color: CupertinoColors.systemGrey3),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            description,
            style: const TextStyle(color: CupertinoColors.systemGrey2, fontSize: 15),
          ),
          const SizedBox(
            height: 12,
          ),
          RichText(
            text: TextSpan(
              style:
                  const TextStyle(color: CupertinoColors.systemGrey2, fontSize: 16),
              children: <TextSpan>[
                const TextSpan(
                  text: 'Budget\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "\$$budget",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          RichText(
            text: TextSpan(
              style:
                  const TextStyle(color: CupertinoColors.systemGrey2, fontSize: 16),
              children: <TextSpan>[
                const TextSpan(
                  text: 'Revenue\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "\$$revenue",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
